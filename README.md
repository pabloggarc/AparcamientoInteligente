# Aparcamiento Inteligente
Proyecto para la práctica final de la asignatura de [Sistemas de Control Inteligente](https://www.uah.es/es/estudios/estudios-oficiales/grados/asignatura/Sistemas-de-Control-Inteligente-781005/) en la Universidad de Alcalá. Consiste en el aparcamiento automático de un vehículo mediante técnicas de lógica borrosa y redes neuronales. 

## Software
En la carpeta `STDR` se encuentran los ficheros necesarios para ejecutar la simulación en STDR en un sistema ROS. La versión de MATLAB y Simulink utilizada por los alumnos para el desarrollo ha sido la 2023b con todas las toolboxes instaladas. 

## Lógica borrosa
En la carpeta `MATLAB` se encuentran los siguientes ficheros con los que se consigue realizar el aparcamiento de manera automática utilizando lógica borrosa: 
* `ackerman_ROS_controller_v2.slx`: modelo de Simulink del robot empleando un controlador borroso
* `controlador_borroso.fis`: controlador borroso
* `ackerman_ROS_neural_controller_capture.slx`: modelo de Simulink empleando un controlador borroso con captura de datos

## Redes neuronales
En la carpeta `MATLAB` se encuentran los siguientes ficheros con los que se consigue realizar el aparcamiento de manera automática utilizando una red neuronal: 
* `ackerman_ROS_neural_network.slx`: modelo de Simulink del robot empleando un controlador neuronal
* `capturar_datos.m`: script para capturar los datos de una ejecución borrosa, para posteriormente entrenar la red
* `juntar_datos.m`: script para juntar en un único dataset los datos capturados en diferentes ejecuciones borrosas
* `entrenar_red.m`: script para entrenar una red neuronal con los datos recogidos y generar el correspondiente bloque de Simulink
* `datos.mat`: datos utilizados para entrenar la red neuronal
* `red.mat`: red entrenada y datos del entrenamiento

## Presentación y vídeo demostrativo
En el siguiente [vídeo](https://www.youtube.com/watch?v=eeD3QPlOSJA) se puede visualizar una breve explicación de la práctica y verificar el correcto funcionamiento de ambos controladores realizando el aparcamiento. 