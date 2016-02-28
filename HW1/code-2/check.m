clc; clear all; close all hidden; 
A = [1 2 8 15 12 3];         %which oracle to use
B = [50 500 50 50 100 100];  %number of training examples
C = 100;                     %number of test examples
D = [15.0 0.0 0.0 20.0 0.0 3.0];
count = 0;                   %counter to keep track of number of mismatches
for i=1:6
    oracle_number = A(i); n_train = B(i); n_test = C;
    % Request training examples
    [train_attrib,train_class] = trog_DataManager.getTrainingData(oracle_number,n_train);
    
    % Create and train your decision tree using the training data reqested
    my_dt = DecisionTree();
    my_dt.train(train_attrib,train_class);
    
    % Request testing examples
    test_attrib = trog_DataManager.getTestData(oracle_number, n_test);
    
    % Classify the emotions of the test examples from trog-win.exe
    test_class = my_dt.classify(test_attrib);
    
    % Submit your classification to trog, compare with the correct
    % classification and report the error rate (%)
    [error_rate,correct_class] = trog_DataManager.checkAccuracy(oracle_number,test_class,n_test);
    if error_rate ~= D(i)
        count = count+1;
    end
end
fprintf('the number of mismatches are %d\n',count);