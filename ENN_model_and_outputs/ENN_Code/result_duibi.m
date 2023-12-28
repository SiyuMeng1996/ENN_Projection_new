function result_duibi(confirm_out,simout1)
%���3��Ԥ��ֵ
%confirm_out ��ʵֵ
%simout1 Ԥ��ֵ
%msg1 ��������
n=3 ;%�ж������������

if n ==3 %1��Ԥ�����Ա�
      figure;
      title('Ԥ��ֵ��۲�ֵ�Ա�');
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

      
      %% �ٷֱ����ͼ
      figure;
      %title('Ԥ�������ٷֱ�');
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

end %1��Ԥ�����Ա� ����

if n ==5 %����Ԥ�����Ա�
      figure;
      title('������Ԥ��ֵ��۲�ֵ�Ա�');
      plot(confirm_out,'r-x');hold on;
      plot(simout1,'b-*');hold on;
      plot(simout2,'g-');hold on;
      xlabel('�����(��)');
      ylabel('Ҷ����Ũ��');
      legend('�۲�ֵ',msg1,msg2);      
      
      figure;
      title('������Ԥ�������ٷֱ�');
      e=abs(simout1-confirm_out)./confirm_out*100; 
      e(find(e >1000 ))=1000;
      plot(e,'b-*');hold on;
      e=abs(simout2-confirm_out)./confirm_out*100;
      e(find(e >1000 ))=1000;
      plot(e,'g-');hold on;
      
      xlabel('�����(��)');
      ylabel('Ԥ�����ٷֱ�');
      legend(msg1,msg2);
end %����Ԥ�����Ա� ����

if n ==7 %����Ԥ�����Ա�
      figure;
      title('������Ԥ��ֵ��۲�ֵ�Ա�');
      plot(confirm_out,'r-+');hold on;
      plot(simout1,'b-*');hold on;
      plot(simout2,'g-');hold on;
      plot(simout3,'k-x');hold on;
      xlabel('�����(��)');
      ylabel('���ܷ����ط�����0.01MJ\cdot m^{-2}��');
      legend('�۲�ֵ',msg1,msg2,msg3);      
      
      figure;
      title('������Ԥ�������ٷֱ�');
      e=abs(simout1-confirm_out)./confirm_out*100;
      plot(e,'b-*');hold on;
      e=abs(simout2-confirm_out)./confirm_out*100;
      plot(e,'g-');hold on;
      e=abs(simout3-confirm_out)./confirm_out*100;
      plot(e,'k-x');
      xlabel('�����(��)');
      ylabel('Ԥ�����ٷֱ�');
      legend(msg1,msg2,msg3);
end %����Ԥ�����Ա� ����

end

 