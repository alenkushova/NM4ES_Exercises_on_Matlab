function I = CompositeTrapezoidalRule(f,N)
% This function computes the COMPOSITE TRAPEZOIDAL QUADRATURE of f over [0,1]
% given N subdivisions of the interval.
%
%  CALL:  I = CompositeTrapezoidalRule(f,N);
%
%  INPUT:    f  = function to be integrated;
%            N  = number of subdivisions.
%
%  OUTPUT:   I  = aprox. of integral of f over [0,1];
%            

h = 1/N ; %number of sbdivisions
I = 0;
for i = 0 : N-1 
    I = I + h/2*(f(i*h) + f((i+1)*h));
end
end