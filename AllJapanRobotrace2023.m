% Data structure
% struct xy, dir, radius, angle: if dir=0, straight line, dir=1, CCW, dir=-1, CW
% arc, ang0: start point, ang1: end point, ang0 and ang1 are in the range of -pi~pi
% unit: cm, resolution: 1cm
clear

% Start to Point(2), Straight Line
Point(1).x = 160; Point(1).y = 40;   Point(1).dir = 0;  Point(1).ang0 = -pi/2;
Point(2).x = 180; Point(2).y = -10;  Point(2).r = 50;   Point(2).ang0 = pi/2;

% Point(2) to Point(3), CW arc
% resolution is 1cm, total points in theta with radius r would be r*theta,
% and dAngle would be theta/tpoints = theta/ceil(r*theta)
dist = (240-180)/4;
theta = asin(dist/Point(2).r);
Point(2).ang1 = pi/2-theta;
Point(2).dir = -1;
Point(3).x = Point(2).x + 2*Point(2).r*cos(Point(2).ang1); 
Point(3).y = Point(2).y + 2*Point(2).r*sin(Point(2).ang1); 
% Point(3) to Point(4), CCW arc
Point(3).dir = 1;
Point(3).r = 50;
Point(3).ang0 = Point(2).ang1-pi;
Point(3).ang1 = Point(3).ang0+2*theta;

% Point(4) to Point(5), CW arc
Point(4).dir = -1;
Point(4).x = Point(3).x + 2*Point(3).r*cos(Point(3).ang1); 
Point(4).y = Point(3).y + 2*Point(3).r*sin(Point(3).ang1); 
Point(4).r = 50;
Point(4).ang0 = Point(3).ang1+pi;
Point(4).ang1 = Point(4).ang0-2*theta;

% Point(5) to Point(6), CCW arc
Point(5).dir = 1;
Point(5).x = Point(4).x + 2*Point(4).r*cos(Point(4).ang1); 
Point(5).y = Point(4).y + 2*Point(4).r*sin(Point(4).ang1); 
Point(5).r = 50;
Point(5).ang0 = Point(4).ang1-pi;
Point(5).ang1 = Point(5).ang0+2*theta;

% Point(6) to Point(7), CW arc
Point(6).dir = -1;
Point(6).x = Point(5).x + 2*Point(5).r*cos(Point(5).ang1); 
Point(6).y = Point(5).y + 2*Point(5).r*sin(Point(5).ang1); 
Point(6).r = 50;
Point(6).ang0 = Point(5).ang1+pi;
Point(6).ang1 = Point(6).ang0-2*theta;

% Point(7) to Point(8), CCW arc
Point(7).dir = 1;
Point(7).x = Point(6).x + 2*Point(6).r*cos(Point(6).ang1); 
Point(7).y = Point(6).y + 2*Point(6).r*sin(Point(6).ang1); 
Point(7).r = 50;
Point(7).ang0 = Point(6).ang1-pi;
Point(7).ang1 = Point(7).ang0+2*theta;

% Point(8) to Point(9), CW arc
Point(8).dir = -1;
Point(8).x = Point(7).x + 2*Point(7).r*cos(Point(7).ang1); 
Point(8).y = Point(7).y + 2*Point(7).r*sin(Point(7).ang1); 
Point(8).r = 50;
Point(8).ang0 = Point(7).ang1+pi;
Point(8).ang1 = pi/2;

% Point(9) to Point(10), CW arc, Point(10) to Point(11), CCW arc, Point(11) to Point(12), CW arc
Point(9).dir = -1;
Point(9).x = 360; Point(9).y = 10;   Point(9).r = 30;
Point(9).ang0 = pi/2;
Point(10).dir = 1; Point(10).r = 15;
Point(11).dir = -1;
Point(11).x = 410; Point(11).y = 25;   Point(11).r = 15;
tempLEN = norm([Point(11).x-Point(9).x Point(11).y-Point(9).y]);
theta = acos((tempLEN^2+(Point(9).r+Point(10).r)^2-(Point(11).r+Point(10).r)^2)/2/tempLEN/(Point(9).r+Point(10).r));
tempAng1 = atan2(Point(11).y-Point(9).y, Point(11).x-Point(9).x);
Point(9).ang1 = tempAng1+theta;
Point(10).ang0 = Point(9).ang1-pi;
Point(10).x = Point(9).x + (Point(9).r+Point(10).r)*cos(Point(9).ang1); 
Point(10).y = Point(9).y + (Point(9).r+Point(10).r)*sin(Point(9).ang1); 
tempAng1 = atan2(Point(11).y-Point(10).y, Point(11).x-Point(10).x);
Point(10).ang1 = tempAng1;
Point(11).ang0 = Point(10).ang1+pi;

