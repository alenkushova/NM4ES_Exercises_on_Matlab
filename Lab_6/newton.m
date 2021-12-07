function [x,its] = newton(f,derf,x0,tol,maxits)
% This function performs the 'Newton method' to solve NON-LINEAR system by
% finding the roots of f(x) = 0.
%
%  CALL: [x,its] = newton(f,derf,x0,tol,maxits);
%
%  INPUT:      f  = continuous function;
%           derf  = derivative of f;
%             x0  = initial guess;
%            tol  = tollerance of solution;
%           maxit = maximum number of iterations.
%
%  OUTPUT:    x   = root of f;
%            its  = number of iterations performed.
%
x = x0;
for its = 1 : maxits 
    x(its + 1) = x(its) - f(x(its))/derf(x(its));
    if( (abs(x(its + 1) - x(its))< tol) || (abs(f(x(its + 1))) < tol) )
       break
    end
end
end