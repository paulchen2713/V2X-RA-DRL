% clc
% clear
%close all
% figure(1);  %%Loss
% a=1:500;
% b=train_loss(a,1);
% c=train_loss(a,2);
% d=train_loss(a,3);
% e=train_loss(a,4);
% f=train_loss(a,5);
% % plot(a,b,'r-',a,c,'y-',a,d,'g-',a,e,'b-',a,f,'k-')
% plot(a,b,'-',a,c,'-',a,d,'-',a,e,'-',a,f,'-');
% % grid;
% xlabel('Training episodes');
% ylabel('Loss');
% legend('V2V link 1','V2V link 2','V2V link 3','V2V link 4','V2V link 5','location','northeast');

% magnifyOnFigure(fig,...
%         'initialPositionSecondaryAxes', [300 100 164.941 102.65],...
%         'initialPositionMagnifier',     [0 0 43*3 340/9] ); 



figure(2);  %%Return
x=1:500;
for i=1:500
    z(i,1)=sum(reward((i-1)*100+1:100*i,1));
end
plot(x,z)
xlabel('Number of iterations');
ylabel('Return');
grid;
set (gca,'outerposition',[-0.059285714285714,-0.004425942156004,1.14285714285714,1.05755185509787] );
% ylabel('\fontname{Euclid} \fontsize{14} c_1\Sigma C_m [m, t] + c_2 (min C_k [m,t] - \delta)');

% figure(3);  %%Return
% x=1:500;
% for i=1:500
%     z(i,1)=sum(reward_c1((i-1)*100+1:100*i,1));
% end
% plot(x,z)
% xlabel('Training episodes','fontsize',18);
% ylabel('Return c1','fontsize',18);
% grid;
% set (gca,'outerposition',[-0.059285714285714,-0.004425942156004,1.14285714285714,1.05755185509787] );
% % ylabel('\fontname{Euclid} \fontsize{14} c_1\Sigma C_m [m, t] + c_2 (min C_k [m,t] - \delta)');
% 
% figure(4);  %%Return
% x=1:500;
% for i=1:500
%     z(i,1)=sum(reward_c2((i-1)*100+1:100*i,1));
% end
% plot(x,z)
% xlabel('Training episodes','fontsize',18);
% ylabel('Return c2','fontsize',18);
% grid;
% set (gca,'outerposition',[-0.059285714285714,-0.004425942156004,1.14285714285714,1.05755185509787] );
% % ylabel('\fontname{Euclid} \fontsize{14} c_1\Sigma C_m [m, t] + c_2 (min C_k [m,t] - \delta)');

% figure(5);  %%每個episode的平均
% a=1:100;
% b=V2I_capacity(1,a);
% c=V2I_capacity_sarl(1,a);
% d=V2I_capacity_rand(1,a);
% e=V2I_capacity_none(1,a);
% f=V2I_capacity_sarl_none(1,a);
% plot(a,b,'-*',a,c,'-diamond',a,d,'-o',a,e,'-+',a,f,'-pentagram')
% xlabel('Testing episodes');
% ylabel('Sum capacity of V2I links (Mbps)');
% legend({'MARL','SeARL','Random','MARL(no delta)','SeARL(no delta)'},'Location','NorthEastOutside');

