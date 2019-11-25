function d = shootingF(f,a,b,ya,yb,h,s)
%Regresa la distancia final aplicando el metodo IVPS.
% s es una adivinanza de f' en a

    y0 = [ya;s];
    [t,y] = ivps(f,a,y0,h,b,'euler');
    yP = y(1,end);
    d=yP-yb;
end

