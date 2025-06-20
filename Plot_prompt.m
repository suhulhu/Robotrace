function Pcenter = Plot_prompt(center, angle)
% center is a 2x1 column vector to specify where to put the prompt
% angle  specfified the orientation that one section of the course connects to the other 
promptX = [2  2 -2 -2 2];
promptY = [1 -1 -1  1 1];

Pcenter = center + 7*[cos(angle);sin(angle)];
Rot = [cos(angle) -sin(angle);sin(angle) cos(angle)];
promptXY= Rot*[promptX;promptY];
plot(promptXY(1,:)+Pcenter(1),promptXY(2,:)+Pcenter(2),'r');
end

