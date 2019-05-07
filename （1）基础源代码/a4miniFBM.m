% 计算最小覆盖坏标记
function [minFBM,num_of_minFBM]=a4miniFBM(checktable,inci)
% checktable=[0 0 0 1 1 2 2 2 2 2  3 3 4 5 5 6 6 7 7] ;% 说明维度
% load('sparse_matrix.mat');
% A = sparse;
% inci=spconvert(A);
a=find(checktable==0); % a = [1 2]
[~,col]=find(inci(a,:)==1);% 找到可以指向 p0 的t工件下标
[row,~]=find(inci(:,col)==-1);% 找到可以通过上述t工件发送的p工件下标
load('fbmark.mat');
% fullFBM=FBM;
FBM(:,row)=[];
FBM(:,a)=[];
FBM=unique(FBM,'rows'); % 去掉p0和可以到达p0的工件的部分（unique函数去掉重复的元素）
maxr=size(FBM,1);% 获取FBM的行数
i=1;

while(i<maxr)
    % 逐行比较
    now=FBM(i,:);
    j=i+1;
    while(j<=maxr)
        
        scan=FBM(j,:);
        tt=iscover(now,scan);
        % 调用iscover进行比较
        % if M1 covers M2,i.e.M1>=M2,return 1,if M2 covers M1,return -1,else return 0;
        % 传出1则now覆盖scan，-1则scan覆盖now，相等则为0
        % 例：
        %         tt = -1
        %         now = 0     2     0     1     0
        %         scan = 1     2     0     1     0
        if tt==-1 %向上覆盖
            FBM(j,:)=[]; % 覆盖后删除j行
%             fullFBM(j,:)=[];
            j=j-1;
            maxr=maxr-1;
        else if tt==1 % 向下覆盖
                FBM([i,j],:)=FBM([j,i],:);% j行数据赋值给i行
                FBM(j,:)=[];
%                 fullFBM([i,j],:)=fullFBM([j,i],:);
%                 fullFBM(j,:)=[];
                j=i;
                maxr=maxr-1;
                now=FBM(i,:);
            end
        end
        j=j+1;
    end
    i=i+1;
end
minFBM=FBM;
save('minFBM.mat','minFBM');
% save('fullFBM.mat','fullFBM');
% fprintf('最小被覆盖坏标记为：');
num_of_minFBM=size(minFBM,1);
%（P1a,P2a,P3a,P3b,P4b）
%P3a+P4b<=2----V2
%P2a+P4b<=3----V3
%P2a+P3b<=2----V1
end
