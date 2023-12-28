function [  samp ] = FanGuiYiHua(samp,s_m,s_std)
 % 根据已知的均值和方差来反归一化,以列为单位归一化
[row,col]=size(samp);
[tmp,col1]=size(s_m);
if( col ~= col1 )
    errordlg('反归一化，列不符合');
end
 for j=1:col
     samp(:,j)=  samp(:,j) *s_std(j)+s_m(j);
 end
end

