function [  samp ] = FanGuiYiHua(samp,s_m,s_std)
 % ������֪�ľ�ֵ�ͷ���������һ��,����Ϊ��λ��һ��
[row,col]=size(samp);
[tmp,col1]=size(s_m);
if( col ~= col1 )
    errordlg('����һ�����в�����');
end
 for j=1:col
     samp(:,j)=  samp(:,j) *s_std(j)+s_m(j);
 end
end

