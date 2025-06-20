load AllJapanRobotrace2024.mat

dSize = max(size(xyCourse));
fxyCourse = zeros(dSize, 2);
fxyCourse(1,:) = xyCourse(1,:);

a = 0.95;
for i = 2:dSize
    fxyCourse(i,1) = a*fxyCourse(i-1,1) + (1-a)*xyCourse(i,1);
    fxyCourse(i,2) = a*fxyCourse(i-1,2) + (1-a)*xyCourse(i,2);
end;

f2 = figure(2);
set(f2, 'color', 'white');
plot(fxyCourse(:,1), fxyCourse(:,2),'b', xyCourse(:,1), xyCourse(:,2),'r--', 'LineWidth',2);grid;
legend('Shortcut course','Original course', 'FontSize',14, 'Location', 'southeast');
% hold;
% plot(xyCourse(:,1), xyCourse(:,2),'r', 'LineWidth',1);hold
axis([100 400 0 100]); 
% axis([0 955 0 370]); 
set(gca,'DataAspectRatio',[1 1 1]);
set(gca,'FontSize',14);
title('2024 All Japan Robotrace contest course - Shortcut test', 'fontsize',18);
xlabel('Length in cm', 'fontsize',16);
ylabel('Length in cm', 'fontsize',16);