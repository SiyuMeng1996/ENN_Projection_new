function result_duibi(confirm_out,simout1)
%最多3个预测值
%confirm_out 真实值
%simout1 预测值
%msg1 方法名称
n=3 ;%判断输入参数个数

if n ==3 %1个预测量对比
      figure;
      title('预估值与观测值对比');
      hold on;
      plot(simout1,'-','Marker','.','color',[99 184 255]/255,'LineWidth',1,...
      'MarkerSize',10,...
      'MarkerEdgeColor',[99 184 255]/255,...
      'MarkerFaceColor',[255 255 255]/255);
      hold on;
      xlabel('Month');
      ylabel('Observation');
      e=simout1-confirm_out;
      grid on
      box on
      linefit=polyfit([1:95*12],simout1',1);
      yy1=linefit(1)*[1:95*12]+linefit(2);
      plot([1:95*12],yy1,'--','linewidth',1.6,'color','b')
      lin=(yy1(end)-yy1(1))/95/nanmean(yy1)
      set(gca,'GridLineStyle',':','LineWidth',2,'GridColor','k')

      
      %% 百分比误差图
      figure;
      %title('预估的误差百分比');
      e=abs(simout1-confirm_out)./confirm_out*100;
      e(find(e >1000 ))=1000;
      plot(e,'-','Marker','+','color',[139 137 137]/255,'LineWidth',2,...
      'MarkerSize',10,...
      'MarkerEdgeColor',[139 137 137]/255,...
      'MarkerFaceColor',[255 255 255]/255);
      hold on;
      xlabel('month');
      ylabel('Error(%)');
      grid on
      set(gca,'GridLineStyle',':','LineWidth',2,'GridColor','k')
      set(gcf,'color','w')

end %1个预测量对比 结束

if n ==5 %二个预测量对比
      figure;
      title('各方法预估值与观测值对比');
      plot(confirm_out,'r-x');hold on;
      plot(simout1,'b-*');hold on;
      plot(simout2,'g-');hold on;
      xlabel('日序号(天)');
      ylabel('叶绿素浓度');
      legend('观测值',msg1,msg2);      
      
      figure;
      title('各方法预估的误差百分比');
      e=abs(simout1-confirm_out)./confirm_out*100; 
      e(find(e >1000 ))=1000;
      plot(e,'b-*');hold on;
      e=abs(simout2-confirm_out)./confirm_out*100;
      e(find(e >1000 ))=1000;
      plot(e,'g-');hold on;
      
      xlabel('日序号(天)');
      ylabel('预估误差百分比');
      legend(msg1,msg2);
end %二个预测量对比 结束

if n ==7 %三个预测量对比
      figure;
      title('各方法预估值与观测值对比');
      plot(confirm_out,'r-+');hold on;
      plot(simout1,'b-*');hold on;
      plot(simout2,'g-');hold on;
      plot(simout3,'k-x');hold on;
      xlabel('日序号(天)');
      ylabel('日总辐射曝辐量（0.01MJ\cdot m^{-2}）');
      legend('观测值',msg1,msg2,msg3);      
      
      figure;
      title('各方法预估的误差百分比');
      e=abs(simout1-confirm_out)./confirm_out*100;
      plot(e,'b-*');hold on;
      e=abs(simout2-confirm_out)./confirm_out*100;
      plot(e,'g-');hold on;
      e=abs(simout3-confirm_out)./confirm_out*100;
      plot(e,'k-x');
      xlabel('日序号(天)');
      ylabel('预估误差百分比');
      legend(msg1,msg2,msg3);
end %三个预测量对比 结束

end

 