function reachableM=Img(t,Markset,checktable,CapaofP,rowinci,inci)
%Markset is a set of markings,a row is a marking. return reachable set from markset while t is fired
%传入t工件的下标和上一个可达状态的矩阵
%返回在此可达状态基础上（只要有新的可达状态，可达状态矩阵Markset一直在变化）t工件fired后的可达状态
%只返回所有行中该t工件可以产生的新的可达状态
% global rowinci % m文件间使用全局变量共享部分参数
Nmk=size(Markset,1); %返回Markset矩阵的行数,若参数为2则返回列数
% Nmk随新的可达状态的增多而增多
reachableM=zeros(0,rowinci); % initial reachableM 横维是0，列维是rowinci的空矩阵
                                                 % 不使用zeros(0,0)是防止union函数报错
for i=1:Nmk
    
    [~, newMke]=isenableM(t,Markset(i,:),checktable,CapaofP,rowinci,inci); 
    % Markset(i,:)表示第i行的所有元素
%     reachableM=union(reachableM,newMke,'rows');
    reachableM=cat(1,reachableM,newMke);
    % 新的可达状态与原有的可达状态按行取并集，并返回当前t工件下的可达状态
end
end



