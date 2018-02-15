f = @(x) x^2 + 1/x;
x = [1,2; 3,4];
ans = zeros(size(x));
for ii = 1:numel(x)
    ans(ii) = f(x(ii));
end
