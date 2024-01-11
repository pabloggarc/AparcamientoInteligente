clear all; 
clc; 

% Simulación
sim("ackerman_ROS_neural_controller_capture.slx"); 

% Recoger los datos
sonar_0_values = sonar_0.signals.values;
sonar_8_values = sonar_8.signals.values;
sonar_9_values = sonar_9.signals.values;
sonar_10_values = sonar_10.signals.values;
sonar_11_values = sonar_11.signals.values;
velocidad_lineal_values = velocidad.signals.values;
velocidad_angular_values = theta.signals.values;

% Matrices para la red
inputs = [sonar_0_values, sonar_8_values, sonar_9_values, sonar_10_values, sonar_11_values];
outputs = [velocidad_lineal_values, velocidad_angular_values];

% Guardar datos
save("datos_15.mat", "inputs", "outputs"); 