% Point(12) to Point(13), CCW arc, 
Point(13).dir = -1;
Point(13).x = 455; Point(13).y = 25;   Point(13).r = 15;
Point(12).r = 15;
Point(12).dir = 1;
tempLEN = norm([Point(11).x-Point(13).x Point(11).y-Point(13).y]);
theta = acos((tempLEN^2+(Point(11).r+Point(12).r)^2-(Point(12).r+Point(13).r)^2)/2/tempLEN/(Point(11).r+Point(12).r));
Point(11).ang1 = theta;
Point(12).ang0 = theta-pi;
Point(12).x = Point(11).x + (Point(11).r+Point(12).r)*cos(Point(11).ang1); 
Point(12).y = Point(11).y + (Point(11).r+Point(12).r)*sin(Point(11).ang1); 
tempAng1 = atan2(Point(13).y-Point(12).y, Point(13).x-Point(12).x);
Point(12).ang1 = tempAng1;
Point(13).ang0 = Point(12).ang1+pi;

% Point(13) to Point(14), CW arc, Point(14) to Point(15), CCW arc
Point(15).dir = -1;
Point(15).x = 505; Point(15).y = 25;   Point(15).r = 15;
Point(14).r = 20;
Point(14).dir = 1;
tempLEN = norm([Point(15).x-Point(13).x Point(15).y-Point(13).y]);
theta = acos((tempLEN^2+(Point(13).r+Point(14).r)^2-(Point(14).r+Point(15).r)^2)/2/tempLEN/(Point(13).r+Point(14).r));
Point(13).ang1 = theta;
Point(14).ang0 = theta-pi;
Point(14).x = Point(13).x + (Point(13).r+Point(14).r)*cos(Point(13).ang1); 
Point(14).y = Point(13).y + (Point(13).r+Point(14).r)*sin(Point(13).ang1); 
tempAng1 = atan2(Point(15).y-Point(14).y, Point(15).x-Point(14).x);
Point(14).ang1 = tempAng1;
Point(15).ang0 = Point(14).ang1+pi;

% Point(15) to Point(16), CW arc, Point(16) to Point(17), CCW arc
Point(17).dir = -1;
Point(17).x = 550; Point(17).y = 25;   Point(17).r = 15;
Point(16).r = 15;
Point(16).dir = 1;
tempLEN = norm([Point(15).x-Point(17).x Point(15).y-Point(17).y]);
theta = acos((tempLEN^2+(Point(15).r+Point(16).r)^2-(Point(16).r+Point(17).r)^2)/2/tempLEN/(Point(15).r+Point(16).r));
Point(15).ang1 = theta;
Point(16).ang0 = theta-pi;
Point(16).x = Point(15).x + (Point(15).r+Point(16).r)*cos(Point(15).ang1); 
Point(16).y = Point(15).y + (Point(15).r+Point(16).r)*sin(Point(15).ang1); 
tempAng1 = atan2(Point(17).y-Point(16).y, Point(17).x-Point(16).x);
Point(16).ang1 = tempAng1;
Point(17).ang0 = Point(16).ang1+pi;

% Point(17) to Point(18), CW arc, Point(18) to Point(19), CCW arc
Point(19).dir = -1;
Point(19).x = 600; Point(19).y = 10;   Point(19).r = 30;
Point(18).r = 15;
Point(18).dir = 1;
tempLEN = norm([Point(19).x-Point(17).x Point(19).y-Point(17).y]);
theta = acos((tempLEN^2+(Point(17).r+Point(18).r)^2-(Point(18).r+Point(19).r)^2)/2/tempLEN/(Point(17).r+Point(18).r));
tempAng1 = atan2(Point(19).y-Point(17).y, Point(19).x-Point(17).x);
Point(17).ang1 = tempAng1+theta;
Point(18).ang0 = Point(17).ang1-pi;
Point(18).x = Point(17).x + (Point(17).r+Point(18).r)*cos(Point(17).ang1); 
Point(18).y = Point(17).y + (Point(17).r+Point(18).r)*sin(Point(17).ang1); 
tempAng1 = atan2(Point(19).y-Point(18).y, Point(19).x-Point(18).x);
Point(18).ang1 = tempAng1;
Point(19).ang0 = Point(18).ang1+pi;

% Point(19) to Point(20), CW arc
Point(19).ang1 = pi/2;
Point(20).x = 600; Point(20).y = 80; Point(20).r = 40;
Point(20).dir = 1;
Point(20).ang0 = -pi/2;

% Point(20) to Point(21), CCW arc, Point(21) to Point(22), Straight Line
Point(22).x = 467; Point(22).y = 237; Point(22).r = 15;
Point(22).dir = -1;
tempLEN = norm([Point(20).x-Point(22).x Point(20).y-Point(22).y]);
theta = acos((Point(20).r+Point(22).r)/tempLEN);
tempAng1 = atan2(Point(22).y-Point(20).y, Point(22).x-Point(20).x);
Point(20).ang1 = tempAng1-theta;
Point(21).x = Point(20).x + Point(20).r*cos(Point(20).ang1); 
Point(21).y = Point(20).y + Point(20).r*sin(Point(20).ang1); 
Point(21).dir = 0;
Point(16).ang0 = Point(15).ang1-pi;
tempAng1 = atan2(Point(17).y-Point(16).y, Point(17).x-Point(16).x);
Point(22).ang0 = Point(20).ang1-pi;

