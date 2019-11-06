
g=9.82;
cd=0.25;
v=36;
t=4;
func=@(m) sqrt(g*m/cd).*tanh(sqrt(g*cd./m)*t)-v;
[x, i]=iqi(func,1, 200, 100)