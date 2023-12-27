%avanzar_ackerman

[vel_lineal, vel_angular] = function_conversion_steering_to_linear_angular(steering_wheel_angle, vel_lineal_ackerman_kmh);

%Rellenamos los campos del mensaje 
msg_vel.Linear.X=vel_lineal;
msg_vel.Linear.Y=0;
msg_vel.Linear.Z=0;
msg_vel.Angular.X=0;
msg_vel.Angular.Y=0;
msg_vel.Angular.Z=vel_angular;


%Leemos la primera posici�n
initpos=sub_odom.LatestMessage.Pose.Pose.Position;

%Bucle de control infinito
while(1)
    %Obtenemos la posici�n actual
    pos=sub_odom.LatestMessage.Pose.Pose.Position;
    %disp(sprintf('\nPosicion actual: X=%f,   Y=%f',pos.X,pos.Y));
    
    %Calculamos la distancia eucl�dea que se ha desplazado
    dist=sqrt((initpos.X-pos.X)^2+(initpos.Y-pos.Y)^2);
    %disp(sprintf('\tDistancia avanzada: %f',dist));

    
    %Si hemos avanzado dos metros, detenemos el robot y salimos del bucle
    if (dist>distancia)
        msg_vel.Linear.X=0;
        msg_vel.Angular.Z=0;
        send(pub_vel,msg_vel);
        break;
    else
        send(pub_vel,msg_vel);
    end
    %lee_sensores;
    %vfh_dir;
    msg_vel.Linear.X;
    msg_vel.Angular.Z;

   %disp(sprintf('Velocidad actual: V=%f,   W=%f',msg_vel.Linear.X, msg_vel.Linear.Z));


    x=pos.X;
    y=pos.Y;
    ori=sub_odom.LatestMessage.Pose.Pose.Orientation;    
    theta=quat2eul([ori.W ori.X ori.Y ori.Z]);
    theta=theta(1);       
    s0= sonar_0.LatestMessage.Range_;
    s1= sonar_1.LatestMessage.Range_;
    s2= sonar_2.LatestMessage.Range_;
    s3= sonar_3.LatestMessage.Range_;
    s4= sonar_4.LatestMessage.Range_;
    s5= sonar_5.LatestMessage.Range_;
    s6= sonar_6.LatestMessage.Range_;
    s7= sonar_7.LatestMessage.Range_;
    s8= sonar_8.LatestMessage.Range_;
    s9= sonar_9.LatestMessage.Range_;
    s10= sonar_10.LatestMessage.Range_;
    s11= sonar_11.LatestMessage.Range_;
        
    medidas_sonar = [s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11];
    medidas_sonar(isinf(medidas_sonar)) = 5.0;

    training_data=[training_data;[medidas_sonar,x,y,theta,msg_vel.Angular.Z,msg_vel.Linear.X, steering_wheel_angle, vel_lineal_ackerman_kmh]];
%          training=[training;[medidas_sonar,x,y,theta,vel_angular,vel_lineal, steering_wheel_angle, vel_lineal_ackerman_kmh]];


    waitfor(r);
end