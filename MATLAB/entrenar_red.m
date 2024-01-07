% Carga de datos de entrenamiento
load("datos.mat"); 

% Elección del número de neuronas de la capa oculta
neuronas = floor(size(X, 1) * 0.15 * 0.75); 

% Creación de la red
net = feedforwardnet(neuronas);
net = configure(net, X', Y');

% Entrenamiento
net = train(net, X', Y');

% Guardar en local y Simulink
save("red.mat", "net"); 
gensim(net); 