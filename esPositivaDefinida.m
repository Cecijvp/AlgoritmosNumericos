function [cuadrada,simetrica,pd] = esPositivaDefinida(A)
cuadrada = size(A,1)==size(A,2);
simetrica = cuadrada && isequal(A,A');
pd = simetrica && all(eig(A)>0);
end


