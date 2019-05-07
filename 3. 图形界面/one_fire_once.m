function New=one_fire_once(M0,CapaofP,checktable,inci)
% CapaofP=[21 1 1 1 2 2 2 2];% 容量/能力矩阵
% checktable=[0 0 0 1 1 2 2 2 2 2  3 3 4 5 5 6 6 7 7] ;
Reached=M0; % 表示可达状态，现在是初始状态
From=M0;
temp=From;
colinci=size(M0,2);
for t=1:colinci% 以上一个可达状态为基础把每一个t fired一遍，产生新的可达状态
        % 负责遍历每一个t工件（按列处理）
       WW=Img_test(t,temp,checktable,CapaofP,inci); 
       From=cat(1,From,WW);     % 矩阵求并集，按行判断
       clear WW;
end
New = setdiff(From,Reached,'rows');