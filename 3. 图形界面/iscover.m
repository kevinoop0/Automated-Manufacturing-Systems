function tt=iscover(M1,M2)
% if M1 covers M2,i.e.M1>=M2,return 1,if M2 covers M1,return -1,else return 0;
tt=0;
len1=length(M1);
% ��ȡ��������

%         if len1~=length(M2)
%              tt=0;
%              return
%         end

% ����
        %         tt = -1
        %         now = 0     2     0     1     0
        %         scan = 1     2     0     1     0
        %         M     =  -1    0     0      0     0
        %         leng2��<=0��Ԫ�������� = 5, len = 5
        %         ���� len== leng2����������-1
        

M=M1-M2;
leng1=sum(M>=0);
% ����Ԫ����������������д��ڵ���0��Ԫ�ظ���
if leng1==len1
    % ���ڵ���0��Ԫ�ظ�������ԭ�������������¸���
    tt=1;
else
    leng2=sum(M<=0);
    if leng2==len1
        % С�ڵ���0��Ԫ�ظ�������ԭ�������������ϸ���
        tt=-1;
    end
end
% ���������򷵻�0

end




