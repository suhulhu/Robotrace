%
h = plot([2 2 -2 -2 2],[1 -1 -1 1 1]);
axis('equal')
axis([-5 15 -5 15])
grid;
hold
plot(5,0,'ro');
a=Show_prompt([5;0],pi/4,0);
plot([5 a(1)],[0 a(2)],'r');
plot(a(1),a(2),'ro');
a=Show_prompt([5;0],pi/2,1);
plot([5 a(1)],[0 a(2)],'k');
plot(a(1),a(2),'ko');
hold;