function S = inverse(A)
% This function inverts A using LU factorization
%
%  CALL:         S = inverse(A)
%
%  INPUT:        A = squared matrix of size n x n to invert;
%
%  OUTPUT:       S = inverse of A.
%
% test the code with the matlab comand inv(A) and the matrix:
% A = [2 2 0; 1 1 -1 ; 3 -2 4];
% 

n = size(A, 1);
S = zeros(n);
I = eye(n); 
for i = 1 : n
    S(:,i) = LU(A,I(:,i)); %colums of inverse matrix solve A S_i = e_i.
end

