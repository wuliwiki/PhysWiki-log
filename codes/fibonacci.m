a1 = 1; disp(a1); 
a2 = 1; disp(a2);
a3 = a1 + a2;
while a3 <= 100
    disp(a3);
    a1 = a2;
    a2 = a3;
    a3 = a1 + a2;
end
