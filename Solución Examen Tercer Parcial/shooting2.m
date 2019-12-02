%Metodo de shooting2:cambian los valores de as ys de entrada. Utilizas el valor
%inicial del valor y y z. No sabemos canto es y1, pero sabemos el valor final de z,
%y lo comparamos con el valor de z1
function dif = shooting2(f,t0,tf,y11,y21,h,y22)
    y0 = [y11; y21];
    [t, y] = ivps(f,t0,tf,y0,h, 4);
    dif = y22 - y(2,end);
end
