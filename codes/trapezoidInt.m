% 梯形法数值积分
% f 是被积函数的函数句柄
% [a, b] 为积分区间
% N 为子区间个数
function I = trapezoidInt(f, a, b, N)
x = linspace(a, b, N+1);
y = arrayfun(f, x); % 求所有 y(i) = f(x(i))
h = (b - a)/N;
I = h*(0.5*y(1) + 0.5*y(N+1) + sum(y(2:N)));
end
