function [x,res,its] = Gauss_Seidel(A,b,tol,maxit,x0)
% this function computes the Gauss-Seidel method for solving Ax = b.
%  CALL: [x,res,ist] = Gauss_Seidel(A,b,tol,maxit,x0)
%
%  INPUT:       A    = squared matrix of size n x n;
%               b    = right hand side vector of size n;
%               tol  = ;
%               maxit= ;
%               x0   = .
%
%  OUTPUT:      x = solution of the linear system U x = b.
%
% Test the method on the problem Ax = b, where
% A     = [7 6 3; 2 5 -4; -4 -3 8]; 
% b     = [16; 3; 1]; 
% tol   = 1.e-6;
% maxit = 1000;
% x0    = zeros(size(A,1),1);


M  = tril(A);
res0 = b - A*x0;
x = x0; res = norm(res0);
its = 0;
while (norm(res(end))/norm(res0) > tol) && (its < maxit)
    x = x + M\(b-A*x);
    res = [res norm(b - A*x)];
    its  = its+1;
end

