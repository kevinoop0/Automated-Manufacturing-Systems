clc;clear all;
load('M_r.mat')
load('big_livemark.mat')
div=sum(M_r,2)-1;
row=[4,6,8,9,10,12:19];
livemark=Livemark(:,row);
%��һ�� 1 x_14
livemark(:,14)=ones(size(livemark,1),1);
%��һ�� 0 x_14
M_r(:,14)=zeros(size(M_r,1),1);
%����
A=livemark;
b=ones(size(livemark,1),1);
Aeq=M_r;
beq=ones(size(Aeq,1),1);
f=[zeros(1,13),-1];
lb=zeros(size(A,2),1);
ub=ones(size(A,2),1);
eplison=zeros(size(M_r,1),1);%�洢ƽ����
temp_x=zeros(size(Aeq,2),size(Aeq,1));%�洢����L
for  i=1:size(Aeq,1)
%     i=1
 [x,fval]=linprog(f,A,b,Aeq(i,:)/div(i),1,lb,ub);
 eplison(i)=-fval;
 temp_x(:,i)=x;
end

%��������ʱ��ܾã����ｫ���ֱ�ӱ�������չʾ��ͼ�ν���

