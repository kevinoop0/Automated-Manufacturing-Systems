clc
clear all
% global flag
% global A
% global inci     % 稀疏矩阵
% global CapaofP  % 各个P的容量
% global M0       % 初始状态
% global rowinci  % 稀疏矩阵的行数
% global colinci  % 稀疏矩阵的列数
% global checktable   % 标明稀疏矩阵的每一行所属的P的下标
% global flag   % 计算正反向的旗帜

% M0=[4 5 0 0 0 0 0 0 0 0 0 0 0];% 网络的初始状态
% CapaofP=[9 1 1 1 1 1 1];% 容量/能力矩阵
% checktable=[0 0 1 2 2 3 4 5 5 5 5 6 6] ;% 说明关联矩阵的第几行是属于p几


M0=[3 11 7 zeros(1,16)];% 网络的初始状态
CapaofP=[21 1 1 1 2 2 2 2];% 容量/能力矩阵
checktable=[0 0 0 1 1 2 2 2 2 2  3 3 4 5 5 6 6 7 7] ;% 说明维度
load('sparse_matrix.mat');
% A = sparse_matrix;% 为了数据好看点放在了xls里面再读取出来，不过这个方法真的很慢
inci=spconvert(sparse_matrix);
% 求正向可达状态个数
tic
Reachabilty(1,M0,CapaofP,checktable,inci);

% 求反向可达状态个数
Reachabilty(-1,M0,CapaofP,checktable,inci);

a2livebad; % 这里调用livebad文件计算legal和illegal状态个数
% tic
a3fbm(checktable,CapaofP,inci); % 计算FBM
a4miniFBM(checktable,inci); % 计算miniFBM
toc
% toc