function [ x, i ] = iqi( f, a, b, c )


    iterMax=100;
    cota=eps;
    x=a;
    i = 0;
    cond=true;
    while cond
        xAnt=x;
        x = x*(f(b)*f(c))/((f(x)-f(b))*(f(x)-f(c))) + b*(f(x)*f(c))/((f(b)-f(x))*(f(b)-f(c))) + c*(f(x)*f(b))/((f(c)-f(x))*(f(c)-f(b)));
        er = abs((x-xAnt)/x);
        c=b;
        b=xAnt;
        i = i+1;
        cond = er>cota && i<iterMax && f(x)~=0;
    end

end

