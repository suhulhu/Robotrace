%
promptX = [2 2 -2 -2]; promptY = [1 -1 -1 1];
pgon=polyshape(promptX,promptY);
plot(pgon,'FaceColor','black','EdgeColor','black','FaceAlpha',0.3);
axis([-3 15 -3 15]);axis('equal');box on;hold on;grid;
Pcenter = [4;0] + 7*[cos(pi/4);sin(pi/4)];
Rot = [cos(pi/4) -sin(pi/4);sin(pi/4) cos(pi/4)];
promptXY= Rot*[promptX;promptY];
pgon=polyshape(promptXY(1,:)+Pcenter(1),promptXY(2,:)+Pcenter(2));
plot(pgon,'FaceColor','red','EdgeColor','red','FaceAlpha',0.3);
hold off;