% figure(6);  %%每個episode的平均(CDF)
% [g1, w1] = ecdf(V2I_capacity(1,:));
% [g2, w2] = ecdf(V2I_capacity_sarl(1,:));
% [g3, w3] =ecdf(V2I_capacity_rand(1,:));
% [g4, w4] = ecdf(V2I_capacity_record_none(1,:));
% [g5, w5] = ecdf(V2I_capacity_sarl_record_none(1,:));
% plot(w1, g1,'-or','linewidth',1.5,'markerindices',1:round(length(w1)/10):length(w1)); hold on;
% plot(w2, g2,'-pentagram','linewidth',1.5,'color',[0.9290 0.6940 0.1250],'markerindices',1:round(length(w2)/10):length(w2)); hold on;
% plot(w3, g3,'-s','linewidth',1.5,'color',[0 0.4470 0.7410],'markerindices',1:round(length(w3)/10):length(w3)); hold on;
% plot(w4, g4,'--or','linewidth',1.5,'markerindices',1:round(length(w4)/10):length(w4)); hold on;
% plot(w5, g5,'--pentagram','linewidth',1.5,'color',[0.9290 0.6940 0.1250],'markerindices',1:round(length(w5)/10):length(w5)); hold off;
% axis([33 75 0 1]);
% xlabel('Sum capacity of V2I links (Mbps)','fontsize',18);
% ylabel('CDF','fontsize',18);
% legend({'Proposed','SeARL', 'Random','Proposed (no \delta)','SeARL (no \delta)'},'Location','SouthEast','fontsize',14);
% set (gca,'outerposition',[-0.059285714285714,-0.004425942156004,1.14285714285714,1.05755185509787] );
% grid;

% figure(7)  %%第k個episode的值
% % k=1;
% a=1:100;
% b=V2I_capacity_record(k,:);
% c=V2I_capacity_sarl_record(k,:);
% d=V2I_capacity_rand_record(k,:);
% e=V2I_capacity_record_none(k,:);
% f=V2I_capacity_sarl_record_none(k,:);
% plot(a,b,'-*',a,c,'-diamond',a,d,'-o',a,e,'-+',a,f,'-pentagram')
% xlabel('Time step (ms)');
% ylabel('Sum capacity of V2I links (Mbps)');
% legend({'MARL','SeARL', 'Random','MARL(no delta)','SeARL(no delta)'},'Location','NorthEastOutside');
% % 

figure(8)  %%第k個episode的值(CDF)
[g1, w1] = ecdf(reshape(V2I_capacity_record,[10000,1]));
[g2, w2] = ecdf(reshape(V2I_capacity_record_none,[10000,1]));
[g3, w3] = ecdf(reshape(V2I_capacity_sarl_record,[10000,1]));
[g4, w4] = ecdf(reshape(V2I_capacity_sarl_record_none,[10000,1]));
[g5, w5] =ecdf(reshape(V2I_capacity_rand_record,[10000,1]));
% [g4, w4] = ecdf(reshape(V2I_capacity_record_none,[10000,1]));
% [g5, w5] = ecdf(reshape(V2I_capacity_sarl_record_none,[10000,1]));
plot(w1, g1,'r','linewidth',2); hold on;
plot(w2, g2,'--r','linewidth',2); hold on;
plot(w3, g3,'linewidth',2,'color',[0.9290 0.6940 0.1250]); hold on;
plot(w4, g4,'--','linewidth',2,'color',[0.9290 0.6940 0.1250]); hold on;
plot(w5, g5,'linewidth',2,'color',[0 0.4470 0.7410]); hold off;
% xlim([0 50])
axis([-inf 120 0 1]);
xlabel('Sum capacity of V2I links (Mbps)');
ylabel('CDF');
% legend({'Proposed','SeARL', 'Random','Proposed (no \delta)','SeARL (no \delta)'},'Location','SouthEast','fontsize',14);
legend({'Proposed (adaptive \delta)','Proposed (fixed \delta)', 'SeARL (adaptive \delta)','SeARL (fixed \delta)','Random'},'Location','SouthEast');
grid;
set (gca,'outerposition',[-0.059285714285714,-0.004425942156004,1.14285714285714,1.05755185509787] );