% Point(22) to Point(23), CW arc, Point(23) to Point(24), Straight Line
Point(24).x = 472; Point(24).y = 200; Point(24).r = 10;
Point(24).dir = 1;
tempLEN = norm([Point(24).x-Point(22).x Point(24).y-Point(22).y]);
theta = acos((Point(24).r+Point(22).r)/tempLEN);
tempAng1 = atan2(Point(24).y-Point(22).y, Point(24).x-Point(22).x);
Point(22).ang1 = tempAng1+theta;
Point(23).x = Point(22).x + Point(22).r*cos(Point(22).ang1); 
Point(23).y = Point(22).y + Point(22).r*sin(Point(22).ang1); 
Point(23).dir = 0;
Point(24).ang0 = Point(22).ang1+pi;

% Point(24) to Point(25), CCW arc, Point(25) to Point(26), Straight Line
Point(24).ang1 = Point(22).ang1;
Point(26).x = 504; Point(26).y = 212; Point(26).r = 10;
Point(26).dir = -1;
Point(26).ang0 = Point(24).ang0;
Point(26).ang1 = Point(24).ang1;
Point(25).x = Point(24).x + Point(24).r*cos(Point(24).ang1); 
Point(25).y = Point(24).y + Point(24).r*sin(Point(24).ang1); 
Point(25).dir = 0;

% Point(26) to Point(27), CW arc, Point(27) to Point(28), Straight Line
Point(28).x = 501; Point(28).y = 163; Point(28).r = 15;
Point(28).dir = 1;
Point(28).ang0 = Point(26).ang0;
Point(28).ang1 = Point(26).ang1-pi/2;
Point(27).x = Point(26).x + Point(26).r*cos(Point(26).ang1); 
Point(27).y = Point(26).y + Point(26).r*sin(Point(26).ang1); 
Point(27).dir = 0;

% Point(28) to Point(29), CCW arc, Point(29) to Point(30), Straight Line
Point(30).x = 516; Point(30).y = 153; Point(30).r = 15;
Point(30).dir = 1;
Point(30).ang0 = Point(28).ang1;
Point(30).ang1 = Point(28).ang0-pi;
Point(29).x = Point(28).x + Point(28).r*cos(Point(28).ang1); 
Point(29).y = Point(28).y + Point(28).r*sin(Point(28).ang1); 
Point(29).dir = 0;

% Point(30) to Point(31), CCW arc, Point(31) to Point(32), Straight Line
Point(31).x = Point(30).x + Point(30).r*cos(Point(30).ang1); 
Point(31).y = Point(30).y + Point(30).r*sin(Point(30).ang1); 
Point(31).dir = 0;
theta = acos((340^2+340^2-60^2)/2/340/340);
tempX = 390; tempY = -60;
Point(32).x = tempX + 340*cos(Point(30).ang0+pi+theta); 
Point(32).y = tempY + 340*sin(Point(30).ang0+pi+theta); 
Point(32).ang0 = Point(30).ang1;
Point(32).r = 60;
Point(32).dir = 1;
Point(33).x = tempX; Point(33).y = tempY; Point(33).r = 400;
Point(33).dir = 1;
tempAng1 = atan2(Point(32).y-Point(33).y, Point(32).x-Point(33).x);
Point(33).ang0 = tempAng1;
Point(32).ang1 = Point(33).ang0;

% Point(33) to Point(34), CCW arc
theta = acos((440^2+440^2-40^2)/2/440/440);
Point(34).x = Point(33).x + 440*cos(pi/2+theta); 
Point(34).y = Point(33).y + 440*sin(pi/2+theta); 
Point(34).ang0 = theta-pi/2;
Point(33).ang1 = Point(34).ang0+pi;
Point(34).dir = -1;
Point(34).r = 40;

% Point(34) to Point(35), CW arc
Point(36).x = 290; Point(36).y = 355; Point(36).r = 30;
Point(36).dir = -1;
tempLEN = norm([Point(34).x-Point(36).x Point(34).y-Point(36).y]);
theta = acos((80^2+tempLEN^2-70^2)/2/80/tempLEN);
tempAng1 = atan2(Point(36).y-Point(34).y, Point(36).x-Point(34).x);
Point(34).ang1 = tempAng1+theta;
Point(35).x = Point(34).x + 80*cos(Point(34).ang1); 
Point(35).y = Point(34).y + 80*sin(Point(34).ang1); 
Point(35).ang0 = Point(34).ang1+pi;
Point(35).r = 40;
Point(35).dir = 1;

% Point(35) to Point(36), CCW arc
tempAng1 = atan2(Point(36).y-Point(35).y, Point(36).x-Point(35).x);
Point(35).ang1 = tempAng1;
Point(36).ang0 = Point(35).ang1-pi;

