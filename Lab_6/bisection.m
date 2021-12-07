function [x,its] = bisection(f,a,b,tol,maxits)
% This function performs the 'bisection method' to solve NON-LINEAR system by
% finding the roots of f(x) = 0.
%
%  CALL: [x,its] = bisection(f,a,b,tol,maxits);
%
%  INPUT:     f   = continuous function;
%             a   = left hand side of the interval;
%             b   = right hand side of the interval;
%            tol  = tollerance of solution;
%           maxit = maximum number of iterations.
%
%  OUTPUT:    x   = root of f;
%            its  = number of iterations performed.
%

its = 1;
while its < maxits
    x(its) = (a+b)/2;
    if(f(x(its))==0 || (b-a)/2 < tol ) 
        break
    elseif(sign(f(a)) == sign(f(x(its))) )
        a = x(its);
    else
        b = x(its);
    end
    its = its+1;
end
end