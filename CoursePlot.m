% Data structure
% struct xy, radius, angle: if radius=-1, straight line, otherwise circular
% arc, angle specifies where the point is
% unit: cm
clear;

Start.x = 40;	Start.y  = 110; Start.r = -1;   Start.ang = 0;
End.x = 40;   End.y = 210;  End.r = -1; End.ang = 0;

% Start to Point(1), Straight Line
Point(1).x = 60; Point(1).y = 50;   Point(1).r = 20;    Point(1).ang = pi;
tempPx0 = Point(1).x+Point(1).r*cos(Point(1).ang);
tempPy0 = Point(1).y+Point(1).r*sin(Point(1).ang);
xyCourse = [linspace(Start.x, tempPx0, 50)' linspace(Start.y, tempPy0, 50)'];

% Point(1) to Point(2), CCW arc
Point(2).x = 60; Point(2).y = 50;   Point(2).r = 20;    Point(2).ang = 3*pi/2;
theta = Point(1).ang:pi/100:Point(2).ang;
xyCourse = [xyCourse;(Point(1).x+Point(1).r*cos(theta))' (Point(1).y+Point(1).r*sin(theta))'];

% Point(2) to Point(3), Straight Line
Point(3).x = 208; Point(3).y = 45;   Point(3).r = 15;    Point(3).ang = Point(2).ang;
tempPx0 = Point(2).x+Point(2).r*cos(Point(2).ang);
tempPy0 = Point(2).y+Point(2).r*sin(Point(2).ang);
tempPx1 = Point(3).x+Point(3).r*cos(Point(3).ang);
tempPy1 = Point(3).y+Point(3).r*sin(Point(3).ang);
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, 50)' linspace(tempPy0, tempPy1, 50)'];

% Point(3) to Point(4), CCW arc
Point(4).x = 208; Point(4).y = 45;   Point(4).r = 15;    Point(4).ang = 0;
Point(5).x = 150; Point(5).y = 113;   Point(5).r = 10;    Point(5).ang = 0;
tempAng1 = atan2(Point(5).y-Point(4).y, Point(5).x-Point(4).x);
tempAng2 = asin((Point(5).r+Point(4).r)/norm([Point(5).x-Point(4).x Point(5).y-Point(4).y]));
tempAng = tempAng1+tempAng2-pi/2;
Point(4).ang = tempAng;
theta = (Point(3).ang-2*pi):pi/100:Point(4).ang;
xyCourse = [xyCourse;(Point(4).x+Point(4).r*cos(theta))' (Point(4).y+Point(4).r*sin(theta))'];

% Point(4) to Point(5), Straight Line
Point(5).ang = tempAng+pi;
tempPx0 = Point(4).x+Point(4).r*cos(Point(4).ang);
tempPy0 = Point(4).y+Point(4).r*sin(Point(4).ang);
tempPx1 = Point(5).x+Point(5).r*cos(Point(5).ang);
tempPy1 = Point(5).y+Point(5).r*sin(Point(5).ang);
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, 50)' linspace(tempPy0, tempPy1, 50)'];

% Point(5) to Point(6), CW arc
Point(6).x = 410; Point(6).y = 430;   Point(6).r = 400;    Point(6).ang = 0;
tempAng1 = atan2(Point(6).y-Point(5).y, Point(6).x-Point(5).x);
Point(6).ang = tempAng1;
theta = Point(5).ang:-pi/100:Point(6).ang;
xyCourse = [xyCourse;(Point(5).x+Point(5).r*cos(theta))' (Point(5).y+Point(5).r*sin(theta))'];

% Point(6) to Point(7), CCW arc, Point(7) to Point(8), CCW arc
Point(7).x = 410; Point(7).y = 430;  Point(7).r = 400;   Point(7).ang = 0;
Point(8).x = 585; Point(8).y = 87;   Point(8).r = 15;    Point(8).ang = 0;
tempAng1 = atan2(Point(7).y-Point(8).y, Point(7).x-Point(8).x);
Point(7).ang = tempAng1+pi;
Point(8).ang = tempAng1;
theta = (Point(6).ang+pi):pi/100:Point(7).ang;
xyCourse = [xyCourse;(Point(6).x+Point(6).r*cos(theta))' (Point(6).y+Point(6).r*sin(theta))'];
theta = (Point(8).ang-pi):pi/100:Point(8).ang;
xyCourse = [xyCourse;(Point(8).x+Point(8).r*cos(theta))' (Point(8).y+Point(8).r*sin(theta))'];

