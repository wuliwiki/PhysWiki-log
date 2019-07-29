% 验证二项式定理(非整数幂)
u = -3.5;
x = 0.6; % |x|<1 使级数收敛
N = 100; % 求和项数
Coeff = 1; % x^ii 项前面的系数
result = 1; % 求和结果
for ii = 1:N
    Coeff = Coeff*(u-ii+1) / ii;
    result = result + Coeff * x^(ii);
end
disp('直接计算结果为')
format long % 显示全部小数位
disp((1+x)^u)
disp('求和结果为')
disp(result)
format short % 恢复默认显示

% 测试函数颜色（必须是黑色）
tan; cot; asin; acos; atan; arg; real; imag; sum;
mean; diff; floor; ceil; mod; sinh; cosh; round;
tanh; zeros; ones; rand; randn; eye; magic;
