function [train_in,train_out,test_in,test_out,train_index,test_index] = ceate_train_test_data(samp, ycn,test_cn,flag)
%����Ĳ�������ʹ�ý���һ�뼴��
%train_index,test_index ѵ�������Ͳ��������������
%samp ������
%ycn ����ı�������
%test_cn %���ԣ���֤��������
%flag
%1 ѵ�����ݰ������ԣ���֤�����ݣ����ѡȡ���ԣ���֤������
%2 ѵ�����ݰ������ԣ���֤�����ݣ����ԣ���֤�����ݴ����ѡȡ
%3 ѵ������ �� �������ԣ���֤�����ݣ����ѡȡ���ԣ���֤������
%4 ѵ������ �� �������ԣ���֤�����ݣ� ���ԣ���֤�����ݴ����ѡȡ
 
 
%%ѵ�����ݰ������ԣ���֤�����ݣ����ѡȡ���ԣ���֤������
if flag==1
[m,n]=size(samp); %���е�������
perm =randperm(m);% ��1��m����� 
test_index = perm(end-test_cn+1:end);%���ѡtest_cn����Ϊ������֤���� ,ȫ����
test_samp=samp(test_index,:);  %��������
train_index=perm(1:end); 
train_samp=samp(train_index,:);%ѵ������

xcn=n-ycn; %���������ĸ���
train_in=train_samp(:,1:xcn); % �����������
train_out=train_samp(:,xcn+1:xcn+ycn); % ����������
test_in=test_samp(:,1:xcn); % �����������
test_out=test_samp(:,xcn+1:xcn+ycn); % ����������
end

%%ѵ�����ݰ������ԣ���֤�����ݣ����ԣ���֤�����ݴ����ѡȡ
if flag==2
[m,n]=size(samp); %���е�������
perm = [1:m];%��ȻѰ������
test_index = perm(end-test_cn+1:end);%ѡtest_cn����Ϊ������֤���� 
test_samp=samp(test_index,:);  %��������
train_index=perm(1:end); 
train_samp=samp(train_index,:);%ѵ������

xcn=n-ycn; %���������ĸ���
train_in=train_samp(:,1:xcn); % �����������
train_out=train_samp(:,xcn+1:xcn+ycn); % ����������
test_in=test_samp(:,1:xcn); % �����������
test_out=test_samp(:,xcn+1:xcn+ycn); % ����������
end


%%ѵ������ �� �������ԣ���֤�����ݣ����ѡȡ���ԣ���֤������
if flag==3
[m,n]=size(samp); %���е�������
perm =randperm(m);% ����� 
test_index = perm(end-test_cn+1:end);%���ѡtest_cn����Ϊ������֤���ݣ��������Ϊѵ������
test_samp=samp(test_index,:);  %��������
train_index=perm(1:end-test_cn); 
train_samp=samp(train_index,:);%ѵ������

xcn=n-ycn; %���������ĸ���
train_in=train_samp(:,1:xcn); % �����������
train_out=train_samp(:,xcn+1:xcn+ycn); % ����������
test_in=test_samp(:,1:xcn); % �����������
test_out=test_samp(:,xcn+1:xcn+ycn); % ����������
end

%%ѵ������ �� �������ԣ���֤�����ݣ������ѡȡ���ԣ���֤������
if flag==4
[m,n]=size(samp); %���е�������
perm =[1:m];% ����� 
test_index = perm(end-test_cn+1:end);%���ѡtest_cn����Ϊ������֤���ݣ��������Ϊѵ������
test_samp=samp(test_index,:);  %��������
train_index=perm(1:end-test_cn); 
train_samp=samp(train_index,:);%ѵ������

xcn=n-ycn; %���������ĸ���
train_in=train_samp(:,1:xcn); % �����������
train_out=train_samp(:,xcn+1:xcn+ycn); % ����������
test_in=test_samp(:,1:xcn); % �����������
test_out=test_samp(:,xcn+1:xcn+ycn); % ����������
end
 

end

