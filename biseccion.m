function [x,i] = biseccion(f,a,b)
%Encuentra la ra�z de la funci�n f entre a y b
%  usa el m�todo de bisecci�n
    if (sign(f(a)) * sign(f(b)) >= 0)
        error('f(a)*f(b)< 0 no se satisface'); 
    end
    MAX = 55;
    tol = eps();
    format long;
    i=0;
    x = (a+b)/2;
    fx = f(x);
    while abs((b-a)/b)> tol && fx~=0 && i<MAX
        if(sign(f(x)) ~= sign(f(a)))
            b = x;
        else
            a = x;
        end
        x = (a+b)/2;
        fx = f(x);
        i = i+1;    
    end
end

