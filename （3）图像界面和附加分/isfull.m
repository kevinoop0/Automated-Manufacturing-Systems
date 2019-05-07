function [flag,full_index]=isfull(CapaofP,checktable,first_repeat_ind,minfbm_combine)
count=0;

for i=1:length(first_repeat_ind)
%     i=2;
   %寻找与第一个索引值相同元素的全部索引
    repeat_ind=find(checktable==checktable(first_repeat_ind(i)));
    %删去相同P的个数
    temp=count*ones(1,size((repeat_ind),2) ) ;
    %在同一个P中的工件加起来
    minfbm_combine(:,first_repeat_ind(i)-count)=sum(minfbm_combine(:,repeat_ind-temp),2);
    %删去第一个索引
    temp(1)=[];
    %后面取为空
    minfbm_combine(:, (repeat_ind(1,2:end)-temp) )=[];
    count=count+length(repeat_ind)-1;
end
[row,col]=size(minfbm_combine);

unique_minfbm_checktable=unique(checktable);
flag=ones(size(minfbm_combine,1),1);
full_index=zeros(row,col);
for i=1:row
%     i=1
    [~,col]=find(minfbm_combine(i,:)~=0);
    for j =1:length(col)
%         j=1
        ind=col(j);
        if minfbm_combine(i,ind)~=CapaofP(unique_minfbm_checktable(ind)+1);
            flag(i,1)=0;%只要有一个p不满载就跳出循环      
        else
            full_index(i,ind)=1;
       end
    end
end