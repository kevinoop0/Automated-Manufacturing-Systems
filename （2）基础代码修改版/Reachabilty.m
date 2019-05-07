function  [num_of_Reached]=Reachabilty(flag,M0,CapaofP,checktable,inci)
% flag = input('请输入要求的方向(1为正向,-1为反向):');

% [inci,rowinci,colinci] = initial(A,flag); % 初始化，返回一个稀疏矩阵以及它的行数和列数
% 稀疏矩阵的行向量是t_x，列向量是各个工件下运转的对象a，b。两者合并在一起表示该工程的网络图
% clear A;
% full = full(inci);
if flag==-1
 inci=-inci;
end
 
[~,colinci] = size(inci);
Reached=M0; % 表示可达状态，现在是初始状态
From=M0;% 用于储存新加入的可行状态，现在是初始状态

while (1)
    temp=From;
    for t=1:colinci% 以上一个可达状态为基础把每一个t fired一遍，产生新的可达状态
        % 负责遍历每一个t工件（按列处理）
        WW=Img_test(t,temp,checktable,CapaofP,inci); 
        From=cat(1,From,WW);
%         From=union(From,WW,'rows');     % 矩阵求并集，按行判断
        clear WW;
    end
    % From接收了所有t可以产生的可达状态
    
    clear temp;
    
    % 在这里产生了新的可达状态
    New = setdiff(From,Reached,'rows');
    % c = setdiff(A, B, 'rows').当A和B是具有相同行的矩阵时
    % 返回A中有而B中没有的那些行
    
    if size(New,1)>0  % 返回New的行数,若参数为2则返回列数。
                               %  这里如果new是空矩阵的话证明不会再继续产生新的可达状态了
        clear From;
        From=New; %从上一个状态中加入新的可行状态
        % fprintf('产生新可达状态个数：%d\n',size(New,1));
        Reached=union(Reached,New,'rows'); % 可行状态数目增加
    else
        % fprintf('未能产生新的可达状态！跳出循环\n');
        break;% 直到不再出现新的状态的时候就跳出循环
    end
end
num_of_Reached=size(Reached,1);
if flag == -1
    coReached=Reached;
    fprintf('反向可达状态的个数：%d \n',size(coReached,1));
    save('coreachmark.mat','coReached');
else
    fprintf('正向可达状态的个数：%d \n',size(Reached,1));
    save('reachmarknormal.mat','Reached');
end

end