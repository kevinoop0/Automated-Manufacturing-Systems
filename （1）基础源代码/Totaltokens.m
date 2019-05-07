function Nmarks = Totaltokens(M,i,checktable)
% 给定序号i（传入当前列向量1的所在位置），找出对应的place，计算该place的token总和。
% global checktable
if isempty(i)
    Nmarks=9999;
else
    idp= checktable==checktable(i); % checktable==checktable(i)返回1和0
    Nmarks=sum(M(idp));
end

% A(B)=A(B(i)) A,B均为矩阵，因为matlab的矩阵下标从1开始
% 这里能使用0是因为idp向量元素属于逻辑数据类型，与一般的下标概念不同
% 取idp中为1的元素的下标取出M中对应下标的元素
% 求和后所得结果就是该p工件现在所处状态下所容纳工件数总和（token）
end

