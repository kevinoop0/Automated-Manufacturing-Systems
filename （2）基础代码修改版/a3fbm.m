% 求首遇坏标志 First-Bad-Met
function [num_of_FBM]=a3fbm(checktable,CapaofP,inci)
[rowinci,colinci] = size(inci);
load('livemark.mat');
fprintf('\n');
fprintf('求FBM：\n');
FBM=zeros(0,rowinci);
fprintf('legal状态个数 %d\n',size(Livemark,1));
fprintf('获取legal状态，并在所有legal状态的基础上：\n');
for t=1:colinci
    
    Fromlive=Img_test(t,Livemark,checktable,CapaofP,inci);
%     FBM=union(FBM,Fromlive,'rows');
    FBM=cat(1,FBM,Fromlive);
end
fprintf('运行一步得到的状态总数：%d\n',size(FBM,1));
clear Livemark;
clear Fromlive;
load('badmark.mat');
fprintf('illegal状态个数为：%d\n',size(Badmark,1));
FBM=intersect(FBM,Badmark,'rows');
num_of_FBM=size(FBM,1);
fprintf('取交集求得，运行一步得到的illegal状态个数：%d\n',num_of_FBM);
fprintf('既所得First-Bad-Met个数为：%d\n',num_of_FBM);
% 所有legal状态向后运行一步得到的状态中除去可达的部分
% FBM用于后续添加的控制器的线性约束
save('fbmark.mat','FBM');
end
