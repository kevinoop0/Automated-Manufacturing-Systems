function [P,flag_f]=isloop(flag_f,minfbm,minfbm_checktable,inci,checktable)
%����Ϊ13�е�״̬
row_output_minfbm=[4,6,8,9,10,12:19];%ÿһ��minfbm��P����
row_minfbm=size(minfbm,1);
% flag_f=ones(num_of_minfbm-num_of_M_s,1);

for i=1:row_minfbm
%     i=2
     total=0;
     if flag_f(i)==1
    minfbm_ind=find(minfbm(i,:)~=0);
    num_of_token=length(minfbm_ind);
    P=unique(minfbm_checktable(minfbm_ind));%�ҵ����ص�P����
        %��ÿһ��token�����ж��Ƿ����x��ʹ��x��һ������P��
%      p_in_loop=zeros(row_minfbm,8);
        for k=1:num_of_token
%             k=4
            %����p��Ӧ����
            t_col=inci(row_output_minfbm( minfbm_ind(k) ),:);
            %����t_col��-1��Ӧ����
            col_output=find(t_col==-1);
            %����1��Ӧ����
            [col_next,~]=find(inci(:,col_output)==1);
            pre_p=checktable(minfbm_checktable(minfbm_ind(k))); 
            if length(col_next)<2
                if ismember(checktable(col_next),P)
                    total=total+1;%����
                else
                    P=setdiff(P,pre_p);
                 break
                end
            else
                %���߶��޷���ͨ
                if ismember(checktable(col_next(1)),P)&&ismember(checktable(col_next(2)),P)
                  total=total+1;
                end
             end
            
        end
        if total~=num_of_token
            flag_f(i)=0;%�������token��һ������P�У�������ѭ������
        end
      end
      
end

end