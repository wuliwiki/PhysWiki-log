close all;
a = 0.05;
k = 5;
x = linspace(-12, 12, 600);
y = exp(-a*x.^2).*exp(1i*k*x);
figure; plot(x, real(y));
hold on; plot(x, imag(y));
axis([-12, 12, -1.2, 1.2]);