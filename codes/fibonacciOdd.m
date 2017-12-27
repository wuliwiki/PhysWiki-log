a1 = 1; a2 = 1;
disp(a1); disp(a2);
a3 = a1 + a2;
while 1
    a1 = a2;
    a2 = a3;
    a3 = a1 + a2;
    if a3 > 100
        break;
    elseif mod(a3, 2) == 0
        continue;
    end
    disp(a3);
end
