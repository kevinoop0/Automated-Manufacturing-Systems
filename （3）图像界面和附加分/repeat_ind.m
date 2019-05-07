function  first_repeat_ind=repeat_ind(mark)

% mark=minfbm_checktable;
first_repeat_ind=find(diff(mark)==0);
repeat=find(diff(first_repeat_ind)==1)+1;
first_repeat_ind(repeat)=[];

end