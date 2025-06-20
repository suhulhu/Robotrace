%
h1 = plot([2 2 -2 -2 2],[1 -1 -1 1 1],'k');
axis('equal')
axis([-5 15 -5 15])
grid;
hold
h2 = plot(0,0,'ko');
pause;
delete(h1);
delete(h2);
h1 = plot([2 2 -2 -2 2]+5,[1 -1 -1 1 1],'r');
h2 = plot(5,0,'ro');
hold;