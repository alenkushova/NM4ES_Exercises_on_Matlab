function I = CompositeMidpointRule(f,N)
% This function computes the COMPOSITE MIDPOINT QUADRATURE of f over [0,1]
% given N subdivisions of the interval.
%
%  CALL:  I = CompositeMidpointRule(f,N);
%
%  INPUT:    f  = function to be integrated;
%            N  = number of subdivisions.
%
%  OUTPUT:   I  = aprox. of integral of f over [0,1];
%            

h = 1/N ; %number of sbdivisions
I = 0;
for i = 0 : N-1 
    I = I + h*f(i*h + h/2);
end
end