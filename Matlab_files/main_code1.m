%store_numbers = unique(nov_2015(:,3));
%store_numbers1 = unique(nov_2015(:,4));
flag= exist('nov_2015.mat');
if flag == 1
else
    load('nov_2015.mat');
end



no_of_stores = length(unique(nov_2015(:,10)));
different_hrs = length(unique(nov_2015(:,8)));
nov_work_indices = find(nov_2015(:,7)==1);
nov_w = nov_2015(nov_work_indices,:);
no_of_days = length(nov_w(:,1))/(no_of_stores*different_hrs);
%for jj =96
for ii = 1:no_of_stores
        Energy = nov_w(ii:no_of_stores:end,5);
        Store_ID = nov_w(ii:no_of_stores:end,10); %jan make it 3 again
        struct.store.store_ID{ii} = Store_ID(ii);
        Hours = nov_w(ii:no_of_stores:end,8);
        %Store.ID=nov_2015(ii:238:end,5);
        %Store2.ID=nov_2015(ii:238:end,8);
        %struct.store.energy{ii,1} = Energy;
        %struct.store.hours{ii,1} = Hours;
        for jj = 1:different_hrs
        %struct.store.hours{ii,jj} = Hours(jj:96:end,:);
        struct.store.energy{ii,jj} = Energy(jj:different_hrs:end,:);
        
        struct.store.hours{ii,1} = Hours(ii,:);
        [x,y,m,n]=Outlier_function1(Energy(jj:different_hrs:end,:));
        %[x,y,]=Outlier_function1(Energy(jj:different_hrs:end,:));
        struct.store.majorfence{ii,jj} = x;
        struct.store.minorfence{ii,jj} =y;
        struct.store.mean{ii,jj} =m;
        struct.store.std{ii,jj} =n;
            for kk = 1:no_of_days
                %struct.store.hours{ii,jj,kk} = Hours(jj:96:end,:);
                %struct.store.energy{ii,jj,kk} = Energy(jj:96:end,:);
                if struct.store.energy{ii,jj}(kk,1) >= struct.store.minorfence{ii,jj}(1,1) & struct.store.energy{ii,jj}(kk,1) <= struct.store.minorfence{ii,jj}(1,2);
                struct.store.labelOL1{ii,jj}(kk,1) =1; %prev kk was here too
                struct.store.normal{ii,jj}(kk,1) = struct.store.energy{ii,jj}(kk,1);
                %struct.store.labelOL{ii,jj,kk}=1;
                %struct.store.energy1{ii,jj,kk} = Energy(jj:96:end,:);
                elseif struct.store.energy{ii,jj}(kk,1) >= struct.store.minorfence{ii,jj}(1,2) && struct.store.energy{ii,jj}(kk,1) <= struct.store.majorfence{ii,jj}(1,2)
                    struct.store.labelOL1{ii,jj}(kk,1) =0;
                elseif struct.store.energy{ii,jj}(kk,1) >= struct.store.majorfence{ii,jj}(1,2)
                    struct.store.labelOL1{ii,jj}(kk,1) =0;
                %elseif struct.store.energy{ii,jj}(kk,1) <= struct.store.minorfence{ii,jj}(1,1) && struct.store.energy{ii,jj}(kk,1) >= struct.store.majorfence{ii,jj}(1,1)
                    %struct.store.labelOL1{ii,jj}(kk,1) =-1; %prev kk was here too
                %elseif struct.store.energy{ii,jj}(kk,1) <= struct.store.majorfence{ii,jj}(1,1)
                    %struct.store.labelOL1{ii,jj}(kk,1) =-10;
                else
                    struct.store.labelOL1{ii,jj}(kk,1) =0;
                %struct.store.labelOL{ii,jj,kk}=0;
                end
                
            end
        end
        
        
end    
    
    
    
%e