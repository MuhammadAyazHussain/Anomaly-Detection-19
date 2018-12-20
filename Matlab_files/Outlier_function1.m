function [ major_fence,minor_fence,mean_data,std_dev ] = Outlier_function1( data_array )
%function [ major_fence,minor_fence ] = Outlier_function1( data_array )
%OUTLIER_FUNCTION1 Summary of this function goes here
%   Detailed explanation goes here
    
    if length(unique(data_array))>3 % if the unique values in data_array are less than 2 
                                    %then classical OL detector won't work,
                                    %it will show NAN in struct
    if length(data_array) >= 8
    sorted_data = sort(data_array);
    
    

    q2 = median(sorted_data);
    lower_quartile_indices = find(sorted_data <q2);
    lower_quartile_data = sorted_data(lower_quartile_indices);
    q1 = median(lower_quartile_data);

    upper_quartile_indices = find(sorted_data >q2);
    upper_quartile_data = sorted_data(upper_quartile_indices);
    q3 = median(upper_quartile_data);

    IQR = q3-q1;
    inner_fence_upper_range = q3 + IQR*1.5;
    inner_fence_lower_range = q1 - IQR*1.5;
    minor_fence = [inner_fence_lower_range,inner_fence_upper_range];

    outer_fence_upper_range = q3 +IQR*3;
    outer_fence_lower_range = q1 - IQR*3;
    major_fence = [outer_fence_lower_range,outer_fence_upper_range];
    mean_data = mean(data_array);
    std_dev = std(data_array);
    %mean_data = mean(data_array>=inner_fence_lower_range & data_array<=outer_fence_upper_range);
    %std_dev = std(data_array>=inner_fence_lower_range & data_array<=outer_fence_upper_range);
    elseif length(data_array) >3 & length(data_array)<8
            sorted_data = sort(data_array);

    q2 = median(sorted_data);
    lower_quartile_indices = find(sorted_data <q2);
    lower_quartile_data = sorted_data(lower_quartile_indices);
    q1 = median(lower_quartile_data);

    upper_quartile_indices = find(sorted_data >q2);
    upper_quartile_data = sorted_data(upper_quartile_indices);
    q3 = median(upper_quartile_data);

    IQR = q3-q1;
    inner_fence_upper_range = q3 + IQR*0.1;
    inner_fence_lower_range = q1 - IQR*0.9;
    minor_fence = [inner_fence_lower_range,inner_fence_upper_range];

    outer_fence_upper_range = q3 +IQR*0.2;
    outer_fence_lower_range = q1 - IQR;
    major_fence = [outer_fence_lower_range,outer_fence_upper_range];
    mean_data = mean(data_array>=inner_fence_lower_range && data_array<=outer_fence_upper_range);
    std_dev = std(data_array>=inner_fence_lower_range && data_array<=outer_fence_upper_range);
    end
    else
        minor_fence = [mean(data_array)-1.3*mean(data_array),mean(data_array)+1.3*mean(data_array)];
        major_fence = [mean(data_array)-1.5*mean(data_array),mean(data_array)+1.5*mean(data_array)];
        mean_data = mean(data_array);
        std_dev = std(data_array);
    end
    
    
end


