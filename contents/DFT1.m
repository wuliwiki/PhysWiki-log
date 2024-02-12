% demonstrate how 0 padding fft can replace sinc interpolation
close all;
N = 16; N1 = 16*N;
Lx = 4; dx = Lx/N;
Lk = 2*pi*N/Lx; dk = Lk/N;

x = linspace(-0.5*Lx, 0.5*Lx, N+1); x = x(1:end-1);
k = linspace(-0.5*Lk, 0.5*Lk, N+1); k = k(1:end-1);
x1 = linspace(-2*Lx, 2*Lx, N1+1); x1 = x1(1:end-1);
k1 = linspace(-2*Lk, 2*Lk, N1+1); k1 = k1(1:end-1);

f = 1 : N;
f1 = sinc_interp(x1, x, f);
figure(1); plot(x, real(f), '.'); hold on;
plot(x1, real(f1));

g = fftshift(fft(fftshift(f)))*dx/sqrt(2*pi);
figure(2); plot(k, real(g), '.'); hold on; plot(k, imag(g), '.');

% just 0-padding for g
g2 = [zeros(1, 1.5*N), g, zeros(1, 1.5*N)];
f2 = fftshift(ifft(fftshift(g2)))*dk/sqrt(2*pi)*(4*N);
x2 = linspace(-0.5*Lx, 0.5*Lx, 4*N+1); x2 = x2(1:end-1);
figure(1); plot(x2, real(f2)); plot(x2, imag(f2));

% first 0-padding for x then for g
f3 = [zeros(1, 1.5*N), f, zeros(1, 1.5*N)];
g3 = fftshift(fft(fftshift(f3)))*dx/sqrt(2*pi);
g4 = [zeros(1, 6*N), g3, zeros(1, 6*N)];
f4 = fftshift(ifft(fftshift(g4)))*dk/sqrt(2*pi)*(4*N);
figure(1); plot(x1, real(f4)); plot(x1, imag(f4));
