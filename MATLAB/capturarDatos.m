
%% bloque para capturar datos
%tengo q hacer aqui 2 matrices , una de sonars (INPUT) y otra de vel y
%theta (OUTPUT)
%una vez que tenga las 2 matrices habria que juntarlas y mandarles a la
%red:
%3. Generar la red con la configuración deseada  net = feedforwardnet([neuronas_capa1, neuronas_capa2,… ]); 
%4. Entrenar la red  net = configure(net,inputs,outputs); net = train(net,inputs,outputs);  
%5. Generar el bloque de Simulink con la red entrenada para probar su funcionamiento en el simulador.  gensim(net,Ts)  

% Suponiendo que 'simout' contiene los resultados de la
% simulación/ejecucion

% Obtener valores de los sensores
sonar_0_values = simout.get('sonar_0').signals.values;
sonar_8_values = simout.get('sonar_8').signals.values;
sonar_9_values = simout.get('sonar_9').signals.values;
sonar_10_values = simout.get('sonar_10').signals.values;
sonar_11_values = simout.get('sonar_11').signals.values;

% Construir la matriz de entrada (sonars)
inputs = [sonar_0_values, sonar_8_values, sonar_9_values, sonar_10_values, sonar_11_values];

% Obtener valores de velocidad lineal y ángulo del volante
velocidad_lineal_values = simout.get('velocidad').signals.values;
velocidad_angular_values = simout.get('theta').signals.values;

% Construir la matriz de salida (velocidad y ángulo del volante)
outputs = [velocidad_lineal_values, velocidad_angular_values];

% Ajustar posibles valores infinitos
inputs(isinf(inputs)) = 5.0;  % Reemplazar infinitos con un valor específico
inputs = double(inputs);
outputs = double(outputs);

%% empezamos otro bloque exclusivo de la red

% 3. Generar la red con la configuración deseada
neuronas_capa1 = 10;
neuronas_capa2 = 5;
net = feedforwardnet([neuronas_capa1, neuronas_capa2]);

% 4. Entrenar la red
net = configure(net, inputs', outputs');
net = train(net, inputs', outputs');

% 5. Generar el bloque de Simulink
Ts = 0.1;  % Tiempo de muestreo
gensim(net, Ts);

%% bloque para llamar al slx
%aqui lo hago es que se guarde en una variable todas las out.blabla
%llamar al slx
sim('ackerman_ROS_neural_controller.slx')