% figure(9);  %%每個episode的平均
% a=1:100;
% for i=1:100
%     b(1,i)=mean(V2V_rate_min(i,:));
%     c(1,i)=mean(V2V_rate_min_sarl(i,:));
%     d(1,i)=mean(V2V_rate_min_rand(i,:));
%     e(1,i)=mean(V2V_rate_min_none(i,:));
%     f(1,i)=mean(V2V_rate_min_sarl_none(i,:));
% end
% plot(a,b,'-*',a,c,'-diamond',a,d,'-o',a,e,'-+',a,f,'-pentagram')
% xlabel('Testing episodes');
% ylabel('V2V transmission rate (Mbps)');
% legend({'MARL','SeARL', 'Random','MARL(no delta)','SeARL(no delta)'},'Location','NorthEastOutside');
% 
% figure(10);  %%每個episode的平均(CDF)
% [g1, w1] = ecdf(b(1,:));
% [g2, w2] = ecdf(c(1,:));
% [g3, w3] =ecdf(d(1,:));
% [g4, w4] = ecdf(e(1,:));
% [g5, w5] = ecdf(f(1,:));
% plot(w1, g1,'-*'); hold on;
% plot(w2, g2,'-diamond'); hold on;
% plot(w3, g3,'-o'); hold on;
% plot(w4, g4,'-+'); hold on;
% plot(w5, g5,'-pentagram'); hold off;
% % xlim([0 50])
% xlabel('V2V transmission rate (Mbps)');
% ylabel('CDF');
% legend({'MARL','SeARL', 'Random','MARL(no delta)','SeARL(no delta)'},'Location','NorthEastOutside');

% figure(11)  %%第k個episode的值
% k=16;
% a=1:100;
% b=V2V_rate_min(k,:);
% c=V2V_rate_min_sarl(k,:);
% d=V2V_rate_min_rand(k,:);
% e=V2V_rate_min_none(k,:);
% f=V2V_rate_min_sarl_none(k,:);
% plot(a,b,'-*',a,c,'-diamond',a,d,'-o',a,e,'-+',a,f,'-pentagram')
% xlabel('Time step (ms)');
% ylabel('V2V transmission rate (Mbps)');
% legend({'MARL','SeARL', 'Random','MARL(no delta)','SeARL(no delta)'},'Location','NorthEastOutside');

figure(12)  %%第k個episode的值(CDF)
% fig=figure(10)  %%第k個episode的值(CDF)
% k=93;
[f1, x1] = ecdf(reshape(V2V_rate_min*1000,[10000,1]));
[f2, x2] = ecdf(reshape(V2V_rate_min_none*1000,[10000,1]));
[f3, x3] = ecdf(reshape(V2V_rate_min_sarl*1000,[10000,1]));
[f4, x4] = ecdf(reshape(V2V_rate_min_sarl_none*1000,[10000,1]));
[f5, x5] = ecdf(reshape(V2V_rate_min_rand*1000,[10000,1]));
% [f3, x3] =ecdf((V2V_rate_min_rand(k,:)+2.2204e-16*rand(1,100))*1000);
% [f4, x4] = ecdf(reshape(V2V_rate_min_none*1000,[10000,1]));
% [f5, x5] = ecdf(reshape(V2V_rate_min_sarl_none*1000,[10000,1]));
plot(x1, f1,'-r','linewidth',2); hold on;
plot(x2, f2,'--r','linewidth',2); hold on;
plot(x3, f3,'-','linewidth',2,'color',[0.9290 0.6940 0.1250]); hold on;
plot(x4, f4,'--','linewidth',2,'color',[0.9290 0.6940 0.1250]); hold on;
plot(x5, f5,'-','linewidth',2,'color',[0 0.4470 0.7410]); hold off;
xlim([0 40])
xlabel('Minimal capacity of V2V links (kbps)');
ylabel('CDF');
% legend({'Proposed','SeARL', 'Random','Proposed (no \delta)','SeARL (no \delta)'},'Location','SouthEast','fontsize',14);
legend({'Proposed (adaptive \delta)','Proposed (fixed \delta)', 'SeARL (adaptive \delta)','SeARL (fixed \delta)','Random'},'Location','SouthEast');
grid;
set (gca,'outerposition',[-0.059285714285714,-0.004425942156004,1.14285714285714,1.05755185509787] );
% set (gca,'outerposition',[-0.059285714285714,-0.004425942156004,1.14285714285714,1.05755185509787] );
% magnifyOnFigure(fig,...
%         'initialPositionSecondaryAxes', [326.933 100 164.941 102.65],...
%         'initialPositionMagnifier',     [0 500 43*2 340/9] ); 

