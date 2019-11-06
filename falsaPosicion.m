function [x,i] = falsaPosicion(f,a,b)
%Encuentra la raíz de la función f entre a y b
%  usa el método de falsa posicion
    if (sign(f(a)) * sign(f(b)) >= 0)
        error('f(a)*f(b)< 0 no se satisface'); 
    end
    MAX = 52;
    tol = eps();
    i=0;
    xp = (a+b)/2;
    x = b - f(b)*(b-a)/(f(b)-f(a));
    fx = f(x);
    while abs((x-xp)/x)> tol && fx~=0 && i<MAX
        if sign(fx) ~= sign(f(a))
            b = x;
        else
            a = x;
        end
        xp=x;
        x = b - f(b)*(b-a)/(f(b)-f(a));
        fx = f(x);
        i = i+1;    
    end
end

