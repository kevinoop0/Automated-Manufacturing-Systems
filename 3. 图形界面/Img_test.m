function isenable_mark=Img_test(t,Markset,checktable,CapaofP,inci)
% reachableM=zeros(0,rowinci); % initial reachableM ��ά��0����ά��rowinci�Ŀվ���
isenable_mark=Markset;
%ԭ����loca����
ind=inci(:,t); % ��t��ÿһ�е�����Ԫ��
pre=find(ind==-1); % �ҵ�������-1���ڵ�λ�ã��������һ��p����������
post=find(ind==1);
% [pre,post]=loca(t,inci);  % pre��-1���ڵ�λ�ã�post��1���ڵ�λ��
%ԭ����Totaltoken����
idp= checktable==checktable(post); 
num_tokens=sum(Markset(:,idp),2);
%ԭ����isenableM����
% [~, newMke]=isenableM_test(t,Markset,checktable,CapaofP,rowinci,inci); 
out=Markset(:,pre)>=1;
in=num_tokens<CapaofP(checktable(post)+1);
isenable_ind=find((out==1) & (in==1));%�ҵ�����enable������

isenable_mark=Markset(isenable_ind,:);%ȡ����enable��״̬
isenable_mark(:,pre)=isenable_mark(:,pre)-1;
isenable_mark(:,post)=isenable_mark(:,post)+1;
end