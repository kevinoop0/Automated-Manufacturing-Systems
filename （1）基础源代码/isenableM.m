function [booll, newMk]=isenableM(t,Mk,checktable,CapaofP,rowinci,inci)
booll=0; % ���ģ�Ĭ�ϲ���Ϊfire
newMk=zeros(0,rowinci);
postMk=Mk;
[pre,post]=loca(t,inci);  % pre��-1���ڵ�λ�ã�post��1���ڵ�λ��
if(Mk(pre)>=1) 
    boolpre=1; %��ʾ����fired
    postMk(pre)=Mk(pre)-1; %��-1���λ�õĹ�������һ
    if (Totaltokens(Mk,post,checktable)<CapaofP(checktable(post)+1))
        boolpost=1;
        postMk(post)=Mk(post)+1;%��Ӧ�Ϸ���1���λ�õĹ�������һ
    else
        return;
    end
else
    return;
end
if  (boolpre==1) && (boolpost==1)
    booll=1;
    newMk=postMk;% ���ɵ��µ�״̬
end

return;
%�ж���һ��marking����ʶ�� Mk�£�MkΪ��������newMkΪ��������t�Ƿ����fire��tΪ����,
%booll=1��ʾ����fire��newMkΪMk֮���marking��booll=0��ʾ������fire,newMk��ȻΪ������
% ������״̬������P���������м��t������fired����
% global checktable
% 
% global CapaofP
% global rowinci


%   for(i=1:mm)
%       if (inci(i,t)==-1)
%           if(Mk(i)>=1)
%              boolpre=1;
%              postMk(i)=Mk(i)-1;
%           end
%       else if(inci(i,t)==1)
%               j=locate(i);
%               pp=delocate(j);
%               k=size(pp);
%               sumMk=0;
%
%               for(l=1:k)%�����place�е�token���ܺ�
%                    sumMk= sumMk+Mk(pp(l));
%               end
%
%               if sumMk+1<=CapacityP(j+1);
%                   boolres=1;
%                   postMk(i)=Mk(i)+1;
%               end
%           end
%       end
%
%   end
%      if  (boolpre==1) && (boolres==1)
%            booll=1;
%            newMk=postMk;
%       else booll=0;
%           newMk=Mk;
%       end
%   end




%     for(i=1:mm) % mmΪ��ͬtokens����ɫ��
%
%         if (inci(i,t)==-1)
%           if(Mk(i)==0)
%             booll=0;
%            %newMk=zeros(0,length(Mk));
%             break;
%           else
%               pre=i;
%               count=count+1;
%           end
%        else if(inci(i,t)==1)
%                i_in_p=locate(i);% i_in_p is scalar
%                p_clude_i=delocate(i_in_p);% p_clude_i is a vector
%                 k=length(p_clude_i);
%                 sumMk=0;
%                 for(l=1:k)%�����place�е�token���ܺ�
%                    sumMk= sumMk+Mk(p_clude_i(l));
%                 end
%                 if sumMk+1>CapaofP(i_in_p+1);
%                     booll=0;
%                     newMk=zeros(0,length(Mk));
%                     break;
%                 else
%                     post=i;
%                     count=count+1;
%                 end
%           end
%         end
%          if count==2
%           booll=1;
%           postMk(pre)=Mk(pre)-1;
%           postMk(post)=Mk(post)+1;
%           newMk=postMk;
%          break;
%          end
%     end
%
% end




