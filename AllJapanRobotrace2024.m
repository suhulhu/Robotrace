% Data structure
% struct xy, radius, angle: if radius=-1, straight line, otherwise circular
% arc, angle specifies where the point is
% unit: cm, resolution: 1cm

% Start to Point(2), Straight Line
Point(1).x = 520; Point(1).y = 320;   Point(1).r = -1; 
Point(2).r = 15;
theta = acos((335-315)/(2*Point(2).r));
Point(2).x = 842-30*sin(theta); Point(2).y = 335; Point(2).ang0 = -pi/2;  Point(2).ang1 = theta-pi/2;  
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

% Point(3) to Point(4), CW arc
theta = acos((335-315)/(2*Point(2).r));
Point(3).x = 842; Point(3).y = 315; Point(3).r = 15; Point(3).ang0 = theta+pi/2;  Point(3).ang1 = pi/2;  
tPoints = ceil(Point(3).r*(Point(3).ang0-Point(3).ang1));
dAngle = (Point(3).ang1-Point(3).ang0)/(tPoints-1); 
angle = (Point(3).ang0):dAngle:Point(3).ang1;
xyCourse = [xyCourse;(Point(3).x+Point(3).r*cos(angle))' (Point(3).y+Point(3).r*sin(angle))'];
xyCourse(end,:) = [];	
Point(4).x = Point(3).x + Point(3).r*cos(Point(3).ang1); 
Point(4).y = Point(3).y + Point(3).r*sin(Point(3).ang1); 
Point(4).r = -1;

% Point(4) to Point(5), Straight Line
Point(5).x = 852; Point(5).y = 320;   Point(5).r = 10; Point(5).ang0 = pi/2;
tempPx0 = Point(4).x;
tempPy0 = Point(4).y;
tempPx1 = Point(5).x+Point(5).r*cos(Point(5).ang0);
tempPy1 = Point(5).y+Point(5).r*sin(Point(5).ang0);
% resolution is 1cm
tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
%Find the length in cm   
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
%Delete last row, the point will be recovered at the next plot 
xyCourse(end,:) = [];	

