%storesX = zeros(685440,1);
%energyX =zeros(685440,1);
%OLX=zeros(114240,1);
OLX2=zeros(length(nov_w(:,1)),1);
a=0;
%b=0;
for n1 = 1:no_of_days
    for n2 = 1:different_hrs
        for n3 = 1:no_of_stores
            a=a+1;
            %storesX(a)= vertcat(struct.store.store_ID{n3,n1}(n2));
            %energyX(a)=vertcat(struct.store.energy{n3,n1}(n2));
            OLX2(a)= vertcat(struct.store.labelOL1{n3,n2}(n1));
        end
    %fprintf('struct.store.store_ID{%d,1}(%d),',aoi,akx);
    end
end