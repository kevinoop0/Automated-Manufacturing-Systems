% ������С���ǻ����
function [minFBM,num_of_minFBM]=a4miniFBM(checktable,inci)
% checktable=[0 0 0 1 1 2 2 2 2 2  3 3 4 5 5 6 6 7 7] ;% ˵��ά��
% load('sparse_matrix.mat');
% A = sparse;
% inci=spconvert(A);
a=find(checktable==0); % a = [1 2]
[~,col]=find(inci(a,:)==1);% �ҵ�����ָ�� p0 ��t�����±�
[row,~]=find(inci(:,col)==-1);% �ҵ�����ͨ������t�������͵�p�����±�
load('fbmark.mat');
% fullFBM=FBM;
FBM(:,row)=[];
FBM(:,a)=[];
FBM=unique(FBM,'rows'); % ȥ��p0�Ϳ��Ե���p0�Ĺ����Ĳ��֣�unique����ȥ���ظ���Ԫ�أ�
maxr=size(FBM,1);% ��ȡFBM������
i=1;

while(i<maxr)
    % ���бȽ�
    now=FBM(i,:);
    j=i+1;
    while(j<=maxr)
        
        scan=FBM(j,:);
        tt=iscover(now,scan);
        % ����iscover���бȽ�
        % if M1 covers M2,i.e.M1>=M2,return 1,if M2 covers M1,return -1,else return 0;
        % ����1��now����scan��-1��scan����now�������Ϊ0
        % ����
        %         tt = -1
        %         now = 0     2     0     1     0
        %         scan = 1     2     0     1     0
        if tt==-1 %���ϸ���
            FBM(j,:)=[]; % ���Ǻ�ɾ��j��
%             fullFBM(j,:)=[];
            j=j-1;
            maxr=maxr-1;
        else if tt==1 % ���¸���
                FBM([i,j],:)=FBM([j,i],:);% j�����ݸ�ֵ��i��
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
% fprintf('��С�����ǻ����Ϊ��');
num_of_minFBM=size(minFBM,1);
%��P1a,P2a,P3a,P3b,P4b��
%P3a+P4b<=2----V2
%P2a+P4b<=3----V3
%P2a+P3b<=2----V1
end
