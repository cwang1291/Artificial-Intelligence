%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                   Main script for 24-787 HW1
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all hidden; 

%% Modify the following variables to try different oracles and sample sizes
oracle_number = 5;  %which oracle to use
n_train = 100;       %number of training examples
n_test = 100;       %number of test examples

%% No need to modify anything below this line.
%  ------------------------------------------------------------------------
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

fprintf('-------------------------- Result ----------------------------\n');
fprintf('Oracle \t #Training Sample \t #Test Sample \t Error Rate (%%)\n');
fprintf('%6d \t %16d \t %12d \t %4.2f\n', oracle_number, n_train, n_test, error_rate);

% visualize the tree
my_dt.plot();