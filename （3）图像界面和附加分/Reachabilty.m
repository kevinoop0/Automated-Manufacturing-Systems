function  [num_of_Reached]=Reachabilty(flag,M0,CapaofP,checktable,inci)
% flag = input('������Ҫ��ķ���(1Ϊ����,-1Ϊ����):');

% [inci,rowinci,colinci] = initial(A,flag); % ��ʼ��������һ��ϡ������Լ���������������
% ϡ��������������t_x���������Ǹ�����������ת�Ķ���a��b�����ߺϲ���һ���ʾ�ù��̵�����ͼ
% clear A;
% full = full(inci);
if flag==-1
 inci=-inci;
end
 
[~,colinci] = size(inci);
Reached=M0; % ��ʾ�ɴ�״̬�������ǳ�ʼ״̬
From=M0;% ���ڴ����¼���Ŀ���״̬�������ǳ�ʼ״̬

while (1)
    temp=From;
    for t=1:colinci% ����һ���ɴ�״̬Ϊ������ÿһ��t firedһ�飬�����µĿɴ�״̬
        % �������ÿһ��t���������д���
        WW=Img_test(t,temp,checktable,CapaofP,inci); 
        From=cat(1,From,WW);
%         From=union(From,WW,'rows');     % �����󲢼��������ж�
        clear WW;
    end
    % From����������t���Բ����Ŀɴ�״̬
    
    clear temp;
    
    % ������������µĿɴ�״̬
    New = setdiff(From,Reached,'rows');
    % c = setdiff(A, B, 'rows').��A��B�Ǿ�����ͬ�еľ���ʱ
    % ����A���ж�B��û�е���Щ��
    
    if size(New,1)>0  % ����New������,������Ϊ2�򷵻�������
                               %  �������new�ǿվ���Ļ�֤�������ټ��������µĿɴ�״̬��
        clear From;
        From=New; %����һ��״̬�м����µĿ���״̬
        % fprintf('�����¿ɴ�״̬������%d\n',size(New,1));
        Reached=union(Reached,New,'rows'); % ����״̬��Ŀ����
    else
        % fprintf('δ�ܲ����µĿɴ�״̬������ѭ��\n');
        break;% ֱ�����ٳ����µ�״̬��ʱ�������ѭ��
    end
end
num_of_Reached=size(Reached,1);
if flag == -1
    coReached=Reached;
    fprintf('����ɴ�״̬�ĸ�����%d \n',size(coReached,1));
    save('coreachmark.mat','coReached');
else
    fprintf('����ɴ�״̬�ĸ�����%d \n',size(Reached,1));
    save('reachmarknormal.mat','Reached');
end

end