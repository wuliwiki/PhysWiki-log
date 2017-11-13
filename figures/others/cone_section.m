%圆锥曲线极坐标中的定义
theta=linspace(0,2*pi,366);
setfigure blank;
for e=[0.4 0.8 0.9 0.94 1 1.2  1.6 2.8]
    r=e./(1-e.*cos(theta));
    r(r<0)=nan;
    x=r.*cos(theta); y=r.*sin(theta);
    plot(x,y);
end
FineAxes(-3,18,-8,8,[-1 10],[5]);
