function d = determinant(A)
% This function inverts A using LU factorization
%
%  CALL:         d = determinant(A)
%
%  INPUT:        A = squared matrix of size n x n;
%
%  OUTPUT:       d = determinant of A.
%
% Test the code with the matlab det(A) and the matrix:
% A = [2 2 0; 1 1 -1 ; 3 -2 4];
%

n = size(A,1);
[x,P,L,U] = LU(A,zeros(n,1));
%to find det of P without changing the LU code:
sign = 1;
for i = 1: n     
    [m,k] = max(P(:,1));%find position of ones.
    P(k,:)= []; P(:,1)= []; %remove row k and column 1.
    sign = sign*(-1)^(k+1);%update the sign.
end
d = sign*prod(diag(U));
end

