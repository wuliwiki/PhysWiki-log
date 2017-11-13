setfigure blank
axis([-8,8,-8,8]);
x=linspace(-8,8,800);
y1=sinh(x);
y2=cosh(x);
y3=tanh(x);
FineAxes(-8,8,-8,8,-6:6,-6:6);
FinePlot([x',y1'],0.1,'facecolor','r','facealpha',0.7);
FinePlot([x',y2'],0.1,'facecolor','g','facealpha',0.7);
FinePlot([x',y3'],0.1,'facecolor','b','facealpha',0.7);