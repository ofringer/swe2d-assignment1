% Compare predictions to observations at the locations of the 3
% tide gauges. Model predictions from swe2d.m are in the array
% h_out() (which is assumed to exist as a global variable when this
% script is run), while observations are in tidedata().

load('data/tidestation.mat');
hoffset=-4;

fontsize=10;

figure(1)
clf;

subplot(3,1,1)
hold on
set(gca,'box','on','fontsize',fontsize);
plot(t/3600/24,h_out(:,1)-hoffset,'k--')
plot(tidetime,tidedata(:,1),'k-');
axis([0,max(t)/3600/24, -2, 2])
xlabel('time (days)')
ylabel('h(t) (m)');
title(tidename(1));
legend('predicted','observed','location','southwest');

subplot(3,1,2)
hold on
set(gca,'box','on','fontsize',fontsize);
plot(t/3600/24,h_out(:,2)-hoffset,'k--')
plot(tidetime,tidedata(:,2),'k-');
axis([0,max(t)/3600/24, -2, 2])
xlabel('time (days)')
ylabel('h(t) (m)');
title(tidename(2));
legend('predicted','observed','location','southwest');

subplot(3,1,3)
hold on
set(gca,'box','on','fontsize',fontsize);
plot(t/3600/24,h_out(:,3)-hoffset,'k--')
plot(tidetime,tidedata(:,3),'k-');
axis([0,max(t)/3600/24, -2, 2])
xlabel('time (days)')
ylabel('h(t) (m)');
title(tidename(3));
legend('predicted','observed','location','southwest');