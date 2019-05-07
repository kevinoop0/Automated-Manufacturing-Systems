clc
clear all
% global flag
% global A
% global inci     % ϡ�����
% global CapaofP  % ����P������
% global M0       % ��ʼ״̬
% global rowinci  % ϡ����������
% global colinci  % ϡ����������
% global checktable   % ����ϡ������ÿһ��������P���±�
% global flag   % ���������������

% M0=[4 5 0 0 0 0 0 0 0 0 0 0 0];% ����ĳ�ʼ״̬
% CapaofP=[9 1 1 1 1 1 1];% ����/��������
% checktable=[0 0 1 2 2 3 4 5 5 5 5 6 6] ;% ˵����������ĵڼ���������p��


M0=[3 11 7 zeros(1,16)];% ����ĳ�ʼ״̬
CapaofP=[21 1 1 1 2 2 2 2];% ����/��������
checktable=[0 0 0 1 1 2 2 2 2 2  3 3 4 5 5 6 6 7 7] ;% ˵��ά��
load('sparse_matrix.mat');
% A = sparse_matrix;% Ϊ�����ݺÿ��������xls�����ٶ�ȡ�������������������ĺ���
inci=spconvert(sparse_matrix);
% ������ɴ�״̬����
tic
Reachabilty(1,M0,CapaofP,checktable,inci);

% ����ɴ�״̬����
Reachabilty(-1,M0,CapaofP,checktable,inci);

a2livebad; % �������livebad�ļ�����legal��illegal״̬����
% tic
a3fbm(checktable,CapaofP,inci); % ����FBM
a4miniFBM(checktable,inci); % ����miniFBM
toc
% toc