function [R,stats] = shandiantu( confirmout,simout )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%����ɢ��ͼ��
%R���ϵ��
%stats=[R2,F,p]
out1=confirmout; out2=simout;
tmp= corrcoef(out1,out2);
R=tmp(2,1); % ���ϵ��
xs=out1;
ys=out2;
if size(xs,1)==1
    xs=xs';  %ת��Ϊ��
end
if size(ys,1)==1
    ys=ys'; %ת��Ϊ��
end
xs=[ones(size(xs,1),1),xs];%����һ��ȫ����1���У���Ϊ������
[b,~,r,rint,stats]= regress(ys,xs);%������С���˷���ֲ������ߵ�б��k��b
z=b(1)+b(2)*out1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%�в����ͼ
figure;
rcoplot(r,rint);
figure;
hold on;
plot(xs(:,2),ys,'Marker','p','color','k','LineWidth',2,'MarkerSize',4,'LineStyle','none')
plot(xs,z,'-','Marker','none','color','r','LineWidth',2);
xmin=min(min([out1 out2]));
xmax=max(max([out1 out2]));
axis([xmin xmax xmin xmax]);
xlabel('Observation');
ylabel('Prediction');
grid on
box on
set(gca,'GridLineStyle',':','LineWidth',2,'GridColor','k')
if b(2) ~=0
    str=sprintf('y=%4.4f*x+%4.4f',b(2),b(1));
else
    str=sprintf('y=%4.4f*x',b(2));
end
x=(xmax+xmin)/2;%ȡ������е�
y=x;
y=y-(x-xmin)/3;
text(x,y,str);
str=sprintf('R^2=%4.4f\n',stats(1));
y=y-(x-xmin)/4;
text(x,y,str);



