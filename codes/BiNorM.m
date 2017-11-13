disp('good')
u = -3.5;
x = 0.6;
N = 100;
Coeff = 1;
result = 1;
for ii = 1:N
    Coeff = Coeff*(u-ii+1) / ii;
    result = result + Coeff * x^(ii);
end