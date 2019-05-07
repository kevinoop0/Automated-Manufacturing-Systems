function [num_of_M_p,constraint_of_M_p]=One_step_ahead_deadlock(num_of_minfbm,num_of_M_s,num_of_M_f,CapaofP,checktable,inci)
% clc;clear
%%init
load('sparse_matrix.mat');
inci=full(spconvert(sparse_matrix));
num_of_minfbm=34;
num_of_M_s=10;
num_of_M_f=8;
CapaofP=[21 1 1 1 2 2 2 2];% 容量/能力矩阵
checktable=[0 0 0 1 1 2 2 2 2 2  3 3 4 5 5 6 6 7 7] ;% 说明维度
%%
%main
load('M_p.mat')
flag_p=zeros(num_of_minfbm-num_of_M_s-num_of_M_f,1);
row_of_M_p=size(minfbm_remove_M_f,1);
%用0填充minfbm
a=minfbm_remove_M_f;
full_remove_M_f=[zeros(16,3) a(:,1) zeros(16,1)  a(:,2) zeros(16,1) a(:,3:5) zeros(16,1) a(:,6:end)];
% [rowinci,~]=size(inci);
%首遇重复索引
first_repeat_ind=repeat_ind(checktable);

for i=1:row_of_M_p
     M0=full_remove_M_f(i,:);%初始M0，full_remove_M_f为除去M_s和M_f后并且用0扩充至19维的minfbm
     New =one_fire_once(M0,CapaofP,checktable,inci);%自定义函数，一个token fire一次后返回的新状态
     flag_M=zeros(1,size(New,1) );
     if size(New,1)==0  % 返回New的行数,若参数为2则返回列数。
          flag_p(i)=0;     
     elseif size(New,1)>0    
        for k=1:size(New,1) %循环第一次fire的所有M
             Marking=New(k,:);
             [~,full_index]=isfull(CapaofP,checktable,first_repeat_ind,Marking);
             P=find(full_index==1)-1;
             no_full_p=find(full_index==0)-1;
             Marking(ismember(checktable,no_full_p))=0;
            while(1)      
            new_Marking =one_fire_once(Marking,CapaofP,checktable,inci);
            if ~isempty(new_Marking)
            for l=1:size(new_Marking,1)%循环第二次fire的所有m
                sub_new_Marking=new_Marking(l,:);
                 [~,new_full_index]=isfull(CapaofP,checktable,first_repeat_ind,sub_new_Marking);
                 P1=find(new_full_index==1)-1;%找到满载的P
                 P=intersect(P,P1);%取交集
            end
            new_Marking(~ismember(checktable,P))=0;%把交集外的P置为0
            Marking=new_Marking;
            else
                flag_M(k)=1; %fire两次后的状态满足
                break;
            end
            if  isempty(P)%如果P为空，则不是下一步死锁
                break;
            end
            end      %m
            
            if  flag_M(k)==0;%只有存在一个fire一次后的状态不满足则不是下一步死锁
                break;
            end
            
        end     %M
        
        if sum(flag_M)==size(New,1) %只有fire一次后的状态都满足则是下一步死锁
                 flag_p(i)=1; 
        end
    
     end
end

num_of_M_p=sum(flag_p);
constraint_of_M_p=minfbm_remove_M_f(flag_p==1,:);
M_r=minfbm_remove_M_f(flag_p==0,:);
% save('M_r.mat','M_r');
end


            