% figure(13)
% k=50;
% o1_0 = mean(V2I_capacity_0(1,:));
% o2_1 = mean(V2V_rate_min_1(1,:));
% % o2_1 = mean(V2V_rate_min_rand_1,'all');
% 
% o1_01 = mean(V2I_capacity_01(1,:));
% o2_09 = mean(V2V_rate_min_09(k,:));
% % o2_09 = mean(V2V_rate_min_rand_09,'all');
% 
% o1_02 = mean(V2I_capacity_02(1,:));
% o2_08 = mean(V2V_rate_min_08(k,:));
% 
% o1_03 = mean(V2I_capacity_03(1,:));
% o2_07 = mean(V2V_rate_min_07(k,:));
% 
% o1_04 = mean(V2I_capacity_04(1,:));
% o2_06 = mean(V2V_rate_min_06(k,:));
% 
% o1_05 = mean(V2I_capacity_05(1,:));
% o2_05 = mean(V2V_rate_min_05(k,:));
% 
% o1_06 = mean(V2I_capacity_06(1,:));
% o2_04 = mean(V2V_rate_min_04(k,:));
% 
% o1_07 = mean(V2I_capacity_07(1,:));
% o2_03 = mean(V2V_rate_min_03(k,:));
% 
% o1_08 = mean(V2I_capacity_08(1,:));
% o2_02 = mean(V2V_rate_min_02(k,:));
% 
% o1_09 = mean(V2I_capacity_09(1,:));
% o2_01 = mean(V2V_rate_min_01(k,:));
% 
% o1_1 = mean(V2I_capacity_1(1,:));
% o2_0 = mean(V2V_rate_min_0(k,:));
% 
% plot(o1_0,o2_1,'*')
% hold on;
% plot(o1_01,o2_09,'*')
% hold on;
% plot(o1_02,o2_08,'*')
% hold on;
% plot(o1_03,o2_07,'*')
% hold on;
% plot(o1_04,o2_06,'*')
% hold on;
% plot(o1_05,o2_05,'*')
% hold on;
% plot(o1_06,o2_04,'o')
% hold on;
% plot(o1_07,o2_03,'o')
% hold on;
% plot(o1_08,o2_02,'o')
% hold on;
% plot(o1_09,o2_01,'o')
% hold on;
% plot(o1_1,o2_0,'o')
% hold on;
% xlabel('V2I sum capacity (Mbps)');
% ylabel('V2V min rate (Mbps)');
% legend('(0,1)','(0.1,0.9)','(0.2,0.8)','(0.3,0.7)','(0.4,0.6)','(0.5,0.5)','(0.6,0.4)','(0.7,0.3)','(0.8,0.2)','(0.9,0.1)','(1,0)');