% Point(36) to Point(37), CW arc
Point(38).x = 240; Point(38).y = 335; Point(38).r = 25;
Point(38).dir = -1;
tempLEN = norm([Point(38).x-Point(36).x Point(38).y-Point(36).y]);
theta = acos((60^2+tempLEN^2-55^2)/2/60/tempLEN);
tempAng1 = atan2(Point(38).y-Point(36).y, Point(38).x-Point(36).x);
Point(36).ang1 = tempAng1+theta;
Point(37).x = Point(36).x + 60*cos(Point(36).ang1); 
Point(37).y = Point(36).y + 60*sin(Point(36).ang1); 
Point(37).ang0 = Point(36).ang1+pi;
Point(37).r = 30;
Point(37).dir = 1;

% Point(37) to Point(38), CCW arc
tempAng1 = atan2(Point(38).y-Point(37).y, Point(38).x-Point(37).x);
Point(37).ang1 = tempAng1;
Point(38).ang0 = Point(37).ang1-pi;

% Point(38) to Point(39), CW arc
Point(40).x = 202; Point(40).y = 313; Point(40).r = 20;
Point(40).dir = -1;
tempLEN = norm([Point(40).x-Point(38).x Point(40).y-Point(38).y]);
theta = acos((50^2+tempLEN^2-45^2)/2/50/tempLEN);
tempAng1 = atan2(Point(40).y-Point(38).y, Point(40).x-Point(38).x);
Point(38).ang1 = tempAng1+theta;
Point(39).x = Point(38).x + 50*cos(Point(38).ang1); 
Point(39).y = Point(38).y + 50*sin(Point(38).ang1); 
Point(39).ang0 = Point(38).ang1+pi;
Point(39).r = 25;
Point(39).dir = 1;

% Point(39) to Point(40), CCW arc
tempAng1 = atan2(Point(40).y-Point(39).y, Point(40).x-Point(39).x);
Point(39).ang1 = tempAng1;
Point(40).ang0 = Point(39).ang1-pi;

% Point(40) to Point(41), CW arc
Point(42).x = 165; Point(42).y = 298; Point(42).r = 25;
Point(42).dir = -1;
tempLEN = norm([Point(40).x-Point(42).x Point(40).y-Point(42).y]);
theta = acos((40^2+tempLEN^2-45^2)/2/40/tempLEN);
tempAng1 = atan2(Point(42).y-Point(40).y, Point(42).x-Point(40).x);
Point(40).ang1 = tempAng1+theta;
Point(41).x = Point(40).x + 40*cos(Point(40).ang1); 
Point(41).y = Point(40).y + 40*sin(Point(40).ang1); 
Point(41).ang0 = Point(40).ang1+pi;
Point(41).r = 20;
Point(41).dir = 1;

% Point(41) to Point(42), CCW arc
tempAng1 = atan2(Point(42).y-Point(41).y, Point(42).x-Point(41).x);
Point(41).ang1 = tempAng1;
Point(42).ang0 = Point(41).ang1-pi;

% Point(42) to Point(43), CW arc
Point(44).x = 123; Point(44).y = 273; Point(44).r = 30;
Point(44).dir = -1;
tempLEN = norm([Point(44).x-Point(42).x Point(44).y-Point(42).y]);
theta = acos((50^2+tempLEN^2-55^2)/2/50/tempLEN);
tempAng1 = atan2(Point(44).y-Point(42).y, Point(44).x-Point(42).x);
Point(42).ang1 = tempAng1+theta;
Point(43).x = Point(42).x + 50*cos(Point(42).ang1); 
Point(43).y = Point(42).y + 50*sin(Point(42).ang1); 
Point(43).ang0 = Point(42).ang1+pi;
Point(43).r = 25;
Point(43).dir = 1;

% Point(43) to Point(44), CCW arc
tempAng1 = atan2(Point(44).y-Point(43).y, Point(44).x-Point(43).x);
Point(43).ang1 = tempAng1;
Point(44).ang0 = Point(43).ang1-pi;

% Point(44) to Point(45), CW arc
Point(46).x = 77; Point(46).y = 247; Point(46).r = 40;
Point(46).dir = -1;
tempLEN = norm([Point(44).x-Point(46).x Point(44).y-Point(46).y]);
theta = acos((60^2+tempLEN^2-70^2)/2/60/tempLEN);
tempAng1 = atan2(Point(46).y-Point(44).y, Point(46).x-Point(44).x);
Point(44).ang1 = tempAng1+theta;
Point(45).x = Point(44).x + 60*cos(Point(44).ang1); 
Point(45).y = Point(44).y + 60*sin(Point(44).ang1); 
Point(45).ang0 = Point(44).ang1+pi;
Point(45).r = 30;
Point(45).dir = 1;

% Point(45) to Point(46), CCW arc
tempAng1 = atan2(Point(46).y-Point(45).y, Point(46).x-Point(45).x);
Point(45).ang1 = tempAng1;
Point(46).ang0 = Point(45).ang1-pi;

