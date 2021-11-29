function c = quadratic_regression(x,y)
% This function computes the coefficients of the degree 2 polinomial that 
% fits the imput points {x_i,y_i} for i = 0,...,N, in the least square 
% sense, by solving the system of normal equations.
%
%  CALL:  c = linear_regression(x,y)
%
%  INPUT:       x  = abscissa of the data set. (column vector)
%               y  = ordinate of the data set. (column vector)
%
%  OUTPUT:      c  = coefficients of the linear regression line;
%

M = [ones(numel(x),1) x x.^2];
A = M'*M;
c = A\(M'*y);
end
