% 高斯消元法得到梯形系数矩阵
% 显示每个行变换的操作和结果
% A 为任意尺寸的矩阵
% 如果 A 是增广矩阵， 输入 augmented = true， 如果 A 是系数矩阵， augmented = false
% 输出的 A 是梯形矩阵， q 是一个行矢量， q(ii) 是第 ii 行第一个不为零的列标
% 如果第 ii 行全为零， 则 q(ii) = 0

function [A, q] = GaussEli(A, augmented)
% 系数矩阵的行数 Nr 和列数 Nc
[Nr, Nc] = size(A);
if (augmented)
	Nc = Nc - 1;
end
q = zeros(1,Nr); q(1) = 1;
disp(A);
for ii = 1:Nr-1
	% 处理第 ii 行
	if (ii > 1)
		q(ii) = q(ii - 1) + 1;
	end
	for jj = q(ii) : Nc
		% 检查第 jj 列
		if (max(abs(A(ii:end, q(ii)))) > 0)
			% 消元使 A(ii+1:end, q(ii)) 全为 0
            A = eli1(A, ii, q(ii));
            break;
		else
			% 不需要消元，检查下一列
            if (q(ii) < Nc)
                q(ii) = q(ii) + 1;
            else
                return;
            end
        end
    end
end
end

% 做行变换使 A(ii+1:end, q) 全为 0
% A(ii:end,q) 不能全为 0
function A = eli1(A, ii, q)
% 交换两行，使 A(ii,q) 在 A(ii:end, q) 中最大
[~, iimax] = max(abs(A(ii:end, q)));
iimax = ii + iimax - 1;
if (iimax > ii)
    disp(['交换: r_', num2str(ii), ' <-> r_', num2str(iimax)]);
    temp = A(ii,:);
    A(ii,:) = A(iimax,:);
    A(iimax,:) = temp;
    disp(A);
end

% 用第 ii 行消去所有 A(ii+1:end, q)
for jj = ii+1 : size(A,1)
    if (A(jj,q) == 0)
        continue;
    end
    k = -A(jj,q)/A(ii,q);
    disp(['消元: ', num2str(k), ' * r_', num2str(ii), ' + r_', num2str(jj)]);
    A(jj,:) = A(ii,:) * k + A(jj,:);
    disp(A);
end
end