% Point(46) to Point(47), CW arc
tempX = 20; tempY = 164;
tempLEN = norm([Point(33).x-tempX Point(33).y-tempY]);
theta = acos((440^2+tempLEN^2-40^2)/2/440/tempLEN);
tempAng1 = atan2(tempY-Point(33).y, tempX-Point(33).x);
Point(48).x = Point(33).x + 440*cos(tempAng1-theta); 
Point(48).y = Point(33).y + 440*sin(tempAng1-theta); 
Point(48).r = 40;
Point(48).dir = -1;
tempLEN = norm([Point(48).x-Point(46).x Point(48).y-Point(46).y]);
theta = acos((80^2+tempLEN^2-80^2)/2/80/tempLEN);
tempAng1 = atan2(Point(48).y-Point(46).y, Point(48).x-Point(46).x);
Point(46).ang1 = tempAng1+theta;
Point(47).x = Point(46).x + 80*cos(Point(46).ang1); 
Point(47).y = Point(46).y + 80*sin(Point(46).ang1); 
Point(47).ang0 = Point(46).ang1+pi;
Point(47).r = 40;
Point(47).dir = 1;

% Point(47) to Point(48), CCW arc
tempAng1 = atan2(Point(48).y-Point(47).y, Point(48).x-Point(47).x);
Point(47).ang1 = tempAng1;
Point(48).ang0 = Point(47).ang1-pi;

% Point(48) to Point(49), CW arc
tempAng1 = atan2(Point(48).y-Point(33).y, Point(48).x-Point(33).x);
Point(48).ang1 = tempAng1-pi;
Point(49).ang0 = tempAng1;
Point(49).x = Point(33).x; 
Point(49).y = Point(33).y; 
Point(49).r = 400;
Point(49).dir = 1;

% Point(49) to Point(50), CCW arc
theta = acos((440^2+390^2-80^2)/2/440/390);
tempAng1 = atan2(Point(48).y-Point(33).y, Point(48).x-Point(33).x);
Point(50).ang0 = tempAng1+theta;
Point(49).ang1 = tempAng1+theta;

% Point(50) to Point(51), CCW arc
Point(50).x = Point(49).x + 390*cos(Point(49).ang1); 
Point(50).y = Point(49).y + 390*sin(Point(49).ang1); 
Point(50).r = 10;
Point(50).dir = 1;

% Point(51) to Point(56)
Point(54).x = 120; Point(54).y = 165; Point(54).r = 10;
Point(54).dir = -1;
Point(54).ang0 = pi/2;
theta = acos((20^2+30^2-20^2)/2/20/30);
Point(54).ang1 = -pi/2-theta;
Point(55).x = Point(54).x + 20*cos(Point(54).ang1); 
Point(55).y = Point(54).y + 20*sin(Point(54).ang1); 
Point(55).dir = 1;  Point(55).r = 10;
Point(55).ang0 = Point(54).ang1+pi;
Point(55).ang1 = pi/2+theta-pi;
Point(52).x = Point(55).x;
Point(52).y = Point(55).y;  Point(52).r = 25;
tempAng1 = atan2(Point(55).y-Point(50).y, Point(55).x-Point(50).x);
tempLEN = norm([Point(55).x-Point(50).x Point(55).y-Point(50).y]);
theta = acos(35/tempLEN);
Point(50).ang1 = tempAng1-theta;
Point(51).x = Point(50).x + Point(50).r*cos(Point(50).ang1); 
Point(51).y = Point(50).y + Point(50).r*sin(Point(50).ang1); 
Point(51).r = 10;   Point(51).dir = 0;
Point(52).ang0 = Point(50).ang1 + pi;
Point(52).ang1 = pi/2;
Point(52).dir = -1;
Point(53).x = Point(52).x + Point(52).r*cos(Point(52).ang1);
Point(53).y = Point(52).y + Point(52).r*sin(Point(52).ang1);  Point(53).r = 25;
Point(53).dir = 0;

% Point(56) to Point(57)
Point(56).x = 120;  Point(56).y = 135;  Point(56).r = 10;
Point(56).dir = -1;
Point(56).ang0 = Point(55).ang1 + pi;
Point(56).ang1 = Point(54).ang1;

% Point(57) to Point(58)
Point(57).x = Point(56).x + 20*cos(Point(56).ang1); 
Point(57).y = Point(56).y + 20*sin(Point(56).ang1); 
Point(57).dir = 1;  Point(57).r = 10;
Point(57).ang0 = Point(55).ang0;
Point(57).ang1 = Point(55).ang1;

% Point(58) to Point(59)
Point(58).x = 120;  Point(58).y = 105;  Point(58).r = 10;
Point(58).dir = -1;
Point(58).ang0 = Point(56).ang0;
Point(60).x = 70;  Point(60).y = 50;  Point(60).r = 50;
Point(60).dir = 1;
tempAng1 = atan2(Point(58).y-Point(60).y, Point(58).x-Point(60).x);
tempLEN = norm([Point(58).x-Point(60).x Point(58).y-Point(60).y]);
theta = acos(60/tempLEN);
Point(60).ang0 = tempAng1+theta;
Point(58).ang1 = Point(60).ang0-pi;

% Point(59) to Point(60)
Point(59).x = Point(58).x + 10*cos(Point(58).ang1); 
Point(59).y = Point(58).y + 10*sin(Point(58).ang1); 
Point(59).dir = 0;  Point(59).r = 10;

