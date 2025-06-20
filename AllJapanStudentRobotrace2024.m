% Data structure
% struct xy, radius, angle: if radius=-1, straight line, otherwise circular
% arc, angle specifies where the point is
% unit: cm, resolution: 1cm
clear;

% Start.x = 40;	Start.y  = 110; Start.r = -1;   Start.ang = 0;
% End.x = 40;   End.y = 210;  End.r = -1; End.ang = 0;

% Start to Point(2), Straight Line
Point(1).x = 40; Point(1).y = 110;   Point(1).r = -1;    
Point(2).x = 60; Point(2).y = 50;   Point(2).r = 20;    
Point(2).ang0 = -pi; Point(2).ang1 = -pi/2;
tempPx0 = Point(1).x;
tempPy0 = Point(1).y;
tempPx1 = Point(2).x+Point(2).r*cos(Point(2).ang0);
tempPy1 = Point(2).y+Point(2).r*sin(Point(2).ang0);
% resolution is 1cm
tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
%Find the length in cm   
xyCourse = [linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
%Delete last row, the point will be recovered at the next plot 
xyCourse(end,:) = [];	

% Point(2) to Point(3), CCW arc
% resolution is 1cm, total points in theta with radius r would be r*theta,
% and dAngle would be theta/tpoints = theta/ceil(r*theta)
tPoints = ceil(Point(2).r*(Point(2).ang1-Point(2).ang0));
dAngle = (Point(2).ang1-Point(2).ang0)/(tPoints-1); 
angle = (Point(2).ang0):dAngle:Point(2).ang1;
xyCourse = [xyCourse;(Point(2).x+Point(2).r*cos(angle))' (Point(2).y+Point(2).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(3) to Point(4), Straight Line
Point(3).x = Point(2).x+Point(2).r*cos(Point(2).ang1);
Point(3).y = Point(2).y+Point(2).r*sin(Point(2).ang1);
Point(3).r = -1;
Point(4).x = 208; Point(4).y = 45;   Point(4).r = 15;    Point(4).ang0 = Point(2).ang1;
tempPx0 = Point(3).x;
tempPy0 = Point(3).y;
tempPx1 = Point(4).x+Point(4).r*cos(Point(4).ang0);
tempPy1 = Point(4).y+Point(4).r*sin(Point(4).ang0);
% resolution is 1cm
tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
xyCourse(end,:) = [];	

% Point(4) to Point(5), CCW arc
Point(6).x = 150; Point(6).y = 113;   Point(6).r = 10;  
tempAng1 = atan2(Point(6).y-Point(4).y, Point(6).x-Point(4).x);
tempAng2 = asin((Point(6).r+Point(4).r)/norm([Point(6).x-Point(4).x Point(6).y-Point(4).y]));
tempAng = tempAng1+tempAng2-pi/2;
Point(4).ang1 = tempAng;
tPoints = ceil(Point(4).r*(Point(4).ang1-Point(4).ang0));
dAngle = (Point(4).ang1-Point(4).ang0)/(tPoints-1); 
angle = (Point(4).ang0):dAngle:Point(4).ang1;
xyCourse = [xyCourse;(Point(4).x+Point(4).r*cos(angle))' (Point(4).y+Point(4).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(5) to Point(6), Straight Line
Point(5).x = Point(4).x+Point(4).r*cos(Point(4).ang1);
Point(5).y = Point(4).y+Point(4).r*sin(Point(4).ang1);
Point(5).r = -1;
Point(6).ang0 = Point(4).ang1-pi;
tempPx0 = Point(5).x;
tempPy0 = Point(5).y;
tempPx1 = Point(6).x+Point(6).r*cos(Point(6).ang0);
tempPy1 = Point(6).y+Point(6).r*sin(Point(6).ang0);
% resolution is 1cm
tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
xyCourse(end,:) = [];	

% Point(6) to Point(7), CW arc
Point(7).x = 410; Point(7).y = 430;   Point(7).r = 400; 
tempAng1 = atan2(Point(7).y-Point(6).y, Point(7).x-Point(6).x);
Point(6).ang1 = tempAng1-2*pi;
Point(7).ang0 = tempAng1-pi;
tPoints = ceil(Point(6).r*(Point(6).ang0-Point(6).ang1));
dAngle = (Point(6).ang1-Point(6).ang0)/(tPoints-1); 
angle = (Point(6).ang0):dAngle:Point(6).ang1;
xyCourse = [xyCourse;(Point(6).x+Point(6).r*cos(angle))' (Point(6).y+Point(6).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(7) to Point(8), CCW arc, 
Point(8).x = 585; Point(8).y = 87;   Point(8).r = 15;    
tempAng1 = atan2(Point(8).y-Point(7).y, Point(8).x-Point(7).x);
Point(7).ang1 = tempAng1;
Point(8).ang0 = tempAng1;
Point(8).ang1 = tempAng1+pi;
tPoints = ceil(Point(7).r*(Point(7).ang1-Point(7).ang0));
dAngle = (Point(7).ang1-Point(7).ang0)/(tPoints-1); 
angle = (Point(7).ang0):dAngle:Point(7).ang1;
xyCourse = [xyCourse;(Point(7).x+Point(7).r*cos(angle))' (Point(7).y+Point(7).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(8) to Point(9), CCW arc
tPoints = ceil(Point(8).r*(Point(8).ang1-Point(8).ang0));
dAngle = (Point(8).ang1-Point(8).ang0)/(tPoints-1); 
angle = (Point(8).ang0):dAngle:Point(8).ang1;
xyCourse = [xyCourse;(Point(8).x+Point(8).r*cos(angle))' (Point(8).y+Point(8).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(9) to Point(10), CW arc
Point(9).x  = 410; Point(9).y  = 430;  Point(9).r  = 370;   
Point(9).ang0 = Point(8).ang1-pi;
A = acos((400^2+360^2-45^2)/2/400/360);
tempX = 410+400*sin(A); tempY = 430-400*cos(A);
Point(10).x = tempX; Point(10).y = tempY;   
Point(10).r = 30;   
tempAng1 = atan2(Point(9).y-tempY, Point(9).x-tempX);
Point(10).ang0 = tempAng1;
Point(9).ang1 = tempAng1-pi;
tPoints = ceil(Point(9).r*(Point(9).ang0-Point(9).ang1));
dAngle = (Point(9).ang1-Point(9).ang0)/(tPoints-1); 
angle = (Point(9).ang0):dAngle:Point(9).ang1;
xyCourse = [xyCourse;(Point(9).x+Point(9).r*cos(angle))' (Point(9).y+Point(9).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(10) to Point(11), CCW arc
Point(11).x = 410; Point(11).y = 70;   Point(11).r = 15;  
tempAng1 = atan2(Point(11).y-Point(10).y, Point(11).x-Point(10).x);
Point(10).ang1 = tempAng1;
Point(11).ang0 = tempAng1-pi;
tPoints = ceil(Point(10).r*(Point(10).ang1-Point(10).ang0));
dAngle = (Point(10).ang1-Point(10).ang0)/(tPoints-1); 
angle = (Point(10).ang0):dAngle:Point(10).ang1;
xyCourse = [xyCourse;(Point(10).x+Point(10).r*cos(angle))' (Point(10).y+Point(10).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(11) to Point(12), CW arc
Point(12).x = 410-(Point(10).x-410); Point(12).y = Point(10).y;   Point(12).r = 30;   
tempAng1 = atan2(Point(12).y-Point(11).y, Point(12).x-Point(11).x);
Point(11).ang1 = tempAng1;
Point(12).ang0 = tempAng1+pi;
tPoints = ceil(Point(11).r*(Point(11).ang0-Point(11).ang1));
dAngle = (Point(11).ang1-Point(11).ang0)/(tPoints-1); 
angle = (Point(11).ang0):dAngle:Point(11).ang1;
xyCourse = [xyCourse;(Point(11).x+Point(11).r*cos(angle))' (Point(11).y+Point(11).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(12) to Point(13), CCW arc
Point(13).x = 410; Point(13).y = 430;   Point(13).r = 370;   
tempAng1 = atan2(Point(13).y-Point(12).y, Point(13).x-Point(12).x);
Point(12).ang1 = tempAng1;
Point(13).ang0 = tempAng1-pi;
tPoints = ceil(Point(12).r*(Point(12).ang1-Point(12).ang0));
dAngle = (Point(12).ang1-Point(12).ang0)/(tPoints-1); 
angle = (Point(12).ang0):dAngle:Point(12).ang1;
xyCourse = [xyCourse;(Point(12).x+Point(12).r*cos(angle))' (Point(12).y+Point(12).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(13) to Point(14), CW arc
Point(14).x = 155; Point(14).y = 183;   Point(14).r = 15;   
tempAng1 = atan2(Point(14).y-Point(13).y, Point(14).x-Point(13).x);
Point(13).ang1 = tempAng1;
Point(14).ang0 = tempAng1;
tPoints = ceil(Point(13).r*(Point(13).ang0-Point(13).ang1));
dAngle = (Point(13).ang1-Point(13).ang0)/(tPoints-1); 
angle = (Point(13).ang0):dAngle:Point(13).ang1;
xyCourse = [xyCourse;(Point(13).x+Point(13).r*cos(angle))' (Point(13).y+Point(13).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(14) to Point(15), CW arc
Point(15).x = 410; Point(15).y = 430;   Point(15).r = 340;   
tempAng1 = atan2(Point(15).y-Point(14).y, Point(15).x-Point(14).x);
Point(14).ang1 = tempAng1-2*pi;
Point(15).ang0 = tempAng1-pi;
tPoints = ceil(Point(14).r*(Point(14).ang0-Point(14).ang1));
dAngle = (Point(14).ang1-Point(14).ang0)/(tPoints-1); 
angle = (Point(14).ang0):dAngle:Point(14).ang1;
xyCourse = [xyCourse;(Point(14).x+Point(14).r*cos(angle))' (Point(14).y+Point(14).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(15) to Point(16), CCW arc
tempAng1 = atan2(120-Point(15).y, 200-Point(15).x);
Point(16).ang0 = tempAng1;   Point(16).r = 30;
Point(15).ang1 = tempAng1;
Point(16).x = 410+310*cos(tempAng1); 
Point(16).y = 430+310*sin(tempAng1);
tPoints = ceil(Point(15).r*(Point(15).ang1-Point(15).ang0));
dAngle = (Point(15).ang1-Point(15).ang0)/(tPoints-1); 
angle = (Point(15).ang0):dAngle:Point(15).ang1;
xyCourse = [xyCourse;(Point(15).x+Point(15).r*cos(angle))' (Point(15).y+Point(15).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(16) to Point(17), CCW arc
Point(18).x = 400; Point(18).y = 170;   Point(18).r = 20; 
tempDis1 = norm([Point(18).x-Point(16).x Point(18).y-Point(16).y]);
tempAng1 = atan2(Point(18).y-Point(16).y, Point(18).x-Point(16).x);
tempAng2 = -acos((Point(16).r-Point(18).r)/tempDis1)+tempAng1;
Point(18).ang0 = tempAng2;
Point(16).ang1 = tempAng2;
tPoints = ceil(Point(16).r*(Point(16).ang1-Point(16).ang0));
dAngle = (Point(16).ang1-Point(16).ang0)/(tPoints-1); 
angle = (Point(16).ang0):dAngle:Point(16).ang1;
xyCourse = [xyCourse;(Point(16).x+Point(16).r*cos(angle))' (Point(16).y+Point(16).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(17) to Point(18), Straight Line
Point(17).x = Point(16).x+Point(16).r*cos(Point(16).ang1); 
Point(17).y = Point(16).y+Point(16).r*sin(Point(16).ang1);   Point(17).r = -1; 
tempPx0 = Point(17).x;
tempPy0 = Point(17).y;
tempPx1 = Point(18).x+Point(18).r*cos(Point(18).ang0);
tempPy1 = Point(18).y+Point(18).r*sin(Point(18).ang0);
% resolution is 1cm
tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
xyCourse(end,:) = [];	

% Point(18) to Point(19), CCW arc
Point(20).x = 370; Point(20).y = 220;   Point(20).r = 20; 
tempAng1 = atan2(Point(20).y-Point(18).y, Point(20).x-Point(18).x);
tempDis1 = norm([Point(18).x-Point(20).x Point(18).y-Point(20).y]);
A = (pi-acos((40^2+40^2-tempDis1^2)/2/40/40))/2;
Point(19).r = 20;   Point(19).ang0 = tempAng1-A-pi;
Point(18).ang1 = Point(19).ang0+pi;
Point(19).x = Point(18).x+40*cos(Point(18).ang1);
Point(19).y = Point(18).y+40*sin(Point(18).ang1);
tPoints = ceil(Point(18).r*(Point(18).ang1-Point(18).ang0));
dAngle = (Point(18).ang1-Point(18).ang0)/(tPoints-1); 
angle = (Point(18).ang0):dAngle:Point(18).ang1;
xyCourse = [xyCourse;(Point(18).x+Point(18).r*cos(angle))' (Point(18).y+Point(18).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(19) to Point(20), CW arc
tempAng1 = atan2(Point(18).y-Point(20).y, Point(18).x-Point(20).x)+pi/4;
Point(20).ang0 = tempAng1;
Point(19).ang1 = tempAng1-pi;
tPoints = ceil(Point(19).r*(Point(19).ang0-Point(19).ang1));
dAngle = (Point(19).ang1-Point(19).ang0)/(tPoints-1); 
angle = (Point(19).ang0):dAngle:Point(19).ang1;
xyCourse = [xyCourse;(Point(19).x+Point(19).r*cos(angle))' (Point(19).y+Point(19).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(20) to Point(21), CCW arc
Point(22).x = 340; Point(22).y = 122;   Point(22).r = 15;
tempAng1 = atan2(Point(22).y-Point(20).y, Point(22).x-Point(20).x)+2*pi;
tempDis1 = norm([Point(22).x-Point(20).x Point(22).y-Point(20).y]);
tempAng2 = tempAng1 - acos((Point(22).r+Point(20).r)/tempDis1);
Point(20).ang1 = tempAng2;
Point(21).x = Point(20).x+Point(20).r*cos(Point(20).ang1); 
Point(21).y = Point(20).y+Point(20).r*sin(Point(20).ang1);   Point(21).r = -1;
Point(22).ang0 = tempAng2-pi;
tPoints = ceil(Point(20).r*(Point(20).ang1-Point(20).ang0));
dAngle = (Point(20).ang1-Point(20).ang0)/(tPoints-1); 
angle = (Point(20).ang0):dAngle:Point(20).ang1;
xyCourse = [xyCourse;(Point(20).x+Point(20).r*cos(angle))' (Point(20).y+Point(20).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(21) to Point(22), Straight line
tempPx0 = Point(21).x;
tempPy0 = Point(21).y;
tempPx1 = Point(22).x+Point(22).r*cos(Point(22).ang0);
tempPy1 = Point(22).y+Point(22).r*sin(Point(22).ang0);
% resolution is 1cm
tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
xyCourse(end,:) = [];	

% Point(22) to Point(23), CW arc
Point(22).ang1 = Point(22).ang0-pi;
Point(23).x = Point(22).x+Point(22).r*cos(Point(22).ang1);
Point(23).y = Point(22).y+Point(22).r*sin(Point(22).ang1);   Point(23).r = -1;
tPoints = ceil(Point(22).r*(Point(22).ang0-Point(22).ang1));
dAngle = (Point(22).ang1-Point(22).ang0)/(tPoints-1); 
angle = (Point(22).ang0):dAngle:Point(22).ang1;
xyCourse = [xyCourse;(Point(22).x+Point(22).r*cos(angle))' (Point(22).y+Point(22).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(23) to Point(24), Straight line
Point(24).x = 310; Point(24).y = 230; Point(24).r = 10; Point(24).ang0 = Point(22).ang0;
tempPx0 = Point(23).x;
tempPy0 = Point(23).y;
tempPx1 = Point(24).x+Point(24).r*cos(Point(24).ang0);
tempPy1 = Point(24).y+Point(24).r*sin(Point(24).ang0);
% resolution is 1cm
tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
xyCourse(end,:) = [];	

% Point(24) to Point(25), CCW arc
Point(25).x = 310; Point(25).y = 230-35; Point(25).r = 45; 
Point(25).ang0 = pi/2; Point(24).ang1 = Point(25).ang0;
tPoints = ceil(Point(24).r*(Point(24).ang1-Point(24).ang0));
dAngle = (Point(24).ang1-Point(24).ang0)/(tPoints-1); 
angle = (Point(24).ang0):dAngle:Point(24).ang1;
xyCourse = [xyCourse;(Point(24).x+Point(24).r*cos(angle))' (Point(24).y+Point(24).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(25) to Point(26), CCW arc
rsinAng = (Point(25).x-250)/4;
tempAng1 = asin(rsinAng/Point(25).r);
Point(25).ang1 = tempAng1+pi/2;
Point(26).x = Point(25).x + 2*Point(25).r*cos(Point(25).ang1); 
Point(26).y = Point(25).y + 2*Point(25).r*sin(Point(25).ang1); 
Point(26).r = 45; Point(26).ang0 = tempAng1+pi/2-pi;
tPoints = ceil(Point(25).r*(Point(25).ang1-Point(25).ang0));
dAngle = (Point(25).ang1-Point(25).ang0)/(tPoints-1); 
angle = (Point(25).ang0):dAngle:Point(25).ang1;
xyCourse = [xyCourse;(Point(25).x+Point(25).r*cos(angle))' (Point(25).y+Point(25).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(26) to Point(27), CW arc
rsinAng = (Point(25).x-250)/4;
tempAng1 = asin(rsinAng/Point(25).r);
Point(27).ang0 = Point(26).ang0 - 2*tempAng1 + pi;
Point(26).ang1 = Point(27).ang0-pi;
Point(27).x = Point(26).x + 2*Point(26).r*cos(Point(26).ang1); 
Point(27).y = Point(26).y + 2*Point(26).r*sin(Point(26).ang1); 
Point(27).r = 45; 
tPoints = ceil(Point(26).r*(Point(26).ang0-Point(26).ang1));
dAngle = (Point(26).ang1-Point(26).ang0)/(tPoints-1); 
angle = (Point(26).ang0):dAngle:Point(26).ang1;
xyCourse = [xyCourse;(Point(26).x+Point(26).r*cos(angle))' (Point(26).y+Point(26).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(27) to Point(28), CCW arc
Point(28).ang0 = -pi/2; Point(28).r = 45;
Point(27).ang1 = pi/2;
Point(28).x = Point(27).x; 
Point(28).y = Point(27).y + 2*Point(27).r; 
tPoints = ceil(Point(27).r*(Point(27).ang1-Point(27).ang0));
dAngle = (Point(27).ang1-Point(27).ang0)/(tPoints-1); 
angle = (Point(27).ang0):dAngle:Point(27).ang1;
xyCourse = [xyCourse;(Point(27).x+Point(27).r*cos(angle))' (Point(27).y+Point(27).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(28) to Point(29), CW arc
rsinAng = (Point(28).x-190)/4;
tempAng1 = asin(rsinAng/Point(28).r);
Point(28).ang1 = -tempAng1-pi/2;
Point(29).x = Point(28).x + 2*Point(28).r*cos(Point(28).ang1); 
Point(29).y = Point(28).y + 2*Point(28).r*sin(Point(28).ang1); 
Point(29).r = 45; Point(29).ang0 = -tempAng1-pi/2+pi;
Point(29).ang1 = Point(29).ang0 + 2*tempAng1;
tPoints = ceil(Point(28).r*(Point(28).ang0-Point(28).ang1));
dAngle = (Point(28).ang1-Point(28).ang0)/(tPoints-1); 
angle = (Point(28).ang0):dAngle:Point(28).ang1;
xyCourse = [xyCourse;(Point(28).x+Point(28).r*cos(angle))' (Point(28).y+Point(28).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(29) to Point(30), CCW arc
rsinAng = (Point(28).x-190)/4;
tempAng1 = asin(rsinAng/Point(28).r);
Point(30).ang0 = Point(29).ang0 + 2*tempAng1 - pi;
Point(30).ang1 = Point(30).ang0 - tempAng1;
Point(30).x = Point(29).x + 2*Point(29).r*cos(Point(29).ang0 + 2*tempAng1); 
Point(30).y = Point(29).y + 2*Point(29).r*sin(Point(29).ang0 + 2*tempAng1); 
Point(30).r = 45; 
tPoints = ceil(Point(29).r*(Point(29).ang1-Point(29).ang0));
dAngle = (Point(29).ang1-Point(29).ang0)/(tPoints-1); 
angle = (Point(29).ang0):dAngle:Point(29).ang1;
xyCourse = [xyCourse;(Point(29).x+Point(29).r*cos(angle))' (Point(29).y+Point(29).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(30) to Point(31), CW arc
rsinAng = (Point(28).x-190)/4;
tempAng1 = asin(rsinAng/Point(28).r);
Point(31).ang0 = Point(30).ang0 - tempAng1 + pi;
Point(31).ang1 = Point(31).ang0 + tempAng1;
Point(31).x = Point(30).x + 2*Point(30).r*cos(Point(30).ang0 - tempAng1); 
Point(31).y = Point(30).y + 2*Point(30).r*sin(Point(30).ang0 - tempAng1); 
Point(31).r = 45; 
tPoints = ceil(Point(30).r*(Point(30).ang0-Point(30).ang1));
dAngle = (Point(30).ang1-Point(30).ang0)/(tPoints-1); 
angle = (Point(30).ang0):dAngle:Point(30).ang1;
xyCourse = [xyCourse;(Point(30).x+Point(30).r*cos(angle))' (Point(30).y+Point(30).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(31) to Point(32), CCW arc
tPoints = ceil(Point(31).r*(Point(31).ang1-Point(31).ang0));
dAngle = (Point(31).ang1-Point(31).ang0)/(tPoints-1); 
angle = (Point(31).ang0):dAngle:Point(31).ang1;
xyCourse = [xyCourse;(Point(31).x+Point(31).r*cos(angle))' (Point(31).y+Point(31).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(32) to Point(33), CW arc
rsinAng = (Point(31).x-130)/4;
tempAng1 = asin(rsinAng/Point(31).r);
Point(32).ang0 = Point(31).ang0 + tempAng1 - pi;
Point(32).ang1 = Point(32).ang0 - 2*tempAng1;
Point(32).x = Point(31).x + 2*Point(31).r*cos(Point(31).ang0 + tempAng1); 
Point(32).y = Point(31).y + 2*Point(31).r*sin(Point(31).ang0 + tempAng1); 
Point(32).r = 45; 
tPoints = ceil(Point(32).r*(Point(32).ang0-Point(32).ang1));
dAngle = (Point(32).ang1-Point(32).ang0)/(tPoints-1); 
angle = (Point(32).ang0):dAngle:Point(32).ang1;
xyCourse = [xyCourse;(Point(32).x+Point(32).r*cos(angle))' (Point(32).y+Point(32).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(33) to Point(34), CCW arc
rsinAng = (Point(31).x-130)/4;
tempAng1 = asin(rsinAng/Point(31).r);
Point(33).ang0 = Point(32).ang0 - 2*tempAng1 + pi;
Point(33).ang1 = Point(33).ang0 + tempAng1;
Point(33).x = Point(32).x + 2*Point(32).r*cos(Point(32).ang0 - 2*tempAng1); 
Point(33).y = Point(32).y + 2*Point(32).r*sin(Point(32).ang0 - 2*tempAng1); 
Point(33).r = 45; 
tPoints = ceil(Point(33).r*(Point(33).ang1-Point(33).ang0));
dAngle = (Point(33).ang1-Point(33).ang0)/(tPoints-1); 
angle = (Point(33).ang0):dAngle:Point(33).ang1;
xyCourse = [xyCourse;(Point(33).x+Point(33).r*cos(angle))' (Point(33).y+Point(33).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(34) to Point(35), CW arc
rsinAng = (Point(31).x-130)/4;
Point(34).r = 45; 
tempAng1 = asin(rsinAng/Point(34).r);
Point(34).ang0 = Point(33).ang1 - pi;
Point(34).ang1 = Point(34).ang0 - tempAng1;
Point(34).x = Point(33).x + 2*Point(33).r*cos(Point(33).ang0 + tempAng1); 
Point(34).y = Point(33).y + 2*Point(33).r*sin(Point(33).ang0 + tempAng1); 
tPoints = ceil(Point(34).r*(Point(34).ang0-Point(34).ang1));
dAngle = (Point(34).ang1-Point(34).ang0)/(tPoints-1); 
angle = (Point(34).ang0):dAngle:Point(34).ang1;
xyCourse = [xyCourse;(Point(34).x+Point(34).r*cos(angle))' (Point(34).y+Point(34).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(35) to Point(36), CCW arc
rsinAng = (Point(34).x-70)/4;
tempAng1 = asin(rsinAng/Point(34).r);
Point(35).ang0 = Point(34).ang1 + pi;
Point(35).ang1 = Point(35).ang0 + 2*tempAng1;
Point(35).x = Point(34).x + 2*Point(34).r*cos(Point(34).ang0 - tempAng1); 
Point(35).y = Point(34).y + 2*Point(34).r*sin(Point(34).ang0 - tempAng1); 
Point(35).r = 45; 
tPoints = ceil(Point(35).r*(Point(35).ang1-Point(35).ang0));
dAngle = (Point(35).ang1-Point(35).ang0)/(tPoints-1); 
angle = (Point(35).ang0):dAngle:Point(35).ang1;
xyCourse = [xyCourse;(Point(35).x+Point(35).r*cos(angle))' (Point(35).y+Point(35).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(36) to Point(37), CW arc
rsinAng = (Point(34).x-70)/4;
tempAng1 = asin(rsinAng/Point(34).r);
Point(36).ang0 = Point(35).ang1 - pi;
Point(36).ang1 = Point(36).ang0 - tempAng1;
Point(36).x = Point(35).x + 2*Point(35).r*cos(Point(35).ang0 + 2*tempAng1); 
Point(36).y = Point(35).y + 2*Point(35).r*sin(Point(35).ang0 + 2*tempAng1); 
Point(36).r = 45; 
tPoints = ceil(Point(36).r*(Point(36).ang0-Point(36).ang1));
dAngle = (Point(36).ang1-Point(36).ang0)/(tPoints-1); 
angle = (Point(36).ang0):dAngle:Point(36).ang1;
xyCourse = [xyCourse;(Point(36).x+Point(36).r*cos(angle))' (Point(36).y+Point(36).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(37) to Point(38), CCW arc
Point(37).x = 70; Point(37).y = 200; Point(37).r = 40;
Point(38).x = 55; Point(38).y = 220; Point(38).r = 15;
Point(37).ang0 = Point(36).ang1 + pi;
tempAng1 = atan2(Point(38).y-Point(37).y, Point(38).x-Point(37).x);
Point(37).ang1 = tempAng1;
tPoints = ceil(Point(37).r*(Point(37).ang1-Point(37).ang0));
dAngle = (Point(37).ang1-Point(37).ang0)/(tPoints-1); 
angle = (Point(37).ang0):dAngle:Point(37).ang1;
xyCourse = [xyCourse;(Point(37).x+Point(37).r*cos(angle))' (Point(37).y+Point(37).r*sin(angle))'];
xyCourse(end,:) = [];	
% Point(38) to Point(39), CCW arc
Point(38).ang0 = tempAng1;
Point(38).ang1 = pi;
tPoints = ceil(Point(38).r*(Point(38).ang1-Point(38).ang0));
dAngle = (Point(38).ang1-Point(38).ang0)/(tPoints-1); 
angle = (Point(38).ang0):dAngle:Point(38).ang1;
xyCourse = [xyCourse;(Point(38).x+Point(38).r*cos(angle))' (Point(38).y+Point(38).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(39) to Stop, Straight line
Point(39).x = Point(38).x + Point(38).r*cos(Point(38).ang1);
Point(39).y = Point(38).y + Point(38).r*sin(Point(38).ang1); 
Point(39).r = -1;
Point(40).x = 40; Point(40).y = 210; Point(40).r = -1;
tempPx0 = Point(39).x;
tempPy0 = Point(39).y;
tempPx1 = Point(40).x;
tempPy1 = Point(40).y;
% resolution is 1cm
tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
xyCourse(end,:) = [];	

% Stop to Start, Straight line
tempPx0 = Point(40).x;
tempPy0 = Point(40).y;
tempPx1 = Point(1).x;
tempPy1 = Point(1).y;
% resolution is 1cm
tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
% xyCourse(end,:) = [];	

% plot the reference circles
f = figure(1);
set(f, 'color', 'white');
set(f, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.9, 0.8]);
theta = 0:pi/100:2*pi;
plot(Point(2).x+Point(2).r*cos(theta), Point(2).y+Point(2).r*sin(theta), 'r'); hold;
plot(Point(4).x+Point(4).r*cos(theta), Point(4).y+Point(4).r*sin(theta), 'r'); 
plot(Point(6).x+Point(6).r*cos(theta), Point(6).y+Point(6).r*sin(theta), 'r'); 
plot(Point(8).x+Point(8).r*cos(theta), Point(8).y+Point(8).r*sin(theta), 'r'); 
plot(Point(10).x+Point(10).r*cos(theta), Point(10).y+Point(10).r*sin(theta), 'r'); 
plot(Point(11).x+Point(11).r*cos(theta), Point(11).y+Point(11).r*sin(theta), 'r'); 
plot(Point(11).x+3*Point(11).r*cos(theta), Point(11).y+3*Point(11).r*sin(theta), 'b--'); 
plot(Point(12).x+Point(12).r*cos(theta), Point(12).y+Point(12).r*sin(theta), 'r'); 
plot(Point(14).x+Point(14).r*cos(theta), Point(14).y+Point(14).r*sin(theta), 'r'); 
plot(Point(16).x+Point(16).r*cos(theta), Point(16).y+Point(16).r*sin(theta), 'r'); 
plot(Point(18).x+Point(18).r*cos(theta), Point(18).y+Point(18).r*sin(theta), 'r'); 
plot(Point(18).x+2*Point(18).r*cos(theta), Point(18).y+2*Point(18).r*sin(theta), 'b--'); 
plot(Point(19).x+Point(19).r*cos(theta), Point(19).y+Point(19).r*sin(theta), 'r'); 
plot(Point(20).x+Point(20).r*cos(theta), Point(20).y+Point(20).r*sin(theta), 'r'); 
plot(Point(20).x+2*Point(20).r*cos(theta), Point(20).y+2*Point(20).r*sin(theta), 'b--'); 
plot(Point(22).x+Point(22).r*cos(theta), Point(22).y+Point(22).r*sin(theta), 'r');
plot(Point(24).x+Point(24).r*cos(theta), Point(24).y+Point(24).r*sin(theta), 'r');
% plot(Point(37).x+Point(37).r*cos(theta), Point(37).y+Point(37).r*sin(theta), 'r');
% plot(Point(38).x+Point(38).r*cos(theta), Point(38).y+Point(38).r*sin(theta), 'r');

plot([310 310 70 70 310], [230 250 250 230 230], 'b--');
plot([250 250], [230 250], 'b');
plot([190 190], [230 250], 'b');
plot([130 130], [230 250], 'b');

% Start and Stop prompt
rectangle('Position',[31 109 4 2], 'FaceColor','k');
rectangle('Position',[31 209 4 2], 'FaceColor','k');
rectangle('Position',[20 100 40 120], 'EdgeColor', 'b', 'LineStyle', '--');

% Plot board boundaries
plot([0 630 630 0 0], [0 0 135 135 0], 'c', 'LineWidth',2);
plot([0 0 450 450], [0 270 270 0], 'c', 'LineWidth',2);
plot([90 90], [0 270], 'c', 'LineWidth',2);
plot([180 180], [0 270], 'c', 'LineWidth',2);
plot([270 270], [0 270], 'c', 'LineWidth',2);
plot([360 360], [0 270], 'c', 'LineWidth',2);
plot([540 540], [0 135], 'c', 'LineWidth',2);

% plot the course
plot(xyCourse(:,1), xyCourse(:,2),'k', 'LineWidth',3);hold;
axis([-10 640 -10 280]); grid;
set(gca,'DataAspectRatio',[1 1 1]);
set(gca,'FontSize',14);
title('2024 All Japan Student Robotrace contest', 'fontsize',18);
xlabel('Length in cm', 'fontsize',16);
ylabel('Length in cm', 'fontsize',16);