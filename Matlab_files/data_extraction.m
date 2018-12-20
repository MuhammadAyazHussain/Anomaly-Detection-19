function [mean1,std1] = data_extraction(beta,store_number,hour,power,struct)

%function [mean1,std1] = data_extraction(store_number,hour)

%test_month=month;

%month_cell=StoresModels.Months;
%month_list=cell2mat(StoresModels.Months);
%test_store_row=find(month_list==test_month);
%test_store_number=store_number;
%store_numbers_cells = struct.store.store_ID;
%store_numbers_matrix=cell2mat(StoresModels.StoreNumber);
%store_numbers_array=store_numbers_matrix(1,:);
%test_store_id=test_data(1);
%test_time=test_data(2);
%test_energy_consumption=test_data(3);

store_number_cell = cell2mat(struct.store.store_ID);
selected_number = find(store_number_cell==store_number);


store_hour_cell = cell2mat(struct.store.hours);
selected_hour = find(store_hour_cell(1:96)==hour);

mean1 = struct.store.mean(selected_number,selected_hour);
std1 = struct.store.std(selected_number,selected_hour);


meanX = cell2mat(mean1);
stdX = cell2mat(std1);
%lower_limit = meanX;
%md = lower_limit+meanX;
%disp(md);
lower_limit= meanX-beta*stdX; % beta:learning parameter
upper_limit=meanX+beta*stdX;

if power>=lower_limit && power<upper_limit
    a='Given test inputs is not Anomaly';
    disp(a);
    %status_input=0;
elseif power>=upper_limit && power<=2*upper_limit
    b='Given test input is a medium Anomaly';
    disp(b);
    %status_input=1;
    
elseif power>=2*upper_limit 
    c='Given test input is a huge Anomaly';
    disp(c);
    %status_input=1; 
elseif power<lower_limit
    d='Given test input is a under consumption Anomaly';
    disp(d);
    %status_input=1;
else
    e='Given test inputs is small Anomaly';
    disp(e);
    %status_input=1;
end



%if day_tag==1
%    selected_data = StoresModels.DataWorkingDays{test_store_row,test_store_column};
%    number_of_samples=length(selected_data(:,1));
    
%elseif day_tag==0
%    selected_data = StoresModels.DataOffDays{test_store_row,test_store_column};
%    number_of_samples=length(selected_data(:,1));
    
%end

%working_hour=hour;

%mean_std_selected_data=selected_data(working_hour+1,:);
end