function [Y, t] = odeRK4(f, tspan, Y0, Nt)
Nvar = numel(Y0);  % 因变量的个数
dt = (tspan(2) - tspan(1)) / (Nt-1); % 计算步长
Y = zeros(Nvar, Nt); % 预赋值
Y(:, 1) = Y0(:); % 初值
t = linspace(tspan(1), tspan(2), Nt);

for ii=1:Nt-1
    K1 = f(Y(:,ii)          , t(ii)      );
    K2 = f(Y(:,ii)+K1*dt/2  , t(ii)+dt/2 );
    K3 = f(Y(:,ii)+K2*dt/2  , t(ii)+dt/2 );
    K4 = f(Y(:,ii)+K3*dt    , t(ii)+dt   );
    Y(:,ii+1) = Y(:,ii) + dt/6 * (K1+2*K2+2*K3+K4);
end
end
