function reachableM=Img(t,Markset,checktable,CapaofP,rowinci,inci)
%Markset is a set of markings,a row is a marking. return reachable set from markset while t is fired
%����t�������±����һ���ɴ�״̬�ľ���
%�����ڴ˿ɴ�״̬�����ϣ�ֻҪ���µĿɴ�״̬���ɴ�״̬����Marksetһֱ�ڱ仯��t����fired��Ŀɴ�״̬
%ֻ�����������и�t�������Բ������µĿɴ�״̬
% global rowinci % m�ļ���ʹ��ȫ�ֱ��������ֲ���
Nmk=size(Markset,1); %����Markset���������,������Ϊ2�򷵻�����
% Nmk���µĿɴ�״̬�����������
reachableM=zeros(0,rowinci); % initial reachableM ��ά��0����ά��rowinci�Ŀվ���
                                                 % ��ʹ��zeros(0,0)�Ƿ�ֹunion��������
for i=1:Nmk
    
    [~, newMke]=isenableM(t,Markset(i,:),checktable,CapaofP,rowinci,inci); 
    % Markset(i,:)��ʾ��i�е�����Ԫ��
%     reachableM=union(reachableM,newMke,'rows');
    reachableM=cat(1,reachableM,newMke);
    % �µĿɴ�״̬��ԭ�еĿɴ�״̬����ȡ�����������ص�ǰt�����µĿɴ�״̬
end
end



