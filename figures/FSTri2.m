l = 1; Nx = 300;
x = linspace(-l,l,Nx);
figure;
for ii = 0:2
    subplot(1,3,ii+1);
    plot(x,cos(ii*pi*x/l));
    grid on;
end
figure;
for ii = 1:3
    subplot(1,3,ii);
    plot(x,sin(ii*pi*x/l));
    grid on;
end