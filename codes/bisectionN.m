﻿function roots = bisectionN(f, int, N)
x = linspace(int(1), int(2), N); % 划分区间
y = arrayfun(f, x); % 求所有 f(x(ii))
figure; plot(x, y, '.-') % 画图
title('f(x)')
Sign = sign(y);
ind = find(Sign(1:end-1) .* Sign(2:end) <= 0); % 找符合条件的区间序号
Nroot = numel(ind);
roots = zeros(1, Nroot); % 预赋值
for ii = 1:Nroot
    roots(ii) = fzero(fun, [x(ind(ii)),x(ind(ii)+1)]);  
end
end