% 参数设定
m = 0.1; % 质量
k = 1; % 劲度系数
a = 0.03; % 阻尼系数
T = 20; % 停止时间
Nstep = 10000; % 步数
A = 2; w = 3; % f(t)=A*sin(w*t);

dt = T/Nstep; % 计算步长
y2 = zeros(step,1); y1 = y2; y = y2; % 矩阵预赋值
y(1) = 0; y1(1) = 0; % 初值, y1 是 y 的一阶导数

% 迭代循环
for ii = 2:step
    y2(ii) = (-a*y1(ii)-k*y(ii)+2*sin(w*(ii*dt)))/m; % 代入微分方程求出 y''.
    y(ii) = y(ii-1) + y1(ii-1)*dt; % y 的微分近似
    y1(ii) = y1(ii-1) + y2(ii-1)*dt; % y' 的微分近似
end

% 画图
t=(0:step-1)*dt;
plot(t,y);
