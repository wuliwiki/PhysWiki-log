close all;
% =====  设置参数  ========
V = @(x) 0.5*x.*x; % 势能
mass = 1; % 质量
xmin = -10; xmid = 0; xmax = 10; % 端点和中点
Espan = [0.1, 10]; % 能量区间
Eresolution = 100; % 二分法区间数
NstepMin = 1000; % ode 解算器最少步数
% =======================

% 画势能曲线
x = linspace(xmin, xmax, 1000);
figure; plot(x, V(x));
xlabel x; title V;

[Eng, X, Psi] = bnd_shoot(V, xmin, xmid, xmax, mass, Espan, ....
    Eresolution, odeset('RelTol',1e-6, 'MaxStep',abs(xmax-xmin)/NstepMin),...
    true);
