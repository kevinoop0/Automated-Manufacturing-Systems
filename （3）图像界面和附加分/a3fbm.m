% ����������־ First-Bad-Met
function [num_of_FBM]=a3fbm(checktable,CapaofP,inci)
[rowinci,colinci] = size(inci);
load('livemark.mat');
fprintf('\n');
fprintf('��FBM��\n');
FBM=zeros(0,rowinci);
fprintf('legal״̬���� %d\n',size(Livemark,1));
fprintf('��ȡlegal״̬����������legal״̬�Ļ����ϣ�\n');
for t=1:colinci
    
    Fromlive=Img_test(t,Livemark,checktable,CapaofP,inci);
%     FBM=union(FBM,Fromlive,'rows');
    FBM=cat(1,FBM,Fromlive);
end
fprintf('����һ���õ���״̬������%d\n',size(FBM,1));
clear Livemark;
clear Fromlive;
load('badmark.mat');
fprintf('illegal״̬����Ϊ��%d\n',size(Badmark,1));
FBM=intersect(FBM,Badmark,'rows');
num_of_FBM=size(FBM,1);
fprintf('ȡ������ã�����һ���õ���illegal״̬������%d\n',num_of_FBM);
fprintf('������First-Bad-Met����Ϊ��%d\n',num_of_FBM);
% ����legal״̬�������һ���õ���״̬�г�ȥ�ɴ�Ĳ���
% FBM���ں�����ӵĿ�����������Լ��
save('fbmark.mat','FBM');
end