clear g1 g2 g3 g4 g5 w1 w2 w3 w4 w5
figure(14);  %%不同權重的每個episode的平均(CDF)
[g0, w0] = ecdf(reshape(V2I_capacity_0,[10000,1]));
[g1, w1] = ecdf(reshape(V2I_capacity_01,[10000,1]));
[g2, w2] =ecdf(reshape(V2I_capacity_record,[10000,1]));
[g3, w3] = ecdf(reshape(V2I_capacity_03,[10000,1]));
[g4, w4] = ecdf(reshape(V2I_capacity_04,[10000,1]));
[g5, w5] = ecdf(reshape(V2I_capacity_05,[10000,1]));
[g6, w6] = ecdf(reshape(V2I_capacity_06,[10000,1]));
[g7, w7] = ecdf(reshape(V2I_capacity_07,[10000,1]));
[g8, w8] = ecdf(reshape(V2I_capacity_08,[10000,1]));
[g9, w9] = ecdf(reshape(V2I_capacity_09,[10000,1]));
[g10, w10] = ecdf(reshape(V2I_capacity_1,[10000,1]));
% plot(w0, g0,'-or','linewidth',1.5,'color',[0.8500 0.3250 0.0980],'markerindices',1:round(length(w0)/10):length(w0)); hold on;
plot(w1, g1,'-','linewidth',2,'color',[0 0.4470 0.7410]); hold on;
plot(w2, g2,'-r','linewidth',2); hold on;
% plot(w3, g3,'-s','linewidth',1.5,'color',[0 0.4470 0.7410],'markerindices',1:round(length(w3)/10):length(w3)); hold on;
plot(w4, g4,'-','linewidth',2,'color',[0.9290 0.6940 0.1250]); hold on;
% plot(w5, g5,'--pentagram','linewidth',1.5,'color',[0 0.4470 0.7410],'markerindices',1:round(length(w5)/10):length(w5)); hold on;
plot(w6, g6,'-','linewidth',2,'color',[0.4940 0.1840 0.5560]); hold on;
% plot(w7, g7,'--pentagram','linewidth',1.5,'color',[0.4660 0.6740 0.1880],'markerindices',1:round(length(w7)/10):length(w7)); hold on;
plot(w8, g8,'-','linewidth',2,'color',[0.4660 0.6740 0.1880]); hold on;
plot(w9, g9,'-','linewidth',2,'color',[0.3010 0.7450 0.9330]); hold off;
% plot(w10, g10,'--pentagram','linewidth',1.5,'color',[0 0 0],'markerindices',1:round(length(w10)/10):length(w10)); hold off;
% xlim([0 50])
xlabel('Sum capacity of V2I links (Mbps)');
ylabel('CDF');
grid;
set (gca,'outerposition',[-0.059285714285714,-0.004425942156004,1.14285714285714,1.05755185509787] );
% legend('(0,1)','(0.1,0.9)','(0.2,0.8)','(0.3,0.7)','(0.4,0.6)','(0.5,0.5)','(0.6,0.4)','(0.7,0.3)','(0.8,0.2)','(0.9,0.1)','(1,0)');
% legend('(0,1)','(0.2,0.8)','(0.5,0.5)','(0.8,0.2)','(1,0)');
legend({'(0.1,0.9)','(0.2,0.8)','(0.4,0.6)','(0.6,0.4)','(0.8,0.2)','(0.9,0.1)'},'Location','SouthEast');

clear f1 f2 f3 f4 f5 x1 x2 x3 x4 x5
% figure(15)  %%第k個episode的值(CDF)
fig=figure(15)  %%第k個episode的值(CDF)
% k=16;
[f0, x0] = ecdf(reshape(V2V_rate_min_0*1000,[10000,1]));
[f1, x1] = ecdf(reshape(V2V_rate_min_01*1000,[10000,1]));
[f2, x2] = ecdf(reshape(V2V_rate_min_02*1000,[10000,1]));
[f3, x3] =ecdf(reshape(V2V_rate_min_03*1000,[10000,1]));
[f4, x4] = ecdf(reshape(V2V_rate_min_04*1000,[10000,1]));
[f5, x5] = ecdf(reshape(V2V_rate_min_05*1000,[10000,1]));
[f6, x6] = ecdf(reshape(V2V_rate_min_06*1000,[10000,1]));
[f7, x7] = ecdf(reshape(V2V_rate_min_07*1000,[10000,1]));
[f8, x8] = ecdf(reshape(V2V_rate_min*1000,[10000,1]));
[f9, x9] = ecdf(reshape(V2V_rate_min_09*1000,[10000,1]));
[f10, x10] = ecdf(reshape(V2V_rate_min_1*1000,[10000,1]));

