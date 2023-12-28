function [R,stats] = shandiantu( confirmout,simout )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%画出散点图，
%R相关系数
%stats=[R2,F,p]
out1=confirmout; out2=simout;
tmp= corrcoef(out1,out2);
R=tmp(2,1); % 相关系数
xs=out1;
ys=out2;
if size(xs,1)==1
    xs=xs';  %转置为列
end
if size(ys,1)==1
    ys=ys'; %转置为列
end
xs=[ones(size(xs,1),1),xs];%加入一列全都是1的列，作为常数项
[b,~,r,rint,stats]= regress(ys,xs);%利用最小二乘法求局部中心线的斜率k和b
z=b(1)+b(2)*out1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%残差分析图
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
x=(xmax+xmin)/2;%取坐标的中点
y=x;
y=y-(x-xmin)/3;
text(x,y,str);
str=sprintf('R^2=%4.4f\n',stats(1));
y=y-(x-xmin)/4;
text(x,y,str);



