flag= exist('nov_2015.mat');
if flag == 1
else
    load('nov_2015.mat');
    main_code1
end
%main_code1
%flag_data=exist('data_stores');
%if flag_data==0
%data_stores=load('data_stores');
%data_stores=data_stores.data_stores ; 
%StoresModels=Anamoly_detect_norm_dist(data_stores);%Produces Models for each stores
%end

%beta=input('Enter the hyperparamter');
%test_data=input('Enter the test data in the compitable format');
beta = input('input beta');
store_num = input('store number');
input_time = input('time');
input_power = input('power');

[a, b] = data_extraction(beta,store_num,input_time,input_power,struct);
%flag_anamoly=test_input(test_data,beta);