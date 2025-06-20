function Pcenter = Show_prompt(center, angle, mode)
% center: a 2x1 column vector to specify where to put the prompt
% angle : specify the orientation that one section of the course connects to the other
% mode  : 1 for curvature change, 0 for Start/Stop
promptX = [2  2 -2 -2];
promptY = [1 -1 -1  1];

Pcenter = center + 7*[cos(angle);sin(angle)];
Rot = [cos(angle) -sin(angle);sin(angle) cos(angle)];
promptXY= Rot*[promptX;promptY];
pgon=polyshape(promptXY(1,:)+Pcenter(1),promptXY(2,:)+Pcenter(2));
if (mode==0) 
    plot(pgon,'FaceColor','black','EdgeColor','black','FaceAlpha',0.9);
else
    plot(pgon,'FaceColor','red','EdgeColor','red','FaceAlpha',0.9);
end;
end

