% Der
close all; figure;
x = linspace(-pi,pi,300); y = sin(x);
x0 = pi/3; k = cos(x0);
subplot(1,3,1); plot(x,y); hold on; plot(x,k*(x-x0)+sin(x0));  axis([min(x),max(x),-1.5,1.5]);
x = linspace(x0-0.5,x0+0.5,300); y = sin(x);
subplot(1,3,2); plot(x,y); hold on; plot(x,k*(x-x0)+sin(x0));  axis([min(x),max(x),0.5,1.1]);
x = linspace(x0-0.1,x0+0.1,300); y = sin(x);
subplot(1,3,3); plot(x,y); hold on; plot(x,k*(x-x0)+sin(x0));  axis([min(x),max(x),0.8,0.92]);