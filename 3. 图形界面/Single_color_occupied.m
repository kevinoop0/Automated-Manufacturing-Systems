function  [num_of_M_s,constraint_of_M_s]=Single_color_occupied(CapaofP,minfbm_checktable)
% clc;clear all;
%init
load('new_minfbm.mat');
minfbm=new_minfbm;
CapaofP=[21 1 1 1 2 2 2 2];% ����/��������
minfbm_checktable=[1 2 2 2 2 3 4 5 5 6 6 7 7 ];
%%
%main
row=size(minfbm,1);
flag=ones(34,1);
for i=1:row
    [~,col]=find(minfbm(i,:)~=0);%�Ҳ�����0��ֵ���ڵ��� 0,2,0,0,2 (����2,5)
    for j =1:length(col) %
        ind=col(j);%�ҵ���Ӧ�±� 
        if minfbm(i,ind)~=CapaofP(minfbm_checktable(ind)+1);
            flag(i,1)=0;%����һ����
            break
        end
    end
end

num_of_M_s=sum(flag);
constraint_of_M_s=minfbm(flag==1,:);

end