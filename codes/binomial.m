% 验证二项式定理(非整数幂)
u = -3.5; % 幂
x = 0.6; % |x|<1 使级数收敛
N = 100; % 求和项数
Coeff = 1; % x^ii 项前面的系数
result = 1; % 求和结果
for ii = 1:N
    % 由 x^(ii-1) 项系数计算 x^ii 项系数
    Coeff = Coeff*(u-ii+1) / ii; 
    % 将 x^(ii-1) 项累加到求和结果上
    result = result + Coeff * x^ii; 
end
disp('求和结果为')
disp(result)
format short % 恢复默认显示
disp('精确结果为')
format long % 显示全部小数位
disp((1+x)^u)
