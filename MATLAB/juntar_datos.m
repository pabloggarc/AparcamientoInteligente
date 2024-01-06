X = []; 
Y = []; 

for i = 1:10
    load(strcat("datos_", num2str(i), ".mat")); 
    X = [X; inputs]; 
    Y = [Y; outputs]; 
end

X = double(X); 
Y = double(Y); 

save("datos.mat", "X", "Y"); 