% Point(60) to Point(62)
Point(61).x = 30;  Point(61).y = 50;  Point(61).r = 10;
Point(61).dir = 1;
Point(60).ang1 = pi;
Point(61).ang0 = pi;
Point(61).ang1 = -pi/2;

% Point(62) to Point(63)(Goal)
Point(62).x = Point(61).x + 10*cos(Point(61).ang1); 
Point(62).y = Point(61).y + 10*sin(Point(61).ang1); 
Point(62).dir = 0;  Point(62).r = 10;
Point(63).x = 60;  Point(63).y = 40;  Point(63).r = 0;
Point(63).dir = 0;
Point(63).ang0 = -pi/2;

% Goal to Start
Goal = 63;

% plot the course
f = figure(1);
%set(f, 'Position',[0 100 1600 800]);
set(f, 'color', 'white');
set(f, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.8, 0.8]);

% Plot board boundaries
plot([0 675 675 0 0], [0 0 360 360 0], 'c', 'LineWidth',2);
hold;
plot([0 0 675 675 0], [90 180 180 90 90], 'c', 'LineWidth',2);
plot([0 675], [270 270], 'c', 'LineWidth',2);
plot([135 135], [0 360], 'c', 'LineWidth',2);
plot([270 270], [0 360], 'c', 'LineWidth',2);
plot([405 405], [0 360], 'c', 'LineWidth',2);
plot([540 540], [0 360], 'c', 'LineWidth',2);

% plot prompts
a=Show_prompt([Point(1).x;Point(1).y], Point(1).ang0, 0);
%text(Point(1).x-10,Point(1).y-15,'START');
text(Point(1).x+15*cos(Point(1).ang0)-12,Point(1).y+15*sin(Point(1).ang0),'START');
for ind=2:Goal-1
    if (Point(ind).dir==-1)
        a=Show_prompt([Point(ind).x+Point(ind).r*cos(Point(ind).ang0);Point(ind).y+Point(ind).r*sin(Point(ind).ang0)], Point(ind).ang0, 1);
    elseif (Point(ind).dir==1)
        a=Show_prompt([Point(ind).x+Point(ind).r*cos(Point(ind).ang0);Point(ind).y+Point(ind).r*sin(Point(ind).ang0)], Point(ind).ang0+pi, 1);
    elseif (Point(ind).dir==0)
        if (Point(ind-1).dir==1)
            a=Show_prompt([Point(ind).x;Point(ind).y], Point(ind-1).ang1+pi, 1);
        elseif (Point(ind-1).dir==-1)
            a=Show_prompt([Point(ind).x;Point(ind).y], Point(ind-1).ang1, 1);
        end;
    end;
end;
% a=Show_prompt([Point(2).x+Point(2).r*cos(Point(2).ang0);Point(2).y+Point(2).r*sin(Point(2).ang0)], Point(2).ang0, 1);
% a=Show_prompt([Point(3).x+Point(3).r*cos(Point(3).ang0);Point(3).y+Point(3).r*sin(Point(3).ang0)], Point(3).ang0+pi, 1);
% a=Show_prompt([Point(4).x+Point(4).r*cos(Point(4).ang0);Point(4).y+Point(4).r*sin(Point(4).ang0)], Point(4).ang0, 1);
% a=Show_prompt([Point(5).x+Point(5).r*cos(Point(5).ang0);Point(5).y+Point(5).r*sin(Point(5).ang0)], Point(5).ang0+pi, 1);
% a=Show_prompt([Point(6).x+Point(6).r*cos(Point(6).ang0);Point(6).y+Point(6).r*sin(Point(6).ang0)], Point(6).ang0, 1);
% a=Show_prompt([Point(7).x+Point(7).r*cos(Point(7).ang0);Point(7).y+Point(7).r*sin(Point(7).ang0)], Point(7).ang0+pi, 1);
% a=Show_prompt([Point(8).x+Point(8).r*cos(Point(8).ang0);Point(8).y+Point(8).r*sin(Point(8).ang0)], Point(8).ang0, 1);
% a=Show_prompt([Point(9).x+Point(9).r*cos(Point(9).ang0);Point(9).y+Point(9).r*sin(Point(9).ang0)], Point(9).ang0, 1);
% a=Show_prompt([Point(10).x+Point(10).r*cos(Point(10).ang0);Point(10).y+Point(10).r*sin(Point(10).ang0)], Point(10).ang0+pi, 1);
a=Show_prompt([Point(Goal).x;Point(Goal).y], -pi/2, 0);
text(Point(Goal).x+15*cos(Point(Goal).ang0)-10,Point(Goal).y+15*sin(Point(Goal).ang0),'GOAL');

