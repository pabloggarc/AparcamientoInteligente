function [V,W] = function_conversion_steering_to_linear_angular(steering_wheel_angle, linear_vel_ackerman_kmh)

    %Aproximacion de angulo volante y velocidad linal a vel_linar y angular.
    % *************************************
    
    min_turning_radius_vehicle = 2;  % radio de giro del vehiculo. Radio minimo en el que gira 180 grados. 
    max_turning_radius_vehicle = 34; % radio de giro del vehiculo. Radio máximo con el volante girado 1º
    max_steering_wheel_angle = 90;  % angulo máximo de volante permitido (grados).
    max_vehicle_linear_speed = 30;  % velocidad máxima de vehiculo (km/h).
    
    
    % Filtrado des los valores máximos
    
    if steering_wheel_angle > max_steering_wheel_angle
        steering_wheel_angle = max_steering_wheel_angle;  
    end
    
    if steering_wheel_angle < (-1*max_steering_wheel_angle)
        steering_wheel_angle = max_steering_wheel_angle;  
    end
    
    if linear_vel_ackerman_kmh > max_vehicle_linear_speed
        linear_vel_ackerman_kmh = max_vehicle_linear_speed;
    end
    
    
    %Conversion a m/s
    linear_vel_ackerman_ms = linear_vel_ackerman_kmh/3.6; %(m/s)
    
    %Conversion a linear and angular velocity for the simulator.
    % v=rω --> ω = v/r
    
    % max_steering_wheel_angle -- > min_turning_radius_vehicle
    % steering_wheel_angle = 0 --> angular_vel_vehicle = 0;
    
    turning_radius = (max_turning_radius_vehicle-((max_turning_radius_vehicle-min_turning_radius_vehicle)/max_steering_wheel_angle)*abs(steering_wheel_angle));
    
    if steering_wheel_angle > 0
            turning_radius = turning_radius;
    elseif steering_wheel_angle < 0
            turning_radius = -1*turning_radius;
    end
    
    if steering_wheel_angle == 0
        angular_vel_vehicle = 0;
    else
        angular_vel_vehicle = linear_vel_ackerman_ms / turning_radius;
    end
    
    %Sin velocidad linear, tampoco debe girar
    
    if linear_vel_ackerman_ms == 0
        angular_vel_vehicle = 0;
    end
    
    
    %Rellenamos los campos del mensaje V y W
    V= linear_vel_ackerman_ms;

    W=angular_vel_vehicle;
    
    
    %********************************************************