% plot(x10, f10,'-or','linewidth',1.5,'color',[0.8500 0.3250 0.0980],'markerindices',1:round(length(x10)/10):length(x10)); hold on;
plot(x9, f9,'-','linewidth',2,'color',[0 0.4470 0.7410]); hold on;
plot(x8, f8,'-r','linewidth',2); hold on;
% plot(x7, f7,'-s','linewidth',1.5,'color',[0 0.4470 0.7410],'markerindices',1:round(length(x7)/10):length(x7)); hold on;
plot(x6, f6,'-','linewidth',2,'color',[0.9290 0.6940 0.1250]); hold on;
% plot(x5, f5,'--pentagram','linewidth',1.5,'color',[0 0.4470 0.7410],'markerindices',1:round(length(x5)/10):length(x5)); hold on;
plot(x4, f4,'-','linewidth',2,'color',[0.4940 0.1840 0.5560]); hold on;
% plot(x3, f3,'--pentagram','linewidth',1.5,'color',[0.4660 0.6740 0.1880],'markerindices',1:round(length(x3)/10):length(x3)); hold on;
plot(x2, f2,'-','linewidth',2,'color',[0.4660 0.6740 0.1880]); hold on;
plot(x1, f1,'-','linewidth',2,'color',[0.3010 0.7450 0.9330]); hold off;
% plot(x0, f0,'--pentagram','linewidth',1.5,'color',[0 0 0],'markerindices',1:round(length(x0)/10):length(x0)); hold off;

% plot(x0, f0,'--pentagram','linewidth',1.5,'color',[0 0 0],'markerindices',1:round(length(x0)/10):length(x0)); hold on;
% plot(x1, f1,'--pentagram','linewidth',1.5,'color',[0.6350 0.0780 0.1840],'markerindices',1:round(length(x1)/10):length(x1)); hold on;
% plot(x2, f2,'--pentagram','linewidth',1.5,'color',[0.3010 0.7450 0.9330],'markerindices',1:round(length(x2)/10):length(x2)); hold on;
% plot(x3, f3,'--pentagram','linewidth',1.5,'color',[0.4660 0.6740 0.1880],'markerindices',1:round(length(x3)/10):length(x3)); hold on;
% plot(x4, f4,'--pentagram','linewidth',1.5,'color',[0.4940 0.1840 0.5560],'markerindices',1:round(length(x4)/10):length(x4)); hold on;
% plot(x5, f5,'--pentagram','linewidth',1.5,'color',[0.9290 0.6940 0.1250],'markerindices',1:round(length(x5)/10):length(x5)); hold on;
% plot(x6, f6,'--or','linewidth',1.5,'markerindices',1:round(length(x6)/10):length(x6)); hold on;
% plot(x7, f7,'-s','linewidth',1.5,'color',[0 0.4470 0.7410],'markerindices',1:round(length(x7)/10):length(x7)); hold on;
% plot(x8, f8,'-pentagram','linewidth',1.5,'color',[0.9290 0.6940 0.1250],'markerindices',1:round(length(x8)/10):length(x8)); hold on;
% plot(x9, f9,'-or','linewidth',1.5,'markerindices',1:round(length(x9)/10):length(x9)); hold on;
% plot(x10, f10,'-or','linewidth',1.5,'color',[0.8500 0.3250 0.0980],'markerindices',1:round(length(x10)/10):length(x10)); hold off;
% xlim([0 2*10^-3])
xlabel('Minimal capacity of V2V links (kbps)');
ylabel('CDF');
% legend('(0,1)','(0.1,0.9)','(0.2,0.8)','(0.3,0.7)','(0.4,0.6)','(0.5,0.5)','(0.6,0.4)','(0.7,0.3)','(0.8,0.2)','(0.9,0.1)','(1,0)');
% legend('(0,1)','(0.2,0.8)','(0.5,0.5)','(0.8,0.2)','(1,0)');
legend({'(0.1,0.9)','(0.2,0.8)','(0.4,0.6)','(0.6,0.4)','(0.8,0.2)','(0.9,0.1)'},'Location','SouthEast');
grid;
set (gca,'outerposition',[-0.059285714285714,-0.004425942156004,1.14285714285714,1.05755185509787] );
magnifyOnFigure(fig,...
        'initialPositionSecondaryAxes', [326.933 100 164.941 102.65],...
        'initialPositionMagnifier',     [0 500 0.1 340/20] ); 

