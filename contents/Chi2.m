x = linspace(eps, 20, 10000);
dx = x(2) - x(1);
figure;
for k = 1:5
    A = 1/ (2^(k/2)*gamma(k/2));
    y = A* x.^(k/2-1) .* exp(-x/2);
    plot(x, y); hold on;
    disp(sum(x.^2 .* y) * dx - k^2);
end
axis([0, 20, 0, 1]);
legend({'k=1', 'k=2', 'k=3', 'k=4', 'k=5'});
xlabel x;
