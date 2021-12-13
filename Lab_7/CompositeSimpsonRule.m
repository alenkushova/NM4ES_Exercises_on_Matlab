function I = CompositeSimpsonRule(f,N)
% This function computes the COMPOSITE SIMPSON QUADRATURE of f over [0,1]
% given N subdivisions of the interval.
%
%  CALL:  I = CompositeSimpsonRule(f,N)
%
%  INPUT:    f  = function to be integrated;
%            N  = number of subdivisions.
%
%  OUTPUT:   I  = aprox. of integral of f over [0,1];
%            

h = 1/N ; %number of sbdivisions
I = 0;
for i = 0 : N-1 
    I = I + h/6*(f(i*h)+ 4*f(i*h+h/2) + f((i+1)*h));
end
end