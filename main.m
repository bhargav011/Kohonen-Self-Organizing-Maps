clc; close all; clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% kOHONEN SELF-ORGANIZING MAPS (KSOM)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
%% PART 1
vector_train = [1 1 0 0; 1 0 0 0; 0 0 0 1; 0 0 1 1]; %training data
learning_rate = 0.6; %learning_rate = alfa
disp('$$$$$$$$$ PART_1_RESULT $$$$$$$$$$$$$$$$ :');
%num = 1;
weight_change = SOM_train(vector_train, learning_rate, 1);

vector_test = [0 0 0 0.9
            0 0 0.8 0.9
            0.7 0 0 0
            0.7 0.9 0 0]; %test data 
        
SOM_test(vector_test, weight_change, 1);

%% part 2
control_data = load('control.txt');
patient_data = load('patient.txt');
training_data = [control_data; patient_data];
%num = 2;
disp('$$$$$$$$$$$ part_2 Result $$$$$$$$$$  ');
[weight_change,clu_con_pat] = SOM_train(training_data, learning_rate, 2);
%SOM_test(training_data, weight_change, 2, clu_con_pat);
%% part 3

%Data = load('BHARGAV_SHAH.txt');
Data = load('test_two.txt');
disp(' $$$$$$$$$$$$$$$ PART 3 RESULT $$$$$$$$$$$$$$');
SOM_test(Data, weight_change, 2, clu_con_pat);










