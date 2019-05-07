% 求legal和illegal状态个数
function [num_of_Livemark,num_of_Badmark]=a2livebad()
load('reachmarknormal.mat');

load('coreachmark.mat');

Livemark=intersect(Reached,coReached,'rows'); % legal状态等于正反向可达状态的交集
save('livemark.mat','Livemark');
clear coReached;
Badmark=setdiff(Reached,Livemark,'rows'); % illegal等于可达状态中去掉legal状态的部分
save('badmark.mat','Badmark');
clear Reached;
num_of_Livemark=size(Livemark,1);
num_of_Badmark=size(Badmark,1);
fprintf('计算可得所有的legal状态个数为：%d \n',size(Livemark,1));
fprintf('所有的 illegal状态个数为：%d \n',size(Badmark,1));