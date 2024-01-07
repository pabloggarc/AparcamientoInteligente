% crear la red 
neuronas_capa1 = 10;
neuronas_capa2 = 5;
net = feedforwardnet([neuronas_capa1, neuronas_capa2]);

% Entrenar la red
net = configure(net, inputs', outputs');
net = train(net, inputs', outputs');

% Generar el bloque de Simulink
Ts = 0.1;  % Tiempo de muestreo
gensim(net, Ts);