% Point(8) to Point(9), CW arc
Point(9).x  = 410; Point(9).y  = 430;  Point(9).r  = 370;   Point(9).ang  = 0;
A = acos((400^2+360^2-45^2)/2/400/360);
tempX = 410+400*sin(A); tempY = 430-400*cos(A);
tempAng1 = atan2(Point(9).y-tempY, Point(9).x-tempX);
Point(9).ang = tempAng1+pi;
theta = (Point(8).ang+pi):-pi/100:Point(9).ang;
xyCourse = [xyCourse;(Point(9).x+Point(9).r*cos(theta))' (Point(9).y+Point(9).r*sin(theta))'];
Point(10).x = tempX; Point(10).y = tempY;   Point(10).r = 30;   Point(10).ang = 0;

% Point(9) to Point(10), CCW arc
Point(11).x = 410; Point(11).y = 70;   Point(11).r = 15;   Point(11).ang = 0;
tempAng1 = atan2(Point(11).y-Point(10).y, Point(11).x-Point(10).x);
Point(10).ang = tempAng1;
Point(11).ang = tempAng1-pi;
theta = (Point(9).ang-pi):pi/100:Point(10).ang;
xyCourse = [xyCourse;(Point(10).x+Point(10).r*cos(theta))' (Point(10).y+Point(10).r*sin(theta))'];

% Point(10) to Point(11), CCW arc
Point(12).x = 410-(Point(10).x-410); Point(12).y = Point(10).y;   Point(12).r = 30;   
tempAng1 = atan2(Point(12).y-Point(11).y, Point(12).x-Point(11).x);
Point(12).ang = tempAng1;
theta = (Point(11).ang):-pi/100:Point(12).ang;
xyCourse = [xyCourse;(Point(11).x+Point(11).r*cos(theta))' (Point(11).y+Point(11).r*sin(theta))'];

% from Point(12) on, P.x and P.y is the center of the arc, and P.r is the
% radius, P.ang specifies the angle of the start point of the arc, if
% P.r=-1, P.x and P.y is the start point of the next straight line
% Point(12) to Point(13), CCW arc
Point(13).x = 410; Point(13).y = 430;   Point(13).r = 370;   
tempAng1 = atan2(Point(13).y-Point(12).y, Point(13).x-Point(12).x);
Point(13).ang = tempAng1;
theta = (Point(12).ang+pi):pi/100:Point(13).ang;
xyCourse = [xyCourse;(Point(12).x+Point(12).r*cos(theta))' (Point(12).y+Point(12).r*sin(theta))'];

% Point(13) to Point(14), CW arc
Point(14).x = 155; Point(14).y = 183;   Point(14).r = 15;   
tempAng1 = atan2(Point(14).y-Point(13).y, Point(14).x-Point(13).x);
Point(14).ang = tempAng1;
theta = (Point(13).ang-pi):-pi/100:Point(14).ang;
xyCourse = [xyCourse;(Point(13).x+Point(13).r*cos(theta))' (Point(13).y+Point(13).r*sin(theta))'];

% Point(14) to Point(15), CW arc
Point(15).x = 410; Point(15).y = 430;   Point(15).r = 340;   
tempAng1 = atan2(Point(15).y-Point(14).y, Point(15).x-Point(14).x);
Point(15).ang = tempAng1;
theta = (Point(14).ang):-pi/100:Point(15).ang-2*pi;
xyCourse = [xyCourse;(Point(14).x+Point(14).r*cos(theta))' (Point(14).y+Point(14).r*sin(theta))'];

% Point(15) to Point(16), CCW arc
tempAng1 = atan2(120-Point(15).y, 200-Point(15).x);
Point(16).ang = tempAng1;   Point(16).r = 30;
Point(16).x = 410+310*cos(tempAng1); 
Point(16).y = 430+310*sin(tempAng1);
theta = (Point(15).ang-pi):pi/100:Point(16).ang;
xyCourse = [xyCourse;(Point(15).x+Point(15).r*cos(theta))' (Point(15).y+Point(15).r*sin(theta))'];

% Point(16) to Point(17), CCW arc
Point(18).x = 400; Point(18).y = 170;   Point(18).r = 20; 
tempDis1 = norm([Point(18).x-Point(16).x Point(18).y-Point(16).y]);
tempDis2 = Point(18).r/(Point(16).r-Point(18).r)*tempDis1;
tempAng1 = atan2(Point(18).y-Point(16).y, Point(18).x-Point(16).x);
tempAng2 = -acos(Point(16).r/tempDis2)+tempAng1;
Point(18).ang = tempAng2;
theta = (Point(16).ang):pi/100:tempAng2;
xyCourse = [xyCourse;(Point(16).x+Point(16).r*cos(theta))' (Point(16).y+Point(16).r*sin(theta))'];
Point(17).x = Point(16).x+Point(16).r*cos(tempAng2); 
Point(17).y = Point(16).y+Point(16).r*sin(tempAng2);   Point(17).r = -1; 

