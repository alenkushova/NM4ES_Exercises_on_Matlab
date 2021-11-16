function [x,mu,RelErr,Ratio] = power_method(A,maxit,tol)
% This function approximate the largest eigenvalue of A in absolute value.
% It also provides the unitary norm eigenvector associated to the
% eigenvalue we found.
%
%  CALL:   [x,mu,RelErr,Ratio] = power(A,maxit,tol)
%
%  INPUT:   A     = squared matrix of size n x n (symmetric better);
%           maxit = maximum number of iterations allowed.
%
%  OUTPUT:  x     = approximated eigenvector;
%           mu    = approximated eigenvalue.
%           RelErr= evolution of the relative error for the approx. of mu
%           Rati  = evolution of ratio |l_2/l_1|^k (with l_i = lambda_i)
%
i = 0;
x = randi(10,size(A,1),1);
x = x/norm(x);
mu= x'*A*x;
lambda = eigs(A,2);
RelErr = abs(lambda(1) - mu)/abs(lambda(1));
Ratio = abs(lambda(2)/lambda(1))^0; % This ratio is 1 at step zero.

while (norm(A*x - mu*x)>tol && i < maxit)
    x = A*x;
    x = x/norm(x);
    mu= x'*A*x;
    i = i+1;
    % function modified in order to get the info for the plot:
    RelErr = [RelErr abs(lambda(1) - mu)/abs(lambda(1))];
    Ratio  = [Ratio abs(lambda(2)/lambda(1))^i];
end

end