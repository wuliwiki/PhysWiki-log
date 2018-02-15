a = rand(1,1);
if a > 0.9
    disp('a in (0.9, 1]');
elseif a > 0.6
    disp('a in (0.6, 0.9]');
elseif a > 0.3
    disp('a in (0.3, 0.6]');
else
    disp('a in [0, 0.3]');
end
