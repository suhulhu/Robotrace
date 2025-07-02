load AllJapanRobotrace2024.mat

dSize = max(size(xyCourse));
fxyCourse = zeros(dSize, 2);
fxyCourse(1,:) = xyCourse(1,:);

for i = 2:dSize
    fxyCourse(i,1) = 0.95*fxyCourse(i-1,1) + 0.05*xyCourse(i,1);
    fxyCourse(i,2) = 0.95*fxyCourse(i-1,2) + 0.05*xyCourse(i,2);
end;

f2 = figure(2);
plot(fxyCourse(:,1), fxyCourse(:,2),'k.', 'LineWidth',3);hold
plot(xyCourse(:,1), xyCourse(:,2),'r', 'LineWidth',3);