function [negative,positive] = loca(t,inci)
% ��inci��t�ж�λ-1��1��λ��

% global inci
tth=inci(:,t); % ��t��ÿһ�е�����Ԫ��
negative=find(tth==-1); % �ҵ�������-1���ڵ�λ�ã��������һ��p����������
positive=find(tth==1);% �ҵ�������1���ڵ�λ�ã���һ��p�������ܴ�������a/b������

end

