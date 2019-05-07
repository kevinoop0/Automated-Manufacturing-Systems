function [num_of_M_f,constraint_of_M_f]=Fully_filled(num_of_minfbm,num_of_M_s,CapaofP,checktable,minfbm_checktable,inci)
% clc;clear all;
%%
%init
load('sparse_matrix.mat');
inci=full(spconvert(sparse_matrix));
num_of_minfbm=34;
num_of_M_s=10;
CapaofP=[21 1 1 1 2 2 2 2];% 容量/能力矩阵
checktable=[0 0 0 1 1 2 2 2 2 2  3 3 4 5 5 6 6 7 7] ;% 说明维度
minfbm_checktable=[1 2 2 2 2 3 4 5 5 6 6 7 7 ];
%%
%main
load('M_f.mat');
flag_f=ones(num_of_minfbm-num_of_M_s,1);
%首遇重复索引
first_repeat_ind=repeat_ind(minfbm_checktable);
minfbm_combine=minf_remove_M_s;
%合并在同一个P里的工件数
% 自定义函数 判断每个P是否满载
[flag_f,~]=isfull(CapaofP,minfbm_checktable,first_repeat_ind,minfbm_combine);
%如果P是满载的，则继续判断是否为回路
[~,flag_f]=isloop(flag_f,minfbm_combine,minfbm_checktable,inci,checktable);
num_of_M_f=sum(flag_f);
constraint_of_M_f=minf_remove_M_s(flag_f==1,:);

end
