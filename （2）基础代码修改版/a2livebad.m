% ��legal��illegal״̬����
function [num_of_Livemark,num_of_Badmark]=a2livebad()
load('reachmarknormal.mat');

load('coreachmark.mat');

Livemark=intersect(Reached,coReached,'rows'); % legal״̬����������ɴ�״̬�Ľ���
save('livemark.mat','Livemark');
clear coReached;
Badmark=setdiff(Reached,Livemark,'rows'); % illegal���ڿɴ�״̬��ȥ��legal״̬�Ĳ���
save('badmark.mat','Badmark');
clear Reached;
num_of_Livemark=size(Livemark,1);
num_of_Badmark=size(Badmark,1);
fprintf('����ɵ����е�legal״̬����Ϊ��%d \n',size(Livemark,1));
fprintf('���е� illegal״̬����Ϊ��%d \n',size(Badmark,1));