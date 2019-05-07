function [num_of_M_p,constraint_of_M_p]=One_step_ahead_deadlock(num_of_minfbm,num_of_M_s,num_of_M_f,CapaofP,checktable,inci)
% clc;clear
%%init
load('sparse_matrix.mat');
inci=full(spconvert(sparse_matrix));
num_of_minfbm=34;
num_of_M_s=10;
num_of_M_f=8;
CapaofP=[21 1 1 1 2 2 2 2];% ����/��������
checktable=[0 0 0 1 1 2 2 2 2 2  3 3 4 5 5 6 6 7 7] ;% ˵��ά��
%%
%main
load('M_p.mat')
flag_p=zeros(num_of_minfbm-num_of_M_s-num_of_M_f,1);
row_of_M_p=size(minfbm_remove_M_f,1);
%��0���minfbm
a=minfbm_remove_M_f;
full_remove_M_f=[zeros(16,3) a(:,1) zeros(16,1)  a(:,2) zeros(16,1) a(:,3:5) zeros(16,1) a(:,6:end)];
% [rowinci,~]=size(inci);
%�����ظ�����
first_repeat_ind=repeat_ind(checktable);

for i=1:row_of_M_p
     M0=full_remove_M_f(i,:);%��ʼM0��full_remove_M_fΪ��ȥM_s��M_f������0������19ά��minfbm
     New =one_fire_once(M0,CapaofP,checktable,inci);%�Զ��庯����һ��token fireһ�κ󷵻ص���״̬
     flag_M=zeros(1,size(New,1) );
     if size(New,1)==0  % ����New������,������Ϊ2�򷵻�������
          flag_p(i)=0;     
     elseif size(New,1)>0    
        for k=1:size(New,1) %ѭ����һ��fire������M
             Marking=New(k,:);
             [~,full_index]=isfull(CapaofP,checktable,first_repeat_ind,Marking);
             P=find(full_index==1)-1;
             no_full_p=find(full_index==0)-1;
             Marking(ismember(checktable,no_full_p))=0;
            while(1)      
            new_Marking =one_fire_once(Marking,CapaofP,checktable,inci);
            if ~isempty(new_Marking)
            for l=1:size(new_Marking,1)%ѭ���ڶ���fire������m
                sub_new_Marking=new_Marking(l,:);
                 [~,new_full_index]=isfull(CapaofP,checktable,first_repeat_ind,sub_new_Marking);
                 P1=find(new_full_index==1)-1;%�ҵ����ص�P
                 P=intersect(P,P1);%ȡ����
            end
            new_Marking(~ismember(checktable,P))=0;%�ѽ������P��Ϊ0
            Marking=new_Marking;
            else
                flag_M(k)=1; %fire���κ��״̬����
                break;
            end
            if  isempty(P)%���PΪ�գ�������һ������
                break;
            end
            end      %m
            
            if  flag_M(k)==0;%ֻ�д���һ��fireһ�κ��״̬������������һ������
                break;
            end
            
        end     %M
        
        if sum(flag_M)==size(New,1) %ֻ��fireһ�κ��״̬������������һ������
                 flag_p(i)=1; 
        end
    
     end
end

num_of_M_p=sum(flag_p);
constraint_of_M_p=minfbm_remove_M_f(flag_p==1,:);
M_r=minfbm_remove_M_f(flag_p==0,:);
% save('M_r.mat','M_r');
end


            