% Point(17) to Point(18), Straight Line
tempPx0 = Point(17).x;
tempPy0 = Point(17).y;
tempPx1 = Point(18).x+Point(18).r*cos(Point(18).ang);
tempPy1 = Point(18).y+Point(18).r*sin(Point(18).ang);
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, 50)' linspace(tempPy0, tempPy1, 50)'];

% Point(18) to Point(19), CCW arc
Point(20).x = 370; Point(20).y = 220;   Point(20).r = 20; 
tempAng1 = atan2(Point(20).y-Point(18).y, Point(20).x-Point(18).x);
tempDis1 = norm([Point(18).x-Point(20).x Point(18).y-Point(20).y]);
A = (pi-acos((40^2+40^2-tempDis1^2)/2/40/40))/2;
Point(19).r = 20;   Point(19).ang = tempAng1-A-pi;
Point(19).x = Point(18).x+40*cos(tempAng1-A);
Point(19).y = Point(18).y+40*sin(tempAng1-A);
theta = (Point(18).ang):pi/100:tempAng1-A;
xyCourse = [xyCourse;(Point(18).x+Point(18).r*cos(theta))' (Point(18).y+Point(18).r*sin(theta))'];

% Point(19) to Point(20), CW arc
tempAng1 = atan2(Point(18).y-Point(20).y, Point(18).x-Point(20).x)+pi/4;
Point(20).ang = tempAng1;
theta = (Point(19).ang):-pi/100:tempAng1-pi;
xyCourse = [xyCourse;(Point(19).x+Point(19).r*cos(theta))' (Point(19).y+Point(19).r*sin(theta))'];

% Point(20) to Point(21), CCW arc
Point(22).x = 340; Point(22).y = 122;   Point(22).r = 15;
tempAng1 = atan2(Point(22).y-Point(20).y, Point(22).x-Point(20).x)+2*pi;
tempDis1 = norm([Point(22).x-Point(20).x Point(22).y-Point(20).y]);
tempAng2 = tempAng1 - acos((Point(22).r+Point(20).r)/tempDis1);
Point(21).x = Point(20).x+Point(20).r*cos(tempAng2); 
Point(21).y = Point(20).y+Point(20).r*sin(tempAng2);   Point(21).r = -1;
Point(22).ang = tempAng2-pi;
theta = (Point(20).ang):pi/100:tempAng2;
xyCourse = [xyCourse;(Point(20).x+Point(20).r*cos(theta))' (Point(20).y+Point(20).r*sin(theta))'];

% Point(21) to Point(22), Straight line
tempPx0 = Point(21).x;
tempPy0 = Point(21).y;
tempPx1 = Point(22).x+Point(22).r*cos(Point(22).ang);
tempPy1 = Point(22).y+Point(22).r*sin(Point(22).ang);
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, 50)' linspace(tempPy0, tempPy1, 50)'];

% Point(22) to Point(23), CW arc
Point(23).x = Point(22).x+Point(22).r*cos(Point(22).ang+pi);
Point(23).y = Point(22).y+Point(22).r*sin(Point(22).ang+pi);   Point(23).r = -1;
theta = (Point(22).ang):-pi/100:Point(22).ang-pi;
xyCourse = [xyCourse;(Point(22).x+Point(22).r*cos(theta))' (Point(22).y+Point(22).r*sin(theta))'];

% Point(23) to Point(24), Straight line
Point(24).x = 310; Point(24).y = 230; Point(24).r = 10; Point(24).ang = Point(22).ang;
tempPx0 = Point(23).x;
tempPy0 = Point(23).y;
tempPx1 = Point(24).x+Point(24).r*cos(Point(24).ang);
tempPy1 = Point(24).y+Point(24).r*sin(Point(24).ang);
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, 50)' linspace(tempPy0, tempPy1, 50)'];

% Point(24) to Point(25), CCW arc
Point(25).x = 310; Point(25).y = 230-35; Point(25).r = 45; Point(25).ang = pi/2;
theta = (Point(24).ang):pi/100:Point(25).ang;
xyCourse = [xyCourse;(Point(24).x+Point(24).r*cos(theta))' (Point(24).y+Point(24).r*sin(theta))'];

% Point(25) to Point(26), CCW arc
rsinAng = (Point(25).x-250)/4;
tempAng1 = asin(rsinAng/Point(25).r);
Point(26).x = Point(25).x + 2*Point(25).r*cos(tempAng1+pi/2); 
Point(26).y = Point(25).y + 2*Point(25).r*sin(tempAng1+pi/2); 
Point(26).r = 45; Point(26).ang = tempAng1+pi/2-pi;
theta = (Point(25).ang):pi/100:tempAng1+pi/2;
xyCourse = [xyCourse;(Point(25).x+Point(25).r*cos(theta))' (Point(25).y+Point(25).r*sin(theta))'];

