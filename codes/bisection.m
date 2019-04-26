% 二分法求函数的根
function x = bisection(f, int, err)
fl = f(int(1)); fr = f(int(2));
% 两端点是否为 0
if fl == 0
    x = int(1); return;
elseif fr == 0
    x = int(2); return;
end
% 两端点是否同号
if fl * fr > 0
    error('两端点同号');
end
% 主循环
while(int(2) - int(1) > err)
    mid = 0.5*(int(1) + int(2));
    fm = f(mid);
    if fm * fl > 0
        int(1) = mid;
    elseif fm * fr > 0
        int(2) = mid;
    else % fm = 0
        break;
    end
end
x = mid;
end
