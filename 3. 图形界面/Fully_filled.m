function [num_of_M_f,constraint_of_M_f]=Fully_filled(num_of_minfbm,num_of_M_s,CapaofP,checktable,minfbm_checktable,inci)
% clc;clear all;
%%
%init
load('sparse_matrix.mat');
inci=full(spconvert(sparse_matrix));
num_of_minfbm=34;
num_of_M_s=10;
CapaofP=[21 1 1 1 2 2 2 2];% ����/��������
checktable=[0 0 0 1 1 2 2 2 2 2  3 3 4 5 5 6 6 7 7] ;% ˵��ά��
minfbm_checktable=[1 2 2 2 2 3 4 5 5 6 6 7 7 ];
%%
%main
load('M_f.mat');
flag_f=ones(num_of_minfbm-num_of_M_s,1);
%�����ظ�����
first_repeat_ind=repeat_ind(minfbm_checktable);
minfbm_combine=minf_remove_M_s;
%�ϲ���ͬһ��P��Ĺ�����
% �Զ��庯�� �ж�ÿ��P�Ƿ�����
[flag_f,~]=isfull(CapaofP,minfbm_checktable,first_repeat_ind,minfbm_combine);
%���P�����صģ�������ж��Ƿ�Ϊ��·
[~,flag_f]=isloop(flag_f,minfbm_combine,minfbm_checktable,inci,checktable);
num_of_M_f=sum(flag_f);
constraint_of_M_f=minf_remove_M_s(flag_f==1,:);

end
