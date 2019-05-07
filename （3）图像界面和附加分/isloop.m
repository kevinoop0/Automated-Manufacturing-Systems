function [P,flag_f]=isloop(flag_f,minfbm,minfbm_checktable,inci,checktable)
%输入为13列的状态
row_output_minfbm=[4,6,8,9,10,12:19];%每一个minfbm中P的行
row_minfbm=size(minfbm,1);
% flag_f=ones(num_of_minfbm-num_of_M_s,1);

for i=1:row_minfbm
%     i=2
     total=0;
     if flag_f(i)==1
    minfbm_ind=find(minfbm(i,:)~=0);
    num_of_token=length(minfbm_ind);
    P=unique(minfbm_checktable(minfbm_ind));%找到满载的P集合
        %对每一个token进行判断是否存在x，使得x下一步后不在P中
%      p_in_loop=zeros(row_minfbm,8);
        for k=1:num_of_token
%             k=4
            %返回p对应的行
            t_col=inci(row_output_minfbm( minfbm_ind(k) ),:);
            %返回t_col中-1对应的列
            col_output=find(t_col==-1);
            %返回1对应的行
            [col_next,~]=find(inci(:,col_output)==1);
            pre_p=checktable(minfbm_checktable(minfbm_ind(k))); 
            if length(col_next)<2
                if ismember(checktable(col_next),P)
                    total=total+1;%计数
                else
                    P=setdiff(P,pre_p);
                 break
                end
            else
                %两边都无法走通
                if ismember(checktable(col_next(1)),P)&&ismember(checktable(col_next(2)),P)
                  total=total+1;
                end
             end
            
        end
        if total~=num_of_token
            flag_f(i)=0;%如果存在token下一步后不在P中，则不满足循环满载
        end
      end
      
end

end