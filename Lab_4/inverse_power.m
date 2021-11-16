function [x,mu,i] = inverse_power(A,mu_par,maxit,tol)
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
%           i     = number of iterations required to converge.
%

i = 0;
x = randi(10,size(A,1),1);
x = x/norm(x);
mu= x'*A*x;
MAT = A-mu_par*eye(size(A,1));
while (norm(A*x - mu*x)>tol && i < maxit)
    x = MAT\x;
    x = x/norm(x);
    mu= x'*A*x;
    i = i+1;
end