% Point(5) to Point(6), CW arc
Point(6).x = 350; Point(6).y = 630;   Point(6).r = 600;
tempAng1 = atan2(Point(5).y-Point(6).y, Point(5).x-Point(6).x);
Point(5).ang1 = tempAng1;
Point(6).ang0 = tempAng1;
tPoints = ceil(Point(5).r*(Point(5).ang0-Point(5).ang1));
dAngle = (Point(5).ang1-Point(5).ang0)/(tPoints-1); 
angle = (Point(5).ang0):dAngle:Point(5).ang1;
xyCourse = [xyCourse;(Point(5).x+Point(5).r*cos(angle))' (Point(5).y+Point(5).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(6) to Point(7), CW arc
% resolution is 1cm, total points in theta with radius r would be r*theta,
% and dAngle would be theta/tpoints = theta/ceil(r*theta)
Point(7).r = 20;
Point(8).x = 780; Point(8).y = 200;   Point(8).r = 15;
tempLEN = norm([Point(8).x-Point(6).x Point(8).y-Point(6).y]);
theta = acos((tempLEN^2+(Point(7).r+Point(8).r)^2-580^2)/2/tempLEN/(Point(7).r+Point(8).r));
tempAng1 = atan2(Point(6).y-Point(8).y, Point(6).x-Point(8).x);
Point(8).ang0 = tempAng1 - theta;
Point(7).ang1 = Point(8).ang0 - pi;
Point(8).ang1 = tempAng1 + theta;
Point(7).x = Point(8).x + (Point(7).r+Point(8).r)*cos(Point(8).ang0); 
Point(7).y = Point(8).y + (Point(7).r+Point(8).r)*sin(Point(8).ang0); 
tempAng1 = atan2(Point(7).y-Point(6).y, Point(7).x-Point(6).x);
Point(7).ang0 = tempAng1;
Point(6).ang1 = tempAng1;
Point(9).ang0 = Point(8).ang1 - pi;
Point(9).x = Point(8).x + (Point(7).r+Point(8).r)*cos(Point(8).ang1); 
Point(9).y = Point(8).y + (Point(7).r+Point(8).r)*sin(Point(8).ang1); 
Point(9).r = 20;
tPoints = ceil(Point(6).r*(Point(6).ang0-Point(6).ang1));
dAngle = (Point(6).ang1-Point(6).ang0)/(tPoints-1); 
angle = (Point(6).ang0):dAngle:Point(6).ang1;
xyCourse = [xyCourse;(Point(6).x+Point(6).r*cos(angle))' (Point(6).y+Point(6).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(7) to Point(8), CW arc
tPoints = ceil(Point(7).r*(Point(7).ang0-Point(7).ang1));
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
tempAng1 = atan2(Point(9).y-Point(6).y, Point(9).x-Point(6).x);
Point(9).ang1 = tempAng1;
Point(10).ang0= tempAng1;
tPoints = ceil(Point(9).r*(Point(9).ang0-Point(9).ang1));
dAngle = (Point(9).ang1-Point(9).ang0)/(tPoints-1); 
angle = (Point(9).ang0):dAngle:Point(9).ang1;
xyCourse = [xyCourse;(Point(9).x+Point(9).r*cos(angle))' (Point(9).y+Point(9).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(10) to Point(11), CCW arc
Point(11).r = 20;
Point(12).x = 590; Point(12).y = 70;   Point(12).r = 15;
tempLEN = norm([Point(12).x-Point(6).x Point(12).y-Point(6).y]);
theta = acos((tempLEN^2+(Point(11).r+Point(12).r)^2-580^2)/2/tempLEN/(Point(11).r+Point(12).r));
tempAng1 = atan2(Point(6).y-Point(12).y, Point(6).x-Point(12).x);
Point(12).ang0 = tempAng1 - theta;
Point(11).ang1 = Point(12).ang0 - pi;
Point(12).ang1 = tempAng1 + theta;
Point(11).x = Point(12).x + (Point(11).r+Point(12).r)*cos(Point(12).ang0); 
Point(11).y = Point(12).y + (Point(11).r+Point(12).r)*sin(Point(12).ang0); 
tempAng1 = atan2(Point(11).y-Point(6).y, Point(11).x-Point(6).x);
Point(11).ang0 = tempAng1;
Point(10).ang1 = tempAng1;
Point(13).ang0 = Point(12).ang1 - pi;
Point(13).x = Point(12).x + (Point(11).r+Point(12).r)*cos(Point(12).ang1); 
Point(13).y = Point(12).y + (Point(11).r+Point(12).r)*sin(Point(12).ang1); 
Point(13).r = 20;
Point(10).x = Point(6).x;
Point(10).y = Point(6).y;
Point(10).r = Point(6).r;
tPoints = ceil(Point(10).r*(Point(10).ang0-Point(10).ang1));
dAngle = (Point(10).ang1-Point(10).ang0)/(tPoints-1); 
angle = (Point(10).ang0):dAngle:Point(10).ang1;
xyCourse = [xyCourse;(Point(10).x+Point(10).r*cos(angle))' (Point(10).y+Point(10).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(11) to Point(12), CW arc
tPoints = ceil(Point(11).r*(Point(11).ang0-Point(11).ang1));
dAngle = (Point(11).ang1-Point(11).ang0)/(tPoints-1); 
angle = (Point(11).ang0):dAngle:Point(11).ang1;
xyCourse = [xyCourse;(Point(11).x+Point(11).r*cos(angle))' (Point(11).y+Point(11).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(12) to Point(13), CCW arc
tPoints = ceil(Point(12).r*(Point(12).ang1-Point(12).ang0));
dAngle = (Point(12).ang1-Point(12).ang0)/(tPoints-1); 
angle = (Point(12).ang0):dAngle:Point(12).ang1;
xyCourse = [xyCourse;(Point(12).x+Point(12).r*cos(angle))' (Point(12).y+Point(12).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(13) to Point(14), CW arc
tempAng1 = atan2(Point(13).y-Point(10).y, Point(13).x-Point(10).x);
Point(13).ang1 = tempAng1;
Point(14).ang0 = tempAng1;
tPoints = ceil(Point(13).r*(Point(13).ang0-Point(13).ang1));
dAngle = (Point(13).ang1-Point(13).ang0)/(tPoints-1); 
angle = (Point(13).ang0):dAngle:Point(13).ang1;
xyCourse = [xyCourse;(Point(13).x+Point(13).r*cos(angle))' (Point(13).y+Point(13).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(14) to Point(15), CW arc
theta = acos((630^2+630^2-30^2)/2/630/630);
Point(14).x = Point(10).x; 
Point(14).y = Point(10).y; 
Point(14).r = 600;
Point(15).x = Point(10).x + 630*cos(-pi/2-theta); 
Point(15).y = Point(10).y + 630*sin(-pi/2-theta); 
Point(15).r = 30;
tempAng1 = atan2(Point(10).y-Point(15).y, Point(10).x-Point(15).x);
Point(14).ang1 = tempAng1-pi;
Point(15).ang0 = tempAng1;
tPoints = ceil(Point(14).r*(Point(14).ang0-Point(14).ang1));
dAngle = (Point(14).ang1-Point(14).ang0)/(tPoints-1); 
angle = (Point(14).ang0):dAngle:Point(14).ang1;
xyCourse = [xyCourse;(Point(14).x+Point(14).r*cos(angle))' (Point(14).y+Point(14).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(15) to Point(16), CCW arc
Point(17).x = 260; Point(17).y = 10; Point(17).r = 30;
tempLEN = norm([Point(17).x-Point(15).x Point(17).y-Point(15).y]);
theta = acos((60^2+tempLEN^2-60^2)/2/60/tempLEN);
tempAng1 = atan2(Point(17).y-Point(15).y, Point(17).x-Point(15).x);
Point(15).ang1 = tempAng1-theta;
Point(16).x = Point(15).x + 60*cos(Point(15).ang1); 
Point(16).y = Point(15).y + 60*sin(Point(15).ang1); 
Point(16).r = 30;
Point(16).ang0 = Point(15).ang1-pi;
tempAng1 = atan2(Point(17).y-Point(16).y, Point(17).x-Point(16).x);
Point(16).ang1 = tempAng1;
Point(17).ang0 = tempAng1+pi;
tPoints = ceil(Point(15).r*(Point(15).ang1-Point(15).ang0));
dAngle = (Point(15).ang1-Point(15).ang0)/(tPoints-1); 
angle = (Point(15).ang0):dAngle:Point(15).ang1;
xyCourse = [xyCourse;(Point(15).x+Point(15).r*cos(angle))' (Point(15).y+Point(15).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(16) to Point(17), CW arc
tPoints = ceil(Point(16).r*(Point(16).ang0-Point(16).ang1));
dAngle = (Point(16).ang1-Point(16).ang0)/(tPoints-1); 
angle = (Point(16).ang0):dAngle:Point(16).ang1;
xyCourse = [xyCourse;(Point(16).x+Point(16).r*cos(angle))' (Point(16).y+Point(16).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(17) to Point(18), CCW arc
Point(19).x = 210; Point(19).y = 18; Point(19).r = 30;
tempLEN = norm([Point(19).x-Point(17).x Point(19).y-Point(17).y]);
theta = acos((60^2+tempLEN^2-60^2)/2/60/tempLEN);
tempAng1 = atan2(Point(19).y-Point(17).y, Point(19).x-Point(17).x);
Point(17).ang1 = tempAng1-theta;
Point(18).x = Point(17).x + 60*cos(Point(17).ang1); 
Point(18).y = Point(17).y + 60*sin(Point(17).ang1); 
Point(18).r = 30;
Point(18).ang0 = Point(17).ang1-pi;
tempAng1 = atan2(Point(19).y-Point(18).y, Point(19).x-Point(18).x);
Point(18).ang1 = tempAng1;
Point(19).ang0 = tempAng1+pi;
tPoints = ceil(Point(17).r*(Point(17).ang1-Point(17).ang0));
dAngle = (Point(17).ang1-Point(17).ang0)/(tPoints-1); 
angle = (Point(17).ang0):dAngle:Point(17).ang1;
xyCourse = [xyCourse;(Point(17).x+Point(17).r*cos(angle))' (Point(17).y+Point(17).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(18) to Point(19), CW arc
tPoints = ceil(Point(18).r*(Point(18).ang0-Point(18).ang1));
dAngle = (Point(18).ang1-Point(18).ang0)/(tPoints-1); 
angle = (Point(18).ang0):dAngle:Point(18).ang1;
xyCourse = [xyCourse;(Point(18).x+Point(18).r*cos(angle))' (Point(18).y+Point(18).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(19) to Point(20), CCW arc
Point(21).x = 160; Point(21).y = 32; Point(21).r = 30;
tempLEN = norm([Point(21).x-Point(19).x Point(21).y-Point(19).y]);
theta = acos((60^2+tempLEN^2-60^2)/2/60/tempLEN);
tempAng1 = atan2(Point(21).y-Point(19).y, Point(21).x-Point(19).x);
Point(19).ang1 = tempAng1-theta;
Point(20).x = Point(19).x + 60*cos(Point(19).ang1); 
Point(20).y = Point(19).y + 60*sin(Point(19).ang1); 
Point(20).r = 30;
Point(20).ang0 = Point(19).ang1-pi;
tempAng1 = atan2(Point(21).y-Point(20).y, Point(21).x-Point(20).x);
Point(20).ang1 = tempAng1;
Point(21).ang0 = tempAng1+pi;
tPoints = ceil(Point(19).r*(Point(19).ang1-Point(19).ang0));
dAngle = (Point(19).ang1-Point(19).ang0)/(tPoints-1); 
angle = (Point(19).ang0):dAngle:Point(19).ang1;
xyCourse = [xyCourse;(Point(19).x+Point(19).r*cos(angle))' (Point(19).y+Point(19).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(20) to Point(21), CW arc
tPoints = ceil(Point(20).r*(Point(20).ang0-Point(20).ang1));
dAngle = (Point(20).ang1-Point(20).ang0)/(tPoints-1); 
angle = (Point(20).ang0):dAngle:Point(20).ang1;
xyCourse = [xyCourse;(Point(20).x+Point(20).r*cos(angle))' (Point(20).y+Point(20).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(21) to Point(22), CCW arc
tempAng1 = atan2(0-Point(10).y, 90-Point(10).x);
Point(23).x = Point(10).x + 630*cos(tempAng1); 
Point(23).y = Point(10).y + 630*sin(tempAng1); 
Point(23).r = 30;
Point(23).ang1 = tempAng1+pi;
tempLEN = norm([Point(23).x-Point(21).x Point(23).y-Point(21).y]);
theta = acos((60^2+tempLEN^2-60^2)/2/60/tempLEN);
tempAng1 = atan2(Point(23).y-Point(21).y, Point(23).x-Point(21).x);
Point(21).ang1 = tempAng1-theta;
Point(22).x = Point(21).x + 60*cos(Point(21).ang1); 
Point(22).y = Point(21).y + 60*sin(Point(21).ang1); 
Point(22).r = 30;
Point(22).ang0 = Point(21).ang1-pi;
tempAng1 = atan2(Point(23).y-Point(22).y, Point(23).x-Point(22).x);
Point(22).ang1 = tempAng1;
Point(23).ang0 = tempAng1+pi;
tPoints = ceil(Point(21).r*(Point(21).ang1-Point(21).ang0));
dAngle = (Point(21).ang1-Point(21).ang0)/(tPoints-1); 
angle = (Point(21).ang0):dAngle:Point(21).ang1;
xyCourse = [xyCourse;(Point(21).x+Point(21).r*cos(angle))' (Point(21).y+Point(21).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(22) to Point(23), CW arc
tPoints = ceil(Point(22).r*(Point(22).ang0-Point(22).ang1));
dAngle = (Point(22).ang1-Point(22).ang0)/(tPoints-1); 
angle = (Point(22).ang0):dAngle:Point(22).ang1;
xyCourse = [xyCourse;(Point(22).x+Point(22).r*cos(angle))' (Point(22).y+Point(22).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(23) to Point(24), CCW arc
tPoints = ceil(Point(23).r*(Point(23).ang1-Point(23).ang0));
dAngle = (Point(23).ang1-Point(23).ang0)/(tPoints-1); 
angle = (Point(23).ang0):dAngle:Point(23).ang1;
xyCourse = [xyCourse;(Point(23).x+Point(23).r*cos(angle))' (Point(23).y+Point(23).r*sin(angle))'];
xyCourse(end,:) = [];
Point(24).x = Point(10).x; 
Point(24).y = Point(10).y; 
Point(24).r = 600;
Point(24).ang0 = Point(23).ang1 - pi;

% Point(24) to Point(25), CW arc
tempAng1 = atan2(144-Point(10).y, 80-Point(10).x);
Point(25).x = Point(10).x + 550*cos(tempAng1); 
Point(25).y = Point(10).y + 550*sin(tempAng1); 
Point(25).r = 50;
Point(25).ang0 = tempAng1;
Point(24).ang1 = tempAng1;
tPoints = ceil(Point(24).r*(Point(24).ang0-Point(24).ang1));
dAngle = (Point(24).ang1-Point(24).ang0)/(tPoints-1); 
angle = (Point(24).ang0):dAngle:Point(24).ang1;
xyCourse = [xyCourse;(Point(24).x+Point(24).r*cos(angle))' (Point(24).y+Point(24).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(25) to Point(26), CW arc
Point(26).x = 63; Point(26).y = 153; Point(26).r = 30;
tempLEN = norm([Point(25).x-Point(26).x Point(25).y-Point(26).y]);
theta = acos((Point(25).r^2+tempLEN^2-Point(26).r^2)/2/Point(25).r/tempLEN);
tempAng1 = atan2(Point(26).y-Point(25).y, Point(26).x-Point(25).x);
Point(25).ang1 = tempAng1+theta-2*pi;
theta = acos((Point(25).r^2+Point(26).r^2-tempLEN^2)/2/Point(25).r/Point(26).r);
Point(26).ang0 = Point(25).ang1+theta+2*pi;
tPoints = ceil(Point(25).r*(Point(25).ang0-Point(25).ang1));
dAngle = (Point(25).ang1-Point(25).ang0)/(tPoints-1); 
angle = (Point(25).ang0):dAngle:Point(25).ang1;
xyCourse = [xyCourse;(Point(25).x+Point(25).r*cos(angle))' (Point(25).y+Point(25).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(26) to Point(27), CW arc
Point(27).x = 63; Point(27).y = 173; Point(27).r = 10;
Point(26).ang1 = pi/2;
Point(27).ang0 = Point(26).ang1;
tPoints = ceil(Point(26).r*(Point(26).ang0-Point(26).ang1));
dAngle = (Point(26).ang1-Point(26).ang0)/(tPoints-1); 
angle = (Point(26).ang0):dAngle:Point(26).ang1;
xyCourse = [xyCourse;(Point(26).x+Point(26).r*cos(angle))' (Point(26).y+Point(26).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(27) to Point(28), CW arc
Point(29).x = 80; Point(29).y = 144; Point(29).r = 10;
tempLEN = norm([Point(29).x-Point(27).x Point(29).y-Point(27).y]);
theta = acos((20^2+tempLEN^2-20^2)/2/20/tempLEN);
tempAng1 = atan2(Point(27).y-Point(29).y, Point(27).x-Point(29).x);
Point(29).ang0 = tempAng1+theta;
Point(28).ang1 = Point(29).ang0+pi;
Point(28).x = Point(29).x + 20*cos(Point(29).ang0); 
Point(28).y = Point(29).y + 20*sin(Point(29).ang0); 
Point(28).r = 10;
tempAng1 = atan2(Point(27).y-Point(28).y, Point(27).x-Point(28).x);
Point(28).ang0 = tempAng1;
%Point(28).x = 63; Point(28).y = 153; Point(28).r = 10;
Point(27).ang1 = tempAng1-pi;
tPoints = ceil(Point(27).r*(Point(27).ang0-Point(27).ang1));
dAngle = (Point(27).ang1-Point(27).ang0)/(tPoints-1); 
angle = (Point(27).ang0):dAngle:Point(27).ang1;
xyCourse = [xyCourse;(Point(27).x+Point(27).r*cos(angle))' (Point(27).y+Point(27).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(28) to Point(29), CCW arc
tempAng1 = atan2(Point(29).y-Point(28).y, Point(29).x-Point(28).x);
tPoints = ceil(Point(28).r*(Point(28).ang1-Point(28).ang0));
dAngle = (Point(28).ang1-Point(28).ang0)/(tPoints-1); 
angle = (Point(28).ang0):dAngle:Point(28).ang1;
xyCourse = [xyCourse;(Point(28).x+Point(28).r*cos(angle))' (Point(28).y+Point(28).r*sin(angle))'];
xyCourse(end,:) = [];

% Point(29) to Point(30), CW arc
Point(31).x = 102; Point(31).y = 116; Point(31).r = 10;
tempLEN = norm([Point(29).x-Point(31).x Point(29).y-Point(31).y]);
theta = acos((20^2+tempLEN^2-20^2)/2/20/tempLEN);
tempAng1 = atan2(Point(29).y-Point(31).y, Point(29).x-Point(31).x);
Point(31).ang0 = tempAng1+theta;
Point(30).ang1 = Point(31).ang0+pi;
Point(30).x = Point(31).x + 20*cos(Point(31).ang0); 
Point(30).y = Point(31).y + 20*sin(Point(31).ang0); 
Point(30).r = 10;
tempAng1 = atan2(Point(29).y-Point(30).y, Point(29).x-Point(30).x);
Point(30).ang0 = tempAng1;
Point(29).ang1 = tempAng1-pi;
tPoints = ceil(Point(29).r*(Point(29).ang0-Point(29).ang1));
dAngle = (Point(29).ang1-Point(29).ang0)/(tPoints-1); 
angle = (Point(29).ang0):dAngle:Point(29).ang1;
xyCourse = [xyCourse;(Point(29).x+Point(29).r*cos(angle))' (Point(29).y+Point(29).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(30) to Point(31), CCW arc
tPoints = ceil(Point(30).r*(Point(30).ang1-Point(30).ang0));
dAngle = (Point(30).ang1-Point(30).ang0)/(tPoints-1); 
angle = (Point(30).ang0):dAngle:Point(30).ang1;
xyCourse = [xyCourse;(Point(30).x+Point(30).r*cos(angle))' (Point(30).y+Point(30).r*sin(angle))'];
xyCourse(end,:) = [];

% Point(31) to Point(32), CW arc
Point(31).ang1 = pi/2;
tPoints = ceil(Point(31).r*(Point(31).ang0-Point(31).ang1));
dAngle = (Point(31).ang1-Point(31).ang0)/(tPoints-1); 
angle = (Point(31).ang0):dAngle:Point(31).ang1;
xyCourse = [xyCourse;(Point(31).x+Point(31).r*cos(angle))' (Point(31).y+Point(31).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(32) to Point(33), Straight Line
Point(32).x = Point(31).x + Point(31).r*cos(Point(31).ang1); 
Point(32).y = Point(31).y + Point(31).r*sin(Point(31).ang1); 
Point(32).r = -1;
Point(33).x = 112; Point(33).y = 136; Point(33).r = 10;
Point(33).ang0 = -pi/2;
tempPx0 = Point(32).x;
tempPy0 = Point(32).y;
tempPx1 = Point(33).x+Point(33).r*cos(Point(33).ang0);
tempPy1 = Point(33).y+Point(33).r*sin(Point(33).ang0);
% resolution is 1cm
tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
%Find the length in cm   
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
%Delete last row, the point will be recovered at the next plot 
xyCourse(end,:) = [];	

% Point(33) to Point(34), CCW arc
Point(35).x = 120; Point(35).y = 230; Point(35).r = 20;
tempLEN = norm([Point(33).x-Point(35).x Point(33).y-Point(35).y]);
theta = acos((Point(33).r+Point(35).r)/tempLEN);
tempAng1 = atan2(Point(35).y-Point(33).y, Point(35).x-Point(33).x);
Point(33).ang1 = tempAng1-theta;
Point(35).ang0 = Point(33).ang1-pi;
tPoints = ceil(Point(33).r*(Point(33).ang1-Point(33).ang0));
dAngle = (Point(33).ang1-Point(33).ang0)/(tPoints-1); 
angle = (Point(33).ang0):dAngle:Point(33).ang1;
xyCourse = [xyCourse;(Point(33).x+Point(33).r*cos(angle))' (Point(33).y+Point(33).r*sin(angle))'];
xyCourse(end,:) = [];

% Point(34) to Point(35), Straight Line
Point(34).x = Point(33).x + Point(33).r*cos(Point(33).ang1); 
Point(34).y = Point(33).y + Point(33).r*sin(Point(33).ang1); 
Point(34).r = -1;
tempPx0 = Point(34).x;
tempPy0 = Point(34).y;
tempPx1 = Point(35).x+Point(35).r*cos(Point(35).ang0);
tempPy1 = Point(35).y+Point(35).r*sin(Point(35).ang0);
% resolution is 1cm
tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
%Find the length in cm   
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
%Delete last row, the point will be recovered at the next plot 
xyCourse(end,:) = [];	

% Point(35) to Point(36), CW arc
Point(35).ang1 = -3*pi/2;
tPoints = ceil(Point(35).r*(Point(35).ang0-Point(35).ang1));
dAngle = (Point(35).ang1-Point(35).ang0)/(tPoints-1); 
angle = (Point(35).ang0):dAngle:Point(35).ang1;
xyCourse = [xyCourse;(Point(35).x+Point(35).r*cos(angle))' (Point(35).y+Point(35).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(36) to Point(37), Straight Line
Point(37).x = 400; Point(37).y = 240; Point(37).r = 10;
Point(37).ang0 = pi/2;
Point(36).x = Point(35).x + Point(35).r*cos(Point(35).ang1); 
Point(36).y = Point(35).y + Point(35).r*sin(Point(35).ang1); 
Point(36).r = -1;
tempPx0 = Point(36).x;
tempPy0 = Point(36).y;
tempPx1 = Point(37).x+Point(37).r*cos(Point(37).ang0);
tempPy1 = Point(37).y+Point(37).r*sin(Point(37).ang0);
% resolution is 1cm
tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
%Find the length in cm   
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
%Delete last row, the point will be recovered at the next plot 
xyCourse(end,:) = [];	

% Point(37) to Point(38), CW arc
Point(37).ang1 = -pi;
tPoints = ceil(Point(37).r*(Point(37).ang0-Point(37).ang1));
dAngle = (Point(37).ang1-Point(37).ang0)/(tPoints-1); 
angle = (Point(37).ang0):dAngle:Point(37).ang1;
xyCourse = [xyCourse;(Point(37).x+Point(37).r*cos(angle))' (Point(37).y+Point(37).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(38) to Point(39), Straight Line
Point(39).x = 380; Point(39).y = 260; Point(39).r = 10;
Point(39).ang0 = 0;
Point(38).x = Point(37).x + Point(37).r*cos(Point(37).ang1); 
Point(38).y = Point(37).y + Point(37).r*sin(Point(37).ang1); 
Point(38).r = -1;
tempPx0 = Point(38).x;
tempPy0 = Point(38).y;
tempPx1 = Point(39).x+Point(39).r*cos(Point(39).ang0);
tempPy1 = Point(39).y+Point(39).r*sin(Point(39).ang0);
% resolution is 1cm
tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
%Find the length in cm   
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
%Delete last row, the point will be recovered at the next plot 
xyCourse(end,:) = [];	

% Point(39) to Point(40), CCW arc
Point(39).ang1 = pi;
tPoints = ceil(Point(39).r*(Point(39).ang1-Point(39).ang0));
dAngle = (Point(39).ang1-Point(39).ang0)/(tPoints-1); 
angle = (Point(39).ang0):dAngle:Point(39).ang1;
xyCourse = [xyCourse;(Point(39).x+Point(39).r*cos(angle))' (Point(39).y+Point(39).r*sin(angle))'];
xyCourse(end,:) = [];

% Point(40) to Point(41), Straight Line
Point(41).x = 360; Point(41).y = 240; Point(41).r = 10;
Point(41).ang0 = 0;
Point(40).x = Point(39).x + Point(39).r*cos(Point(39).ang1); 
Point(40).y = Point(39).y + Point(39).r*sin(Point(39).ang1); 
Point(40).r = -1;
tempPx0 = Point(40).x;
tempPy0 = Point(40).y;
tempPx1 = Point(41).x+Point(41).r*cos(Point(41).ang0);
tempPy1 = Point(41).y+Point(41).r*sin(Point(41).ang0);
% resolution is 1cm
tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
%Find the length in cm   
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
%Delete last row, the point will be recovered at the next plot 
xyCourse(end,:) = [];	

% Point(41) to Point(42), CW arc
Point(41).ang1 = -pi;
tPoints = ceil(Point(41).r*(Point(41).ang0-Point(41).ang1));
dAngle = (Point(41).ang1-Point(41).ang0)/(tPoints-1); 
angle = (Point(41).ang0):dAngle:Point(41).ang1;
xyCourse = [xyCourse;(Point(41).x+Point(41).r*cos(angle))' (Point(41).y+Point(41).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(42) to Point(43), Straight Line
Point(43).x = 340; Point(43).y = 260; Point(43).r = 10;
Point(43).ang0 = 0;
Point(42).x = Point(41).x + Point(41).r*cos(Point(41).ang1); 
Point(42).y = Point(41).y + Point(41).r*sin(Point(41).ang1); 
Point(42).r = -1;
tempPx0 = Point(42).x;
tempPy0 = Point(42).y;
tempPx1 = Point(43).x+Point(43).r*cos(Point(43).ang0);
tempPy1 = Point(43).y+Point(43).r*sin(Point(43).ang0);
% resolution is 1cm
tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
%Find the length in cm   
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
%Delete last row, the point will be recovered at the next plot 
xyCourse(end,:) = [];	

% Point(43) to Point(44), CCW arc
Point(43).ang1 = pi;
tPoints = ceil(Point(43).r*(Point(43).ang1-Point(43).ang0));
dAngle = (Point(43).ang1-Point(43).ang0)/(tPoints-1); 
angle = (Point(43).ang0):dAngle:Point(43).ang1;
xyCourse = [xyCourse;(Point(43).x+Point(43).r*cos(angle))' (Point(43).y+Point(43).r*sin(angle))'];
xyCourse(end,:) = [];

% Point(44) to Point(45), Straight Line
Point(45).x = 300; Point(45).y = 240; Point(45).r = 30;
Point(45).ang0 = 0;
Point(44).x = Point(43).x + Point(43).r*cos(Point(43).ang1); 
Point(44).y = Point(43).y + Point(43).r*sin(Point(43).ang1); 
Point(44).r = -1;
tempPx0 = Point(44).x;
tempPy0 = Point(44).y;
tempPx1 = Point(45).x+Point(45).r*cos(Point(45).ang0);
tempPy1 = Point(45).y+Point(45).r*sin(Point(45).ang0);
% resolution is 1cm
tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
%Find the length in cm   
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
%Delete last row, the point will be recovered at the next plot 
xyCourse(end,:) = [];	

% Point(45) to Point(46), CW arc
Point(45).ang1 = -pi/2;
tPoints = ceil(Point(45).r*(Point(45).ang0-Point(45).ang1));
dAngle = (Point(45).ang1-Point(45).ang0)/(tPoints-1); 
angle = (Point(45).ang0):dAngle:Point(45).ang1;
xyCourse = [xyCourse;(Point(45).x+Point(45).r*cos(angle))' (Point(45).y+Point(45).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(46) to Point(47), CW arc
Point(46).x = 300; Point(46).y = 220; Point(46).r = 10;
Point(46).ang0 = -pi/2;
Point(46).ang1 = -3*pi/2;
tPoints = ceil(Point(46).r*(Point(46).ang0-Point(46).ang1));
dAngle = (Point(46).ang1-Point(46).ang0)/(tPoints-1); 
angle = (Point(46).ang0):dAngle:Point(46).ang1;
xyCourse = [xyCourse;(Point(46).x+Point(46).r*cos(angle))' (Point(46).y+Point(46).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(47) to Point(48), CCW arc
Point(47).x = 300; Point(47).y = 240; Point(47).r = 10;
Point(47).ang0 = -pi/2;
Point(47).ang1 = 0;
tPoints = ceil(Point(47).r*(Point(47).ang1-Point(47).ang0));
dAngle = (Point(47).ang1-Point(47).ang0)/(tPoints-1); 
angle = (Point(47).ang0):dAngle:Point(47).ang1;
xyCourse = [xyCourse;(Point(47).x+Point(47).r*cos(angle))' (Point(47).y+Point(47).r*sin(angle))'];
xyCourse(end,:) = [];

% Point(48) to Point(49), Straight Line
Point(49).x = 260; Point(49).y = 260; Point(49).r = 50;
Point(49).ang0 = 0;
Point(48).x = Point(47).x + Point(47).r*cos(Point(47).ang1); 
Point(48).y = Point(47).y + Point(47).r*sin(Point(47).ang1); 
Point(48).r = -1;
tempPx0 = Point(48).x;
tempPy0 = Point(48).y;
tempPx1 = Point(49).x+Point(49).r*cos(Point(49).ang0);
tempPy1 = Point(49).y+Point(49).r*sin(Point(49).ang0);
% resolution is 1cm
tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
%Find the length in cm   
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
%Delete last row, the point will be recovered at the next plot 
xyCourse(end,:) = [];	

% Point(49) to Point(50), CCW arc
Point(51).x = 175; Point(51).y = 315; Point(51).r = 15;
tempLEN = norm([Point(49).x-Point(51).x Point(49).y-Point(51).y]);
theta = acos((Point(49).r+Point(51).r)/tempLEN);
tempAng1 = atan2(Point(51).y-Point(49).y, Point(51).x-Point(49).x);
Point(49).ang1 = tempAng1-theta;
Point(51).ang0 = Point(49).ang1-pi;
tPoints = ceil(Point(49).r*(Point(49).ang1-Point(49).ang0));
dAngle = (Point(49).ang1-Point(49).ang0)/(tPoints-1); 
angle = (Point(49).ang0):dAngle:Point(49).ang1;
xyCourse = [xyCourse;(Point(49).x+Point(49).r*cos(angle))' (Point(49).y+Point(49).r*sin(angle))'];
xyCourse(end,:) = [];

% Point(50) to Point(51), Straight Line
Point(50).x = Point(49).x + Point(49).r*cos(Point(49).ang1); 
Point(50).y = Point(49).y + Point(49).r*sin(Point(49).ang1); 
Point(50).r = -1;
tempPx0 = Point(50).x;
tempPy0 = Point(50).y;
tempPx1 = Point(51).x+Point(51).r*cos(Point(51).ang0);
tempPy1 = Point(51).y+Point(51).r*sin(Point(51).ang0);
% resolution is 1cm
tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
%Find the length in cm   
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
%Delete last row, the point will be recovered at the next plot 
xyCourse(end,:) = [];	

% Point(51) to Point(52), CW arc
Point(51).ang1 = -3*pi/2;
tPoints = ceil(Point(51).r*(Point(51).ang0-Point(51).ang1));
dAngle = (Point(51).ang1-Point(51).ang0)/(tPoints-1); 
angle = (Point(51).ang0):dAngle:Point(51).ang1;
xyCourse = [xyCourse;(Point(51).x+Point(51).r*cos(angle))' (Point(51).y+Point(51).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(52) to Point(53), Straight Line
Point(53).x = 350; Point(53).y = 315; Point(53).r = 15;
Point(52).x = Point(51).x + Point(51).r*cos(Point(51).ang1); 
Point(52).y = Point(51).y + Point(51).r*sin(Point(51).ang1); 
Point(52).r = -1;
Point(53).ang0 = pi/2;
tempPx0 = Point(52).x;
tempPy0 = Point(52).y;
tempPx1 = Point(53).x+Point(53).r*cos(Point(53).ang0);
tempPy1 = Point(53).y+Point(53).r*sin(Point(53).ang0);
% resolution is 1cm
tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
%Find the length in cm   
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
%Delete last row, the point will be recovered at the next plot 
xyCourse(end,:) = [];	

% Point(53) to Point(54), CW arc
theta = asin(20/30);
Point(53).ang1 = theta;
Point(54).ang0 = theta-pi;
tPoints = ceil(Point(53).r*(Point(53).ang0-Point(53).ang1));
dAngle = (Point(53).ang1-Point(53).ang0)/(tPoints-1); 
angle = (Point(53).ang0):dAngle:Point(53).ang1;
xyCourse = [xyCourse;(Point(53).x+Point(53).r*cos(angle))' (Point(53).y+Point(53).r*sin(angle))'];
xyCourse(end,:) = [];	

% Point(54) to Point(55), CCW arc
Point(54).x = Point(53).x + 30*cos(Point(53).ang1); 
Point(54).y = Point(53).y + 30*sin(Point(53).ang1); 
Point(54).r = 15;
Point(54).ang1 = -pi/2;
tPoints = ceil(Point(54).r*(Point(54).ang1-Point(54).ang0));
dAngle = (Point(54).ang1-Point(54).ang0)/(tPoints-1); 
angle = (Point(54).ang0):dAngle:Point(54).ang1;
xyCourse = [xyCourse;(Point(54).x+Point(54).r*cos(angle))' (Point(54).y+Point(54).r*sin(angle))'];
xyCourse(end,:) = [];

% Point(55) to Point(56), Straight Line
Point(56).x = 420; Point(56).y = 320; Point(56).r = -1;
Point(55).x = Point(54).x + Point(54).r*cos(Point(54).ang1); 
Point(55).y = Point(54).y + Point(54).r*sin(Point(54).ang1); 
Point(55).r = -1;
tempPx0 = Point(55).x;
tempPy0 = Point(55).y;
tempPx1 = Point(56).x;
tempPy1 = Point(56).y;
% resolution is 1cm
tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
%Find the length in cm   
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
%Delete last row, the point will be recovered at the next plot 
xyCourse(end,:) = [];	

% Point(56) to Point(1), Straight Line
tempPx0 = Point(56).x;
tempPy0 = Point(56).y;
tempPx1 = Point(1).x;
tempPy1 = Point(1).y;
% resolution is 1cm
tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
%Find the length in cm   
xyCourse = [xyCourse;linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
%Delete last row, the point will be recovered at the next plot 
%xyCourse(end,:) = [];	

% plot the course
f = figure(1);
%set(f, 'Position',[0 100 1600 800]);
set(f, 'color', 'white');
set(f, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.9, 0.8]);

plot([0 135 135 0 0], [0 0 270 270 0], 'c', 'LineWidth',3); hold;
plot([0 810 810 0 0], [90 90 180 180 0], 'c', 'LineWidth',3);
plot([135 945 945 135 135], [270 270 360 360 270], 'c', 'LineWidth',3);
plot([945 945 810 810], [270 180 180 360], 'c', 'LineWidth',3);
plot([945 945 810 810], [270 180 180 360], 'c', 'LineWidth',3);
plot([135 270 270], [0 0 360], 'c', 'LineWidth',3);
plot([270 405 405], [0 0 360], 'c', 'LineWidth',3);
plot([405 540 540], [0 0 360], 'c', 'LineWidth',3);
plot([540 675 675], [0 0 360], 'c', 'LineWidth',3);

theta = 0:pi/100:2*pi;
plot(Point(2).x+Point(2).r*cos(theta), Point(2).y+Point(2).r*sin(theta), 'r'); 
plot(Point(3).x+Point(3).r*cos(theta), Point(3).y+Point(3).r*sin(theta), 'r');
plot(Point(3).x+30*cos(theta), Point(3).y+30*sin(theta), 'b--');
plot(Point(5).x+Point(5).r*cos(theta), Point(5).y+Point(5).r*sin(theta), 'r');
plot(Point(7).x+Point(7).r*cos(theta), Point(7).y+Point(7).r*sin(theta), 'r');
plot(Point(8).x+Point(8).r*cos(theta), Point(8).y+Point(8).r*sin(theta), 'r');
plot(Point(8).x+35*cos(theta), Point(8).y+35*sin(theta), 'b--');
plot(Point(9).x+Point(9).r*cos(theta), Point(9).y+Point(9).r*sin(theta), 'r');
plot(Point(11).x+Point(11).r*cos(theta), Point(11).y+Point(11).r*sin(theta), 'r');
plot(Point(12).x+Point(12).r*cos(theta), Point(12).y+Point(12).r*sin(theta), 'r');
plot(Point(12).x+35*cos(theta), Point(12).y+35*sin(theta), 'b--');
plot(Point(13).x+Point(13).r*cos(theta), Point(13).y+Point(13).r*sin(theta), 'r');
plot(Point(15).x+Point(15).r*cos(theta), Point(15).y+Point(15).r*sin(theta), 'r');
plot(Point(15).x+2*Point(15).r*cos(theta), Point(15).y+2*Point(15).r*sin(theta), 'b--');
plot(Point(16).x+Point(16).r*cos(theta), Point(16).y+Point(16).r*sin(theta), 'r');
plot(Point(17).x+Point(17).r*cos(theta), Point(17).y+Point(17).r*sin(theta), 'r');
plot(Point(17).x+2*Point(17).r*cos(theta), Point(17).y+2*Point(17).r*sin(theta), 'b--');
plot(Point(18).x+Point(18).r*cos(theta), Point(18).y+Point(18).r*sin(theta), 'r');
plot(Point(19).x+Point(19).r*cos(theta), Point(19).y+Point(19).r*sin(theta), 'r');
plot(Point(19).x+2*Point(19).r*cos(theta), Point(19).y+2*Point(19).r*sin(theta), 'b--');
plot(Point(20).x+Point(20).r*cos(theta), Point(20).y+Point(20).r*sin(theta), 'r');
plot(Point(21).x+Point(21).r*cos(theta), Point(21).y+Point(21).r*sin(theta), 'r');
plot(Point(21).x+2*Point(21).r*cos(theta), Point(21).y+2*Point(21).r*sin(theta), 'b--');
plot(Point(22).x+Point(22).r*cos(theta), Point(22).y+Point(22).r*sin(theta), 'r');
plot(Point(23).x+Point(23).r*cos(theta), Point(23).y+Point(23).r*sin(theta), 'r');
plot(Point(23).x+2*Point(23).r*cos(theta), Point(23).y+2*Point(23).r*sin(theta), 'b--');
plot(Point(25).x+Point(25).r*cos(theta), Point(25).y+Point(25).r*sin(theta), 'r');
plot(Point(26).x+Point(26).r*cos(theta), Point(26).y+Point(26).r*sin(theta), 'r');
plot(Point(27).x+Point(27).r*cos(theta), Point(27).y+Point(27).r*sin(theta), 'r');
plot(Point(27).x+2*Point(27).r*cos(theta), Point(27).y+2*Point(27).r*sin(theta), 'b--');
plot(Point(28).x+Point(28).r*cos(theta), Point(28).y+Point(28).r*sin(theta), 'r');
plot(Point(29).x+Point(29).r*cos(theta), Point(29).y+Point(29).r*sin(theta), 'r');
plot(Point(29).x+2*Point(29).r*cos(theta), Point(29).y+2*Point(29).r*sin(theta), 'b--');
plot(Point(30).x+Point(30).r*cos(theta), Point(30).y+Point(30).r*sin(theta), 'r');
plot(Point(31).x+Point(31).r*cos(theta), Point(31).y+Point(31).r*sin(theta), 'r');
plot(Point(31).x+2*Point(31).r*cos(theta), Point(31).y+2*Point(31).r*sin(theta), 'b--');
plot(Point(33).x+Point(33).r*cos(theta), Point(33).y+Point(33).r*sin(theta), 'r');
plot(Point(35).x+Point(35).r*cos(theta), Point(35).y+Point(35).r*sin(theta), 'r');
plot(Point(37).x+Point(37).r*cos(theta), Point(37).y+Point(37).r*sin(theta), 'r');
plot(Point(39).x+Point(39).r*cos(theta), Point(39).y+Point(39).r*sin(theta), 'r');
plot(Point(41).x+Point(41).r*cos(theta), Point(41).y+Point(41).r*sin(theta), 'r');
plot(Point(43).x+Point(43).r*cos(theta), Point(43).y+Point(43).r*sin(theta), 'r');
plot(Point(45).x+Point(45).r*cos(theta), Point(45).y+Point(45).r*sin(theta), 'r');
plot(Point(46).x+Point(46).r*cos(theta), Point(46).y+Point(46).r*sin(theta), 'r');
plot(Point(47).x+Point(47).r*cos(theta), Point(47).y+Point(47).r*sin(theta), 'r');
plot(Point(49).x+Point(49).r*cos(theta), Point(49).y+Point(49).r*sin(theta), 'r');
plot(Point(51).x+Point(51).r*cos(theta), Point(51).y+Point(51).r*sin(theta), 'r');
plot(Point(53).x+Point(53).r*cos(theta), Point(53).y+Point(53).r*sin(theta), 'r');
plot(Point(53).x+2*Point(53).r*cos(theta), Point(53).y+2*Point(53).r*sin(theta), 'b--');
plot(Point(54).x+Point(54).r*cos(theta), Point(54).y+Point(54).r*sin(theta), 'r');

plot(xyCourse(:,1), xyCourse(:,2),'k', 'LineWidth',3);hold;
axis([-10 955 -80 370]); grid;
set(gca,'DataAspectRatio',[1 1 1]);
set(gca,'FontSize',14);
title('2024 All Japan Robotrace contest course', 'fontsize',18);
xlabel('Length in cm', 'fontsize',16);
ylabel('Length in cm', 'fontsize',16);