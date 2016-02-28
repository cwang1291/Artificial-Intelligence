classdef trog_DataManager < handle
    %trog_DataManager class: data manager interface for trog-win.exe
    % Do not instantiate object of this class. Use the static methods instead.
    % 
    % Note to students: These are auxilary functions for 24-787 HW1.
    % You will notice the lack of comments here. But rest assured, there is 
    % NO need to modify this file, NOR any need to study the cryptic 
    % functions in this file.
    
    methods
        function obj = trog_DataManager()
            error(['Do not instantiate object of this class. ', ...
                'Use the static methods instead.']);
        end
    end
    
    methods(Static)
        function [attrib class] = getTrainingData(oracle_number, sample_size)
            %[attrib class] = getTrainingData(oracle_number, sample_size)
            cmd = ['trog-win.exe ' num2str(oracle_number) ' examples ' num2str(sample_size) ' > nul'];
            dos(cmd);
            disp(['Getting ' num2str(sample_size) ' training examples from Oracle ' num2str(oracle_number)]);
            
            fid = fopen('trog.dat');
            fmt = [repmat('%1d', 1, 15)  '%38s %s'];
            data_train_cells = textscan(fid,fmt,'Delimiter','', 'Whitespace', '');
            fclose(fid);
            
            attrib = [data_train_cells{:,1:15}];
            class = strcmp(data_train_cells{17}, 'joy');
        end
        
        function attrib = getTestData(oracle_number, sample_size)
            %attrib = getTestData(oracle_number, sample_size)
            cmd = ['trog-win.exe ' num2str(oracle_number) ' test ' num2str(sample_size) ' > nul'];
            dos(cmd);
            disp(['Getting ' num2str(sample_size) ' test examples from Oracle ' num2str(oracle_number)]);
            
            fid = fopen('trog.tst');
            fmt = [repmat('%1d', 1, 15)  '%s'];
            data_test_cells = textscan(fid,fmt,'Delimiter','', 'Whitespace', '');
            fclose(fid);
            
            attrib = [data_test_cells{:,1:15}];
        end
        
        function [error_rate_percentage correct_class] = checkAccuracy(oracle_number, class, sample_size)
            %[error_rate correct_class] = checkTestAccuracy(oracle_number, class, sample_size)
            fid = fopen('trog.tst');
            fmt = '%48s';
            test_data_cells = textscan(fid,fmt,'Delimiter','', 'Whitespace', '');
            test_data_cells = test_data_cells{1};
            test_data_cells = test_data_cells(1:2:end);
            fclose(fid);
            
            class_str = cell(numel(class), 1);
            class_str(logical(class)) = cellstr(repmat('  joy', numel(class(class==1)), 1));
            class_str(~logical(class)) = cellstr(repmat('  despair', numel(class(class==0)), 1));
           
            arrow_str = cellstr(repmat('  ->', numel(class), 1));
            
            chk_data = strcat(test_data_cells, arrow_str, class_str);
            chk_data = char(chk_data);
            
            % sub
            dlmwrite('trog.sub', chk_data, 'delimiter', '');
            disp(['Checking accuracy with Oracle ' num2str(oracle_number)]);
            
            cmd = ['trog-win.exe ' num2str(oracle_number) ' submit > trog.rst'];
            dos(cmd);
            
            % chk
            fid = fopen('trog.rst');
            textscan(fid, '%s', 1, 'Delimiter','\n', 'Whitespace', '');
            fmt = '%65s %7s %s';
            correct_class_cells = textscan(fid, fmt, sample_size, 'Delimiter','\n', 'Whitespace', '' );

            summary = textscan(fid, '%s', 1, 'Delimiter','\n', 'Whitespace', '');
            summary = summary{1};
            fprintf('%s\n', strtrim(summary{1}));
            
            fclose(fid);
            correct_class_str = strtrim(correct_class_cells{2});
            correct_class = strcmp(correct_class_str, 'joy');
            error_rate_percentage = sum(sum(correct_class~=class)) / sample_size * 100;
        end
    end
end