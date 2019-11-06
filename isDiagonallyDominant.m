function x = isDiagonallyDominant(A) % solución del profesor
 sumUP = sum(abs(triu(A,1)),2);
sumDown = sum(abs(triu(A,1)),2);
if abs(diag(A)) > sumUP + sumDown, x=1; else, x=0;end
end
