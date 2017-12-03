w0 = 1;
w = linspace(0.0001, 3, 200);
m = 1;
a = 0.5;

plot(w, 1./sqrt((w.^2 - w0^2).^2 + a^2*w.^2));
figure;
plot(w, atan2(-a*w, m*(w0^2 - w.^2)));