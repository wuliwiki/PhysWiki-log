function y =  myfun(x, A, phi, y0)
if nargin < 4
    y0 = 0;
    if nargin < 3
        phi = 0;
        if nargin < 2
            A = 1;
        end
    end
end
y = A*cos(x + phi) + y0;
end
