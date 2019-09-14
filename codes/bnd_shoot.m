% 求解一维定态薛定谔方程的能级
% 从两端试射
% varargin 是 ode45 解算器的选项
% Eng(i) 是第 i 个能级的能量
% psi(:,i) 是第 i 个能级的波函数
function [Eng, X, Psi] = bnd_shoot(V, xmin, xmid, xmax, mass, ...
    Espan, EResolution, odeOpt, plot_flag)

% 多区间二分法解出能级和波函数
trial_fun = @(E) bound_shooting_trial(E, V, xmin, xmid, xmax, mass, odeOpt);
Eng = fzeroN(trial_fun, Espan, EResolution);

% 输出， 检查节点个数
X = cell(1,numel(Eng)); Psi = X;
for i = 1:numel(Eng)
    [~, X{i}, Psi{i}] = trial_fun(Eng(i));
    if numzero(Psi{i}) > i - 1
        warning(['missed bound state ', num2str(i),...
            ', increase Eresolution!']);
    elseif numzero(Psi{i}) < i - 1
        error('duplicate bound state found!');
    end
    
    if plot_flag
        x = X{i}; psi = Psi{i};
        figure; plot(x,psi); axis([x(1),x(end),-1.2,1.2]);
        hold on;
        xlabel('x'); ylabel('\psi(x)');
        Nzeros = numzero(psi);
        title(['i = ', num2str(i),...
            ', E_{', num2str(Nzeros+1), '} = ',  num2str(Eng(i))]);
        scatter(xmid,0);
    end
end
end

% 单个能量试射
% 输出误差函数和其他信息
function [err, x, psi, th1, th2] = bound_shooting_trial(E, V, ...
	xmin, xmid, xmax, mass, odeOpt)
dy = 1e-16; % dy = psi(xmin) 和 psi(xmax)
[x1, Y1] = bound_shooting_left(E, V, [xmin,xmid], mass, dy, odeOpt);
[x2, Y2] = bound_shooting_right(E, V, [xmax,xmid], mass, dy, odeOpt);

% 误差
[err, th1, th2] = fmatch_err(Y1(end,1),Y1(end,2),Y2(end,1),Y2(end,2));

psi1_max = max(abs(Y1(:,1)));
psi2_max = max(abs(Y2(:,1)));

% 波函数 (max(psi) = 1)
if nargout > 1
    x = [x1; flip(x2(1:end-1))].';
end
if nargout > 2
    v1 = Y1(end,:);
    v2 = Y2(end,:);
    scale = sign(dot(v1,v2))*norm(v1)/norm(v2);
    if psi1_max >= psi2_max * abs(scale)
        psi = [
            Y1(:,1).' / psi1_max,  .....
            flip(Y2(1:end-1,1)).' * (scale / psi1_max)];
    else
        psi = [
            Y1(:,1).' / (scale * psi2_max),  .....
            flip(Y2(1:end-1,1)).' / psi2_max];
    end
end
end

% 从左边入射（使用 ode45 解算器）
function [x, Y] = bound_shooting_left(E, V, xspan, mass, dy, odeOpt)
if V(xspan(1)) > E
    Y0 = [1; sqrt(2*mass*(V(xspan(1)) - E))] * dy;
else
    warning('起始点 E > V， 确定吗?');
    Y0 = [0; 1];
end
odefun = @(x,Y) TISE_odefun(x,Y,E,V,mass);
[x,Y] = ode45(odefun, xspan, Y0, odeOpt);
end

% 从右边入射
function [x, Y] = bound_shooting_right(E, V, xspan, mass, dy, odeOpt)
if V(xspan(1)) > E
    Y0 = [1; -sqrt(2*mass*(V(xspan(1)) - E))] * dy;
else
    warning('起始点 E > V， 确定吗?');
    Y0 = [0; 1];
end
odefun = @(x,Y) TISE_odefun(x,Y,E,V,mass);
[x,Y] = ode45(odefun, xspan, Y0, odeOpt);
end

% ode 函数
% 由 Y = [psi(x); psi'(x)] 求 dY(x) = [psi'(x), psi''(x)]
function dY =TISE_odefun(x,Y,E,V,mass)
dY(2,1) = 2*mass*(V(x)-E)*Y(1);
dY(1) = Y(2);
end

% 多区间二分法求函数零点
function roots = fzeroN(fun,interval,resolution,converge,options)
if ~exist('converge','var') || isempty(converge)
    converge = false;
end
if ~exist('options','var')
    options = optimset;
end
x=linspace(interval(1),interval(end), resolution);
y=arrayfun(fun,x);
figure; plot(x,y,'.-'); hold on;
title('the function to be found zeros of');
[Nind, ind] = numzero(y);

roots=zeros(1, Nind); kk = 0;
for ii=1:Nind
    plot([x(ind(ii)),x(ind(ii)+1)], ...
        [fun(x(ind(ii))),fun(x(ind(ii)+1))], '.-r');
    root = fzero(fun,[x(ind(ii)),x(ind(ii)+1)], options);
    if ~converge || converge && iszero(fun,root,options.TolX)
        kk = kk + 1;
        roots(kk) = root;
        scatter(root, fun(root), 'b');
    end
end
roots = roots(1:kk);
end

% 计算两函数在某点匹配的误差
function [err, th1, th2] = fmatch_err(y1,dy1,y2,dy2)
th1 = atan2(y1,dy1);
th2 = atan2(y2,dy2);
err = mod(th2 - th1, 2*pi);
if err > 0.5*pi && err <= 1.5*pi
    err = pi - err;
elseif err > 1.5*pi
    err = -2*pi + err;
end
end

% 数函数的零点
function [N, ind] = numzero(y)
Sign=sign(y);
ind=find(Sign(1:end-1).*Sign(2:end)<0);
N = numel(ind);
end
