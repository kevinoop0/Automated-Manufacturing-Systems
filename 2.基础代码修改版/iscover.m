function tt=iscover(M1,M2)
% if M1 covers M2,i.e.M1>=M2,return 1,if M2 covers M1,return -1,else return 0;
tt=0;
len1=length(M1);
% 获取向量长度

%         if len1~=length(M2)
%              tt=0;
%              return
%         end

% 例：
        %         tt = -1
        %         now = 0     2     0     1     0
        %         scan = 1     2     0     1     0
        %         M     =  -1    0     0      0     0
        %         leng2（<=0的元素总数） = 5, len = 5
        %         所以 len== leng2成立，返回-1
        

M=M1-M2;
leng1=sum(M>=0);
% 向量元素相减，计算向量中大于等于0的元素个数
if leng1==len1
    % 大于等于0的元素个数等于原向量长度则向下覆盖
    tt=1;
else
    leng2=sum(M<=0);
    if leng2==len1
        % 小于等于0的元素个数等于原向量长度则向上覆盖
        tt=-1;
    end
end
% 均不符合则返回0

end




