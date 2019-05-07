function [negative,positive] = loca(t,inci)
% 在inci中t列定位-1和1的位置

% global inci
tth=inci(:,t); % 第t列每一行的所有元素
negative=find(tth==-1); % 找到该列中-1所在的位置（代表从哪一个p工件出发）
positive=find(tth==1);% 找到该列中1所在的位置（哪一个p工件接受传过来的a/b工件）

end

