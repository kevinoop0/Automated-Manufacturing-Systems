function Nmarks = Totaltokens(M,i,checktable)
% �������i�����뵱ǰ������1������λ�ã����ҳ���Ӧ��place�������place��token�ܺ͡�
% global checktable
if isempty(i)
    Nmarks=9999;
else
    idp= checktable==checktable(i); % checktable==checktable(i)����1��0
    Nmarks=sum(M(idp));
end

% A(B)=A(B(i)) A,B��Ϊ������Ϊmatlab�ľ����±��1��ʼ
% ������ʹ��0����Ϊidp����Ԫ�������߼��������ͣ���һ����±���ͬ
% ȡidp��Ϊ1��Ԫ�ص��±�ȡ��M�ж�Ӧ�±��Ԫ��
% ��ͺ����ý�����Ǹ�p������������״̬�������ɹ������ܺͣ�token��
end

