function [num] = hexToNumber(str)
%Funci�n que convierte un n�mero hexadecimal a un n�mero de doble precisi�n 
%En los siguientes pasos se determina el exponente del n�mero: 
 aux = str(1:3); 
 bin = hexToBinaryVector(aux,12); % funci�n utilizada para convertir el n�mero Hexadecimal en  un vector binario de 12 bits
 str_b = num2str(bin); % convertir el vector binario en un string
 dec = bin2dec(str_b); % funci�n que ayuda a convertir un string binario en un n�mero decimal
 exp = dec - 1023; 
 %En los siguientes pasos se obtiene la matissa con el n�mero a convetir: 
 aux2 = str(4:end);
bin2 = hexToBinaryVector(aux2,52); % se obtiene el n�mero en un vector de 52 bits.  
i=-1;
j=1;
a = 1;
b = 4;
suma = 0;
aux = bin2;
% A continuaci�n se convertir� cada digito de la cadena en hexadecimal a
% binario y posteriormente multiplicarlo por 16 elevado al exponente que le
% corresponde
while (j < 13) 
    aux2 = aux(a:b);
    str = num2str(aux2); % Convertir un vector binario en string
    aux3 = bin2dec(str); % string binario a decimal
    aux4 = aux3*(16^i); 
    suma = suma + aux4;
    a=a+4;
    b=b+4;
    j=j+1;
    i = i-1;
end

num = (suma + 1)*(2^exp); % aqui se utiliza la formula para obtener el n�mero de doble precisi�n : x = +- ( 1 + f)*2^e con e =entero. 

end