% Point(26) to Point(27), CW arc
rsinAng = (Point(25).x-250)/4;
tempAng1 = asin(rsinAng/Point(25).r);
Point(27).ang = Point(26).ang - 2*tempAng1 + pi;
Point(27).x = Point(26).x + 2*Point(26).r*cos(Point(27).ang-pi); 
Point(27).y = Point(26).y + 2*Point(26).r*sin(Point(27).ang-pi); 
Point(27).r = 45; 
theta = (Point(26).ang):-pi/100:Point(27).ang-pi;
xyCourse = [xyCourse;(Point(26).x+Point(26).r*cos(theta))' (Point(26).y+Point(26).r*sin(theta))'];

% Point(27) to Point(28), CCW arc
Point(28).ang = -pi/2; Point(28).r = 45;
Point(28).x = Point(27).x; 
Point(28).y = Point(27).y + 2*Point(27).r; 
theta = (Point(27).ang):pi/200:Point(28).ang+pi;
xyCourse = [xyCourse;(Point(27).x+Point(27).r*cos(theta))' (Point(27).y+Point(27).r*sin(theta))'];

% Point(28) to Point(29), CW arc
rsinAng = (Point(28).x-190)/4;
tempAng1 = asin(rsinAng/Point(28).r);
Point(29).x = Point(28).x + 2*Point(28).r*cos(-tempAng1-pi/2); 
Point(29).y = Point(28).y + 2*Point(28).r*sin(-tempAng1-pi/2); 
Point(29).r = 45; Point(29).ang = -tempAng1-pi/2+pi;
theta = (Point(28).ang):-pi/200:(-tempAng1-pi/2);
xyCourse = [xyCourse;(Point(28).x+Point(28).r*cos(theta))' (Point(28).y+Point(28).r*sin(theta))'];

% plot the reference circles
f = figure(1);
set(f, 'Position',[0 400 1260 540]);
theta = 0:pi/100:2*pi;
plot(Point(2).x+Point(2).r*cos(theta), Point(2).y+Point(2).r*sin(theta), 'r'); hold;
plot(Point(4).x+Point(4).r*cos(theta), Point(4).y+Point(4).r*sin(theta), 'r'); 
plot(Point(5).x+Point(5).r*cos(theta), Point(5).y+Point(5).r*sin(theta), 'r'); 
plot(Point(8).x+Point(8).r*cos(theta), Point(8).y+Point(8).r*sin(theta), 'r'); 
plot(Point(10).x+Point(10).r*cos(theta), Point(10).y+Point(10).r*sin(theta), 'r'); 
plot(Point(11).x+Point(11).r*cos(theta), Point(11).y+Point(11).r*sin(theta), 'r'); 
plot(Point(12).x+Point(12).r*cos(theta), Point(12).y+Point(12).r*sin(theta), 'r'); 
plot(Point(14).x+Point(14).r*cos(theta), Point(14).y+Point(14).r*sin(theta), 'r'); 
plot(Point(16).x+Point(16).r*cos(theta), Point(16).y+Point(16).r*sin(theta), 'r'); 
plot(Point(18).x+Point(18).r*cos(theta), Point(18).y+Point(18).r*sin(theta), 'r'); 
plot(Point(19).x+Point(19).r*cos(theta), Point(19).y+Point(19).r*sin(theta), 'r'); 
plot(Point(20).x+Point(20).r*cos(theta), Point(20).y+Point(20).r*sin(theta), 'r'); 
plot(Point(22).x+Point(22).r*cos(theta), Point(22).y+Point(22).r*sin(theta), 'r');
plot(Point(24).x+Point(24).r*cos(theta), Point(24).y+Point(24).r*sin(theta), 'r');

plot([310 310 70 70 310], [230 250 250 230 230], 'b--');
plot([250 250], [230 250], 'b');
plot([190 190], [230 250], 'b');
plot([130 130], [230 250], 'b');

% Plot board boundaries
plot([0 630 630 0 0], [0 0 135 135 0], 'b', 'LineWidth',2);
plot([0 0 450 450], [0 270 270 0], 'b', 'LineWidth',2);
plot([90 90], [0 270], 'b', 'LineWidth',2);
plot([180 180], [0 270], 'b', 'LineWidth',2);
plot([270 270], [0 270], 'b', 'LineWidth',2);
plot([360 360], [0 270], 'b', 'LineWidth',2);
plot([540 540], [0 135], 'b', 'LineWidth',2);

% plot the course
plot(xyCourse(:,1), xyCourse(:,2),'k', 'LineWidth',3);hold;
axis([-10 640 -10 280]); grid;
set(gca,'DataAspectRatio',[1 1 1]);