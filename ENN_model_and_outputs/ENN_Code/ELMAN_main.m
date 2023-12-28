
%%%%%%%%%%%%%%ÔËÐÐ¶àÉÙ´Î
tim=3;
MPEE=[];
INTEN_2=[];
fifi=nan*ones(3,95*12);
TYYYY='AREA';

tititi = 252; %ÓÃ¹Û²â¶àÉÙÔÂÊý¾ÝÀ´ÑµÁ·

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PERI='RCP85';

eval(['Linear_',PERI,'_tota=[1:50];'])
eval(['Linear_',PERI,'_ampl=[1:50];'])
eval(['Linear_',PERI,'_blti=[1:50];'])
eval(['Linear_',PERI,'_blin=[1:50];'])

KOKO=nan*ones(tim,95);
KOKOll=nan*ones(tim,95);
KOKOhh=nan*ones(tim,95);

for timmm=1:tim
     
%% Ñ¡ÔñÊäÈëÊý¾Ý
Mode = 'desert';
XX   =  8*23 ;
YY   =  8*45 ;

jinanin=ones(tititi+95*12,9);
jinanin(1:tititi,4)=T_OD_SR(1:tititi)';
jinanin(1:tititi,5)=T_OD_SST(1:tititi)';
jinanin(1:tititi,6)=T_OD_Curl(1:tititi)';

eval(['jinanin(tititi+1:end,4)=','TI_',PERI,'_SR',';']);
eval(['jinanin(tititi+1:end,5)=','TI_',PERI,'_SST',';']);
eval(['jinanin(tititi+1:end,6)=','TI_',PERI,'_Curl',';']);

if strcmp(TYYYY,'AREA')
jinanout=nanmean(AREA_M)*ones(tititi+95*12,3);
jinanout(1:tititi,3)=AREA_M(1:tititi)';
else
jinanout=nanmean(INTEN_M)*ones(tititi+95*12,3);
jinanout(1:tititi,3)=INTEN_M(1:tititi)';
end

%% ±£´æÊäÈëÊä³ö
save in jinanin
save out jinanout

%% µ¼ÈëÊý¾Ý
clc
close all
load in.mat jinanin
load out.mat jinanout
jinans=[jinanin(:,[4,5,6]),jinanout(:,3)];

%% ElmanÉñ¾­ÍøÂçÊäÈë
samp=jinans;
[m,n]=size(samp);
[all,mu,std]=zscore(samp);%ï¿½ï¿½Ò»ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Öµï¿½ï¿½ï¿½î·¨
samp=all;

ycn=1;%ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿?
xcn=size(samp,2)-ycn;%ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
test_cn=95*12;%ï¿½Ë´ï¿½ï¿½Þ¸ï¿½ï¿½ï¿½Ö¤ï¿½ï¿½Ýµï¿½ï¿½ï¿½ï¿½ï¿?
[sampin,sampout,confirm_in,confirm_out] = ceate_train_test_data(samp,ycn,test_cn,4);

nod1num= 20;%ï¿½ï¿½Ò»ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Úµï¿½ï¿½ï¿½
nod2num=5;%ï¿½Ú¶ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Úµï¿½ï¿½ï¿½
outnum=ycn;   %ï¿½ï¿½ï¿½ï¿½ï¿½Úµï¿½ï¿½ï¿½
TF1='tansig'; %sig ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Îªï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ä´ï¿½ï¿½Ýºï¿½ï¿½ï¿?
TF2='tansig'; %sig ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Îªï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ä´ï¿½ï¿½Ýºï¿½ï¿½ï¿?
TFout='purelin';%purelinï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ôºï¿½ï¿½ï¿½ï¿½ï¿½Îªï¿½ï¿½ï¿½ï¿½ï¿½Ä´ï¿½ï¿½Ýºï¿½ï¿½ï¿?
BTF='traingdx'; %traingdx  
[ t ]=threshold( xcn );%ï¿½ï¿½ï¿½ï¿½ï¿½Ã¿ï¿½ï¿½ï¿½ÐµÄ·ï¿½Î?
net=newelm(t,[nod1num,nod2num,outnum],{TF1,TF2,TFout},BTF);

net=init(net);%ï¿½ï¿½Ê¼ï¿½ï¿½
net.trainParam.epochs=2000;%Ñµï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
net.trainParam.goal =1.0e-5; %ï¿½ï¿½Ð¡È«ï¿½ï¿½ï¿½ï¿½ï¿?
net.trainParam.max_fail=20;%ï¿½ï¿½ï¿½ï¿½ï¿½Ö¤Ê§ï¿½Ü´ï¿½ï¿½ï¿?
sampin=sampin' ;%×ªï¿½Ã¾ï¿½ï¿½ï¿½
sampout=sampout';%×ªï¿½Ã¾ï¿½ï¿½ï¿½
[net,tr,Y,E,Pf,Af]=train(net,sampin,sampout);%Ñµï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
confirm_in=confirm_in'; %ï¿½ï¿½ï¿½ï¿½×ªï¿½ï¿½
confirm_out=confirm_out'; %ï¿½ï¿½ï¿½ï¿½×ªï¿½ï¿½
simout=sim(net,confirm_in);% ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ö¤ï¿½ï¿½ï¿?
 
%ï¿½ï¿½ï¿½ï¿½Ò»ï¿½ï¿½
simout=simout'; %×ªï¿½ï¿½
confirm_out=confirm_out';%×ªï¿½ï¿½
simout      = FanGuiYiHua(simout,mu(xcn+1:xcn+ycn),std(xcn+1:xcn+ycn));
confirm_out = FanGuiYiHua(confirm_out,mu(xcn+1:xcn+ycn),std(xcn+1:xcn+ycn)) ; 
%ï¿½ï¿½Ê¾ï¿½Ô±È½ï¿½ï¿?     
result_duibi(confirm_out,simout); 
disp('ELMANï¿½ï¿½MPE  RMSE')
MPE= sum(abs(simout-confirm_out)./confirm_out)/length(simout)*100 %ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
RMSE=sqrt(sum((simout-confirm_out).^2 ) /length(simout) )  %ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
[R,stats] = shandiantu( confirm_out,simout );
R 
R2=stats(1)
MPEE=[MPEE,MPE];

kk_1=simout';%Êä³ö½á¹ûÖÁkk_1
fifi(timmm,:)=kk_1;

figure
set(gcf,'unit','pixels','position',[0,10,1000,300])
hold on

plot([1:1140], kk_1,'-.^','color','k','linewidth',1,'markersize',2)
set(gca,'ycolor','k');

grid on
box on
set(gca,'xlim',[0 1141],'xtick',[-12:120:1140])
set(gca,'XTickLabel',{'2006','2015','2025','2035','2045','2055','2065','2075','2085','2095','2100'})
xtickangle(40)
set(gca,'GridLineStyle',':','LineWidth',2,'GridColor','k')
saveas(gcf,['PLOT_RCP85_',num2str(timmm),'.jpg'], 'jpg')

end

eval(['FINA_data_',TYYYY,'=fifi;']);
eval(['FINA_mean_',TYYYY,'=squeeze(nanmean(fifi));']);
