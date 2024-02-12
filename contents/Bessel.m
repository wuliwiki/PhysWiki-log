%Plot the first few Bessel functions and Numann functions

close all;
x=linspace(0,15,300);
figure; hold on; grid on;
for ii=0:3
    y1=besselj(ii,x);
    plot(x,y1)
end
axis([0,15,-0.5,1]);
figure; hold on; grid on;
for ii=0:3
    y2=bessely(ii,x);
    plot(x,y2)
end
axis([0,15,-0.8,0.7]);