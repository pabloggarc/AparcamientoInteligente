  function Key_Down(src,event)

global steering_wheel_angle;
global vel_lineal_ackerman_kmh;
global Error_dist;
global Error_ang;

global incAngular;
global incLineal;
global steering_wheel_angle_max;
global vel_lineal_ackerman_kmh_max;
global stop

  if(strcmp(event.Key,'rightarrow'))
     steering_wheel_angle= max(steering_wheel_angle - incAngular, -steering_wheel_angle_max);
  end
  if(strcmp(event.Key,'leftarrow'))
     steering_wheel_angle= min(steering_wheel_angle + incAngular, steering_wheel_angle_max);
  end
    if(strcmp(event.Key,'downarrow'))
     vel_lineal_ackerman_kmh= max(vel_lineal_ackerman_kmh - incLineal, -vel_lineal_ackerman_kmh_max);
  end
  if(strcmp(event.Key,'uparrow'))
     vel_lineal_ackerman_kmh= min(vel_lineal_ackerman_kmh + incLineal, vel_lineal_ackerman_kmh_max);
  end
  if(strcmp(event.Key,'space'))
     stop = 1;
  end
  
  
  if (abs(steering_wheel_angle)<1e-12)
  steering_wheel_angle = 0.0;
  end
    if (abs(vel_lineal_ackerman_kmh)<1e-12)
  vel_lineal_ackerman_kmh = 0.0;
    end
  
%   disp(sprintf('Vel lineal %g m/s | Vel angular %g rad/s', vel_lineal, vel_angular)) 
  clf
%   subplot(2,1,1)
%   set(gca,'visible','off')
%   t = text(0.1,0.9,'Manten el foco en esta ventana','HorizontalAlignment','left');
%   t.FontSize = 16;
%   
%   t = text(0.1,0.8,'- Pulsa Flechas ARRIBA/ABAJO para modificar V en 0.1 m/s','HorizontalAlignment','left');
%   t.FontSize = 13;
%   t = text(0.1,0.7,'- Pulsa Flechas IZQUIERDA/DERECHA para modificar W en 0. rad/s','HorizontalAlignment','left');
%   t.FontSize = 13;
%   t = text(0.1,0.6,'- Pulsa ESPACIO para finalizar','HorizontalAlignment','left');
%   t.FontSize = 13;
% 
%   t = text(0.1,0.4,sprintf('Vel lineal actual %g m/s | Vel angular actual %g rad/s', vel_lineal_ackerman_kmh, steering_wheel_angle),'HorizontalAlignment','left');
%   t.FontSize = 14;


subplot(2,1,1)
  set(gca,'visible','off')

  t = text(0.05,0.95,'Manten el foco en esta ventana','HorizontalAlignment','left');
  t.FontSize = 16;
  
  t = text(0.05,0.8,'- Cada pulsacion de las teclas incrementa/decrementa:','HorizontalAlignment','left');
  t.FontSize = 14;

  t = text(0.1,0.65,'- ARRIBA / ABAJO -> incrementa/decrementa V','HorizontalAlignment','left');
  t.FontSize = 14;
  t = text(0.1,0.5,'- IZQUIERDA / DERECHA ->incrementa/decrementa Angulo volante','HorizontalAlignment','left');
  t.FontSize = 14;
  t = text(0.05,0.35,'- Pulsa ESPACIO para finalizar','HorizontalAlignment','left');
  t.FontSize = 14;
  
  t = text(0.05,0.1,sprintf('Vel lineal actual %g km/h  |  Angulo volante %g grados', vel_lineal_ackerman_kmh, steering_wheel_angle),'HorizontalAlignment','left');
  t.FontSize = 17;



  training=[]; 

%   
%   t = text(0.1,0.2,sprintf('Error_dist %g m | Error_theta %g rad', Error_dist, Error_ang),'HorizontalAlignment','left');
%   t.FontSize = 14;
  
  end