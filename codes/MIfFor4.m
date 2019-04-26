Nx = 5;
x = zeros(1,Nx);  % 预赋值
x(1) = 2;
for ii = 2:numel(x)
    x(ii) = x(ii-1)^2;
end
disp(['x = ' num2str(x)])