theta = 0:pi/100:2*pi;
plot(Point(2).x+Point(2).r*cos(theta), Point(2).y+Point(2).r*sin(theta), 'r'); 
plot(Point(3).x+Point(3).r*cos(theta), Point(3).y+Point(3).r*sin(theta), 'r');
plot(Point(4).x+Point(4).r*cos(theta), Point(4).y+Point(4).r*sin(theta), 'r');
% plot(Point(3).x+30*cos(theta), Point(3).y+30*sin(theta), 'b--');
% plot(Point(5).x+Point(5).r*cos(theta), Point(5).y+Point(5).r*sin(theta), 'r');
% plot(Point(7).x+Point(7).r*cos(theta), Point(7).y+Point(7).r*sin(theta), 'r');
% plot(Point(8).x+Point(8).r*cos(theta), Point(8).y+Point(8).r*sin(theta), 'r');
% plot(Point(8).x+35*cos(theta), Point(8).y+35*sin(theta), 'b--');
plot(Point(9).x+Point(9).r*cos(theta), Point(9).y+Point(9).r*sin(theta), 'r');
plot(Point(9).x+45*cos(theta), Point(9).y+45*sin(theta), 'b--');
plot(Point(10).x+Point(10).r*cos(theta), Point(10).y+Point(10).r*sin(theta), 'r');
plot(Point(11).x+Point(11).r*cos(theta), Point(11).y+Point(11).r*sin(theta), 'r');
plot(Point(11).x+2*Point(11).r*cos(theta), Point(11).y+2*Point(11).r*sin(theta), 'b--');
plot(Point(12).x+Point(12).r*cos(theta), Point(12).y+Point(12).r*sin(theta), 'r');
% plot(Point(12).x+35*cos(theta), Point(12).y+35*sin(theta), 'b--');
plot(Point(13).x+Point(13).r*cos(theta), Point(13).y+Point(13).r*sin(theta), 'r');
plot(Point(13).x+30*cos(theta), Point(13).y+30*sin(theta), 'b--');
plot(Point(13).x+35*cos(theta), Point(13).y+35*sin(theta), 'b--');
plot(Point(14).x+Point(14).r*cos(theta), Point(14).y+Point(14).r*sin(theta), 'r');
plot(Point(15).x+Point(15).r*cos(theta), Point(15).y+Point(15).r*sin(theta), 'r');
plot(Point(15).x+30*cos(theta), Point(15).y+30*sin(theta), 'b--');
plot(Point(15).x+35*cos(theta), Point(15).y+35*sin(theta), 'b--');
plot(Point(16).x+Point(16).r*cos(theta), Point(16).y+Point(16).r*sin(theta), 'r');
plot(Point(17).x+Point(17).r*cos(theta), Point(17).y+Point(17).r*sin(theta), 'r');
plot(Point(17).x+2*Point(17).r*cos(theta), Point(17).y+2*Point(17).r*sin(theta), 'b--');
plot(Point(18).x+Point(18).r*cos(theta), Point(18).y+Point(18).r*sin(theta), 'r');
plot(Point(19).x+Point(19).r*cos(theta), Point(19).y+Point(19).r*sin(theta), 'r');
plot(Point(19).x+1.5*Point(19).r*cos(theta), Point(19).y+1.5*Point(19).r*sin(theta), 'b--');
plot(Point(20).x+Point(20).r*cos(theta), Point(20).y+Point(20).r*sin(theta), 'r');
plot(Point(22).x+Point(22).r*cos(theta), Point(22).y+Point(22).r*sin(theta), 'r');
plot(Point(24).x+Point(24).r*cos(theta), Point(24).y+Point(24).r*sin(theta), 'r');
plot(Point(26).x+Point(26).r*cos(theta), Point(26).y+Point(26).r*sin(theta), 'r');
plot(Point(28).x+Point(28).r*cos(theta), Point(28).y+Point(28).r*sin(theta), 'r');
plot(Point(30).x+Point(30).r*cos(theta), Point(30).y+Point(30).r*sin(theta), 'r');
plot(Point(32).x+Point(32).r*cos(theta), Point(32).y+Point(32).r*sin(theta), 'r');
plot(390+40*cos(theta), 380+40*sin(theta), 'g--');
plot(Point(34).x+Point(34).r*cos(theta), Point(34).y+Point(34).r*sin(theta), 'r');
plot(Point(34).x+2*Point(34).r*cos(theta), Point(34).y+2*Point(34).r*sin(theta), 'b--');
plot(Point(35).x+Point(35).r*cos(theta), Point(35).y+Point(35).r*sin(theta), 'r');
plot(Point(36).x+Point(36).r*cos(theta), Point(36).y+Point(36).r*sin(theta), 'r');
plot(Point(36).x+2*Point(36).r*cos(theta), Point(36).y+2*Point(36).r*sin(theta), 'b--');
plot(Point(36).x+70*cos(theta), Point(36).y+70*sin(theta), 'b--');
plot(Point(37).x+Point(37).r*cos(theta), Point(37).y+Point(37).r*sin(theta), 'r');
plot(Point(38).x+Point(38).r*cos(theta), Point(38).y+Point(38).r*sin(theta), 'r');
plot(Point(39).x+Point(39).r*cos(theta), Point(39).y+Point(39).r*sin(theta), 'r');
plot(Point(40).x+Point(40).r*cos(theta), Point(40).y+Point(40).r*sin(theta), 'r');
plot(Point(41).x+Point(41).r*cos(theta), Point(41).y+Point(41).r*sin(theta), 'r');
plot(Point(42).x+Point(42).r*cos(theta), Point(42).y+Point(42).r*sin(theta), 'r');
plot(Point(43).x+Point(43).r*cos(theta), Point(43).y+Point(43).r*sin(theta), 'r');
plot(Point(44).x+Point(44).r*cos(theta), Point(44).y+Point(44).r*sin(theta), 'r');
plot(Point(45).x+Point(45).r*cos(theta), Point(45).y+Point(45).r*sin(theta), 'r');
plot(Point(46).x+Point(46).r*cos(theta), Point(46).y+Point(46).r*sin(theta), 'r');
plot(Point(47).x+Point(47).r*cos(theta), Point(47).y+Point(47).r*sin(theta), 'r');
plot(Point(48).x+Point(48).r*cos(theta), Point(48).y+Point(48).r*sin(theta), 'r');
plot(Point(50).x+Point(50).r*cos(theta), Point(50).y+Point(50).r*sin(theta), 'r');
plot(Point(52).x+Point(52).r*cos(theta), Point(52).y+Point(52).r*sin(theta), 'r');
plot(Point(54).x+Point(54).r*cos(theta), Point(54).y+Point(54).r*sin(theta), 'r');
plot(Point(55).x+Point(55).r*cos(theta), Point(55).y+Point(55).r*sin(theta), 'r');
plot(Point(56).x+Point(56).r*cos(theta), Point(56).y+Point(56).r*sin(theta), 'r');
plot(Point(57).x+Point(57).r*cos(theta), Point(57).y+Point(57).r*sin(theta), 'r');
plot(Point(58).x+Point(58).r*cos(theta), Point(58).y+Point(58).r*sin(theta), 'r');
plot(Point(60).x+Point(60).r*cos(theta), Point(60).y+Point(60).r*sin(theta), 'r');
plot(Point(61).x+Point(61).r*cos(theta), Point(61).y+Point(61).r*sin(theta), 'r');
% 
% nPoints = max(size(Point));
nPoints = 63;   % test
for ind = 1:nPoints
    switch Point(ind).dir
        case 0  % straight line
            tempPx0 = Point(ind).x;
            tempPy0 = Point(ind).y;
            if (ind==Goal) 
                tempPx1 = Point(1).x;
                tempPy1 = Point(1).y;
            else
                if (Point(ind+1).dir==0) 
                    tempPx1 = Point(ind+1).x;
                    tempPy1 = Point(ind+1).y;
                else 
                    tempPx1 = Point(ind+1).x+Point(ind+1).r*cos(Point(ind+1).ang0);
                    tempPy1 = Point(ind+1).y+Point(ind+1).r*sin(Point(ind+1).ang0);
                end;
            end;
            % resolution is 1cm
            tPoints = ceil(norm([tempPx0-tempPx1 tempPy0-tempPy1])); 
            %Find the length in cm  
            if (ind==1)
                xyCourse = [linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
            else
                xyCourse = [xyCourse;linspace(tempPx0, tempPx1, tPoints)' linspace(tempPy0, tempPy1, tPoints)'];
            end;
        case 1  % CCW arc
            if (Point(ind).ang1<Point(ind).ang0)
                Point(ind).ang1 = Point(ind).ang1+2*pi;
            end;
            tPoints = ceil(Point(ind).r*(Point(ind).ang1-Point(ind).ang0));
            dAngle = (Point(ind).ang1-Point(ind).ang0)/(tPoints-1); 
            angle = (Point(ind).ang0):dAngle:Point(ind).ang1;
            xyCourse = [xyCourse;(Point(ind).x+Point(ind).r*cos(angle))' (Point(ind).y+Point(ind).r*sin(angle))'];
        case -1 % CW arc
            if (Point(ind).ang1>Point(ind).ang0)
                Point(ind).ang1 = Point(ind).ang1-2*pi;
            end;
            tPoints = ceil(Point(ind).r*(Point(ind).ang0-Point(ind).ang1));
            dAngle = (Point(ind).ang1-Point(ind).ang0)/(tPoints-1); 
            angle = (Point(ind).ang0):dAngle:Point(ind).ang1;
            xyCourse = [xyCourse;(Point(ind).x+Point(ind).r*cos(angle))' (Point(ind).y+Point(ind).r*sin(angle))'];
    end;
    if (ind<nPoints)
        %Delete last row, the point will be recovered at the next plot 
        xyCourse(end,:) = [];	
    end;
end;

plot(xyCourse(:,1), xyCourse(:,2),'k', 'LineWidth',3);
axis([-50 685 -50 400]); grid;
set(gca,'DataAspectRatio',[1 1 1]);
set(gca,'FontSize',14);
title('2023 All Japan Robotrace contest', 'fontsize',18);
xlabel('Length in cm', 'fontsize',16);
ylabel('Length in cm', 'fontsize',16);hold;