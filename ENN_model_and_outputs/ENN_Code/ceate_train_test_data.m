function [train_in,train_out,test_in,test_out,train_index,test_index] = ceate_train_test_data(samp, ycn,test_cn,flag)
%输出的参数可以使用仅仅一半即可
%train_index,test_index 训练样本和测试样本的行序号
%samp 样本数
%ycn 输出的变量个数
%test_cn %测试（验证）样本数
%flag
%1 训练数据包含测试（验证）数据，随机选取测试（验证）数据
%2 训练数据包含测试（验证）数据，测试（验证）数据从最后选取
%3 训练数据 不 包含测试（验证）数据，随机选取测试（验证）数据
%4 训练数据 不 包含测试（验证）数据， 测试（验证）数据从最后选取
 
 
%%训练数据包含测试（验证）数据，随机选取测试（验证）数据
if flag==1
[m,n]=size(samp); %所有的样本数
perm =randperm(m);% 从1到m随机数 
test_index = perm(end-test_cn+1:end);%随机选test_cn个作为测试验证数据 ,全排列
test_samp=samp(test_index,:);  %测试数据
train_index=perm(1:end); 
train_samp=samp(train_index,:);%训练数据

xcn=n-ycn; %输入和输出的个数
train_in=train_samp(:,1:xcn); % 神经网络的输入
train_out=train_samp(:,xcn+1:xcn+ycn); % 神经网络的输出
test_in=test_samp(:,1:xcn); % 神经网络的输入
test_out=test_samp(:,xcn+1:xcn+ycn); % 神经网络的输出
end

%%训练数据包含测试（验证）数据，测试（验证）数据从最后选取
if flag==2
[m,n]=size(samp); %所有的样本数
perm = [1:m];%自然寻列排序
test_index = perm(end-test_cn+1:end);%选test_cn个作为测试验证数据 
test_samp=samp(test_index,:);  %测试数据
train_index=perm(1:end); 
train_samp=samp(train_index,:);%训练数据

xcn=n-ycn; %输入和输出的个数
train_in=train_samp(:,1:xcn); % 神经网络的输入
train_out=train_samp(:,xcn+1:xcn+ycn); % 神经网络的输出
test_in=test_samp(:,1:xcn); % 神经网络的输入
test_out=test_samp(:,xcn+1:xcn+ycn); % 神经网络的输出
end


%%训练数据 不 包含测试（验证）数据，随机选取测试（验证）数据
if flag==3
[m,n]=size(samp); %所有的样本数
perm =randperm(m);% 随机数 
test_index = perm(end-test_cn+1:end);%随机选test_cn个作为测试验证数据，其余的作为训练数据
test_samp=samp(test_index,:);  %测试数据
train_index=perm(1:end-test_cn); 
train_samp=samp(train_index,:);%训练数据

xcn=n-ycn; %输入和输出的个数
train_in=train_samp(:,1:xcn); % 神经网络的输入
train_out=train_samp(:,xcn+1:xcn+ycn); % 神经网络的输出
test_in=test_samp(:,1:xcn); % 神经网络的输入
test_out=test_samp(:,xcn+1:xcn+ycn); % 神经网络的输出
end

%%训练数据 不 包含测试（验证）数据，从最后选取测试（验证）数据
if flag==4
[m,n]=size(samp); %所有的样本数
perm =[1:m];% 随机数 
test_index = perm(end-test_cn+1:end);%随机选test_cn个作为测试验证数据，其余的作为训练数据
test_samp=samp(test_index,:);  %测试数据
train_index=perm(1:end-test_cn); 
train_samp=samp(train_index,:);%训练数据

xcn=n-ycn; %输入和输出的个数
train_in=train_samp(:,1:xcn); % 神经网络的输入
train_out=train_samp(:,xcn+1:xcn+ycn); % 神经网络的输出
test_in=test_samp(:,1:xcn); % 神经网络的输入
test_out=test_samp(:,xcn+1:xcn+ycn); % 神经网络的输出
end
 

end

