function keplerRK4
% 参数设定
GM = 1; % 万有引力常数乘以中心天体质量
x0 = 1; y0 = 0; % 初始位置
vx0 = 0; vy0 = 0.7; % 初始速度
tspan = [0; 4]; % 总时间和步数
Nt = 100; % 步数

Y0 = [x0; y0; vx0; vy0]; % 因变量初值
f = @(Y, t)fun(Y, t, GM);
[Y,~] = odeRK4(f, tspan, Y0, Nt);

% 画图
figure; hold on;
plot(Y(1,:), Y(2,:));
scatter(0, 0);
axis equal;
end

function Y1 = fun(Y, ~, GM)
% 因变量
x = Y(1); y = Y(2);
vx = Y(3); vy = Y(4);
Y1 = zeros(4,1); % 预赋值
Y1(1) = vx;
Y1(2) = vy;
temp = -GM /(x^2 + y^2)^(3/2);
Y1(3) = temp * x;
Y1(4) = temp * y;
end
