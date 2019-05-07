function [booll, newMk]=isenableM(t,Mk,checktable,CapaofP,rowinci,inci)
booll=0; % 旗帜，默认不能为fire
newMk=zeros(0,rowinci);
postMk=Mk;
[pre,post]=loca(t,inci);  % pre是-1所在的位置，post是1所在的位置
if(Mk(pre)>=1) 
    boolpre=1; %表示可以fired
    postMk(pre)=Mk(pre)-1; %把-1这个位置的工件数减一
    if (Totaltokens(Mk,post,checktable)<CapaofP(checktable(post)+1))
        boolpost=1;
        postMk(post)=Mk(post)+1;%对应上方把1这个位置的工件数加一
    else
        return;
    end
else
    return;
end
if  (boolpre==1) && (boolpost==1)
    booll=1;
    newMk=postMk;% 生成的新的状态
end

return;
%判断在一个marking（标识） Mk下，Mk为行向量，newMk为行向量，t是否可以fire，t为整数,
%booll=1表示可以fire，newMk为Mk之后的marking。booll=0表示不可以fire,newMk仍然为空向量
% 处理单个状态下两个P工件及其中间的t工件的fired过程
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
%               for(l=1:k)%计算该place中的token的总和
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




%     for(i=1:mm) % mm为不同tokens的颜色数
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
%                 for(l=1:k)%计算该place中的token的总和
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




