function [t,v] = calculoVelocidad(v0,tf,h,m,cd,g)
%Calcula la velocidad de un cuerpo en caída libre
%   Utiliza una aproximación de 1er orden
%
    t = 0:h:tf; % vector de 1 renglon y varias columnas
    size(t);
    v = zeros(size(t)); %vector con puros ceros
    for i=1:1:length(v)-1 %los indices de los vectores empiezan en 1
        %v(i+1) = v(i) + f(v(i))*h
        v(i+1) = v(i) + (g-(cd/m)*v(i)^2)*h; 
    end
    
end

