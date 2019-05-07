function isenable_mark=Img_test(t,Markset,checktable,CapaofP,inci)
% reachableM=zeros(0,rowinci); % initial reachableM 横维是0，列维是rowinci的空矩阵
isenable_mark=Markset;
%原来的loca函数
ind=inci(:,t); % 第t列每一行的所有元素
pre=find(ind==-1); % 找到该列中-1所在的位置（代表从哪一个p工件出发）
post=find(ind==1);
% [pre,post]=loca(t,inci);  % pre是-1所在的位置，post是1所在的位置
%原来的Totaltoken函数
idp= checktable==checktable(post); 
num_tokens=sum(Markset(:,idp),2);
%原来的isenableM函数
% [~, newMke]=isenableM_test(t,Markset,checktable,CapaofP,rowinci,inci); 
out=Markset(:,pre)>=1;
in=num_tokens<CapaofP(checktable(post)+1);
isenable_ind=find((out==1) & (in==1));%找到可以enable的索引

isenable_mark=Markset(isenable_ind,:);%取可以enable的状态
isenable_mark(:,pre)=isenable_mark(:,pre)-1;
isenable_mark(:,post)=isenable_mark(:,post)+1;
end