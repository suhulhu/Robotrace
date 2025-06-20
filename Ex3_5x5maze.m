% Plot a 5x5 maze and a mouse at the start cell
wall=[2 0 1 0 3 0 1 0 1 2 3 0 1 0 2 0 2 1 2 3 3 1 1 1 3];
yw = -9:18:279;
for x = -9:18:279
    if (x==9) 
        % mark the goal area
        rectangle('Position',[117 117 36 36],'FaceColor',[1 0.7 0.7],'EdgeColor','w');
        hold;
    end;
    % mark pole locations
    plot(x*ones(size(yw)),yw,'rs','MarkerFaceColor','r','MarkerSize',2);
end;
axis([-25 295 -25 295]);
axis('square');
% plot maze boundaries
plot([-9 279], [-9 -9],'r'); plot([279 279], [-9 279],'r');
plot([-9 279], [279 279],'r'); plot([-9 -9], [-9 279],'r');
for i=1:256
    if (rem(wall(i),2)==1)  % North wall exists at cell i
        plot([(rem(i-1,16))*18-9 (rem(i-1,16))*18+9],[floor((i-1)/16)*18+9 floor((i-1)/16)*18+9],'r');
    end;
    a = floor(wall(i)/2);
    if (rem(a,2)==1)        % East wall exists at cell i
        plot([(rem(i-1,16))*18+9 (rem(i-1,16))*18+9],[floor((i-1)/16)*18-9 floor((i-1)/16)*18+9],'r');
    end;
end;
hold;
set(gca,'XTick',[0 54 108 162 216 270])
set(gca,'YTick',[0 54 108 162 216 270])
title('Press "\bfFINISH\rm" button to stop the design','FontSize',14);
xlabel('X coordinate in cm','fontsize',12);
ylabel('Y coordinate in cm','fontsize',12);
