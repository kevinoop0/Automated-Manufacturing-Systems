function New=one_fire_once(M0,CapaofP,checktable,inci)
% CapaofP=[21 1 1 1 2 2 2 2];% ����/��������
% checktable=[0 0 0 1 1 2 2 2 2 2  3 3 4 5 5 6 6 7 7] ;
Reached=M0; % ��ʾ�ɴ�״̬�������ǳ�ʼ״̬
From=M0;
temp=From;
colinci=size(M0,2);
for t=1:colinci% ����һ���ɴ�״̬Ϊ������ÿһ��t firedһ�飬�����µĿɴ�״̬
        % �������ÿһ��t���������д���
       WW=Img_test(t,temp,checktable,CapaofP,inci); 
       From=cat(1,From,WW);     % �����󲢼��������ж�
       clear WW;
end
New = setdiff(From,Reached,'rows');