clear g1 g2 g3 g4 g5 w1 w2 w3 w4 w5
% figure(16);  %%不同權重的每個episode的平均(CDF)
% [g5, w5] = ecdf(reshape(V2I_capacity_record,[10000,1]));
% [g9, w9] = ecdf(reshape(V2I9_capacity_02,[10000,1]));
% 
% [g1, w1] = ecdf(reshape(V2I_capacity_sarl_record,[10000,1]));
% [g2, w2] = ecdf(reshape(V2I9_capacity_sarl_02,[10000,1]));
% 
% [g3, w3] = ecdf(reshape(V2I_capacity_rand_record,[10000,1]));
% [g4, w4] = ecdf(reshape(V2I9_capacity_rand,[10000,1]));
% 
% plot(w5, g5,'-pentagram','linewidth',1.5,'color',[0 0.4470 0.7410],'markerindices',1:round(length(w5)/10):length(w5)); hold on;
% plot(w9, g9,'--pentagram','linewidth',1.5,'color',[0 0.4470 0.7410],'markerindices',1:round(length(w9)/10):length(w9)); hold on;
% 
% plot(w1, g1,'-or','linewidth',1.5,'markerindices',1:round(length(w1)/10):length(w1)); hold on;
% plot(w2, g2,'--or','linewidth',1.5,'markerindices',1:round(length(w2)/10):length(w2)); hold on;
% 
% plot(w3, g3,'-s','linewidth',1.5,'color',[0.9290 0.6940 0.1250],'markerindices',1:round(length(w3)/10):length(w3)); hold on;
% plot(w4, g4,'--s','linewidth',1.5,'color',[0.9290 0.6940 0.1250],'markerindices',1:round(length(w4)/10):length(w4)); hold off;
% 
% xlabel('Sum capacity of V2I links (Mbps)');
% ylabel('CDF');
% 
% legend('proposed(5 vehicles)','proposed(9 vehicles)','SeARL(5 vehicles)','SeARL(9 vehicles)','random(5 vehicles)','random(9 vehicles)');
% grid;
% 
% clear f1 f2 f3 f4 f5 x1 x2 x3 x4 x5
% figure(17)  %%第k個episode的值(CDF)
% % fig=figure(13)  %%第k個episode的值(CDF)
% k=16;
% 
% [f5, x5] = ecdf(reshape(V2V_rate_min*1000,[10000,1]));
% [f9, x9] = ecdf(reshape(V2V9_rate_min*1000,[10000,1]));
% 
% [f1, x1] = ecdf(reshape(V2V_rate_min_sarl*1000,[10000,1]));
% [f2, x2] = ecdf(reshape(V2V9_rate_min_sarl*1000,[10000,1]));
% 
% [f3, x3] =ecdf(reshape(V2V_rate_min_rand*1000,[10000,1]));
% [f4, x4] = ecdf(reshape(V2V9_rate_min_rand*1000,[10000,1]));
% 
% plot(x5, f5,'-pentagram','linewidth',1.5,'color',[0 0.4470 0.7410],'markerindices',1:round(length(x5)/10):length(x5)); hold on;
% plot(x9, f9,'--pentagram','linewidth',1.5,'color',[0 0.4470 0.7410],'markerindices',1:round(length(x9)/10):length(x9)); hold on;
% 
% plot(x1, f1,'-or','linewidth',1.5,'markerindices',1:round(length(x1)/10):length(x1)); hold on;
% plot(x2, f2,'--or','linewidth',1.5,'markerindices',1:round(length(x2)/10):length(x2)); hold on;
% 
% plot(x3, f3,'-s','linewidth',1.5,'color',[0.9290 0.6940 0.1250],'markerindices',1:round(length(x3)/10):length(x3)); hold on;
% plot(x4, f4,'--s','linewidth',1.5,'color',[0.9290 0.6940 0.1250],'markerindices',1:round(length(x4)/10):length(x4)); hold off;
% 
% xlim([0 50]);
% 
% xlabel('V2V transmission rate (kbps)');
% ylabel('CDF of min V2V rate');
% 
% legend('proposed(5 vehicles)','proposed(9 vehicles)','SeARL(5 vehicles)','SeARL(9 vehicles)','random(5 vehicles)','random(9 vehicles)');
% grid;

