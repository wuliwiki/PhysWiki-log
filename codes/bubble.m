% 冒泡法排序
function [x, order] = bubble(x, option)
N = numel(x); % 数列个数
order = 1:N; % 索引
changed = 1; % 是否有置换
while(changed == 1)
    changed = 0;
    for ii = 1:N-1
        if x(ii) > x(ii + 1)
            % 置换
            changed = 1;
            temp = x(ii);
            x(ii) = x(ii + 1);
            x(ii + 1) = temp;
            temp = order(ii);
            order(ii) = order(ii + 1);
            order(ii + 1) = temp;
        end
    end
end
% 是否是降序排列
if nargin > 1 && option(1) == 'd'
    x(:) = flipud(x(:));
    order = fliplr(order);
end
end
