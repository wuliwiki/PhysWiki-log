% demonstrate Taylor Expansion by summing finite terms
%close all;
Nx = 300;
x = linspace(-2*pi,2*pi,Nx);
N = 21; % # of terms to sum
y = zeros(size(x));
Sign = -1;
for n = 1:2:N
    Sign = -Sign;
    y = y + Sign* 1/factorial(n)*x.^(n);
end

figure; plot(x,sin(x)); hold on; plot(x,y);
xlabel('x'); ylabel('y'); title(['N=' num2str(N)]);
axis([x(1),x(end),-2,2]);