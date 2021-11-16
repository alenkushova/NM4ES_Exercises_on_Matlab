function [x,P] = GEM (A, b)
% This function solves linear system of the kind A x = b with Gaussian
% Elimination Method (GEM)
%
%  CALL:         x = GEM (A, b)
%
%  INPUT:        A = squared matrix of size n x n;
%                b = right hand side vector of size n.
%
%  OUTPUT:       x = solution of the linear system A x = b.
%
% Test the code with the Matlab 'backslash' and the matrix:
% A = [2 2 0; 1 1 -1 ; 3 -2 4];
% b = [4 ; 5 ; 1];
%


n = size(A, 1);
P = eye(n);
for i = 1 : n
    [m,k] = max(abs(A(i:end,i))); %we look for the highest pivot modulus
    h = i+k-1; %global index
    if (h == i) %if we don't have to change pivot
       for j = i+1:n
           I = A(j,i)/A(i,i);
           A(j,:) = A(j,:)-I*A(i,:);
           b(j) = b(j) - I*b(j); 
       end
    else %this means we have to change pivot
        ID = eye(n);
        temp   = ID(i,:); % update permutation matrix
        ID(i,:) = ID(h,:);
        ID(h,:) = temp;
        P = ID*P;
        A = ID * A; %change rows of A
        b = ID * b; %change rows of b
        for j = i+1:n % gaussian elimination
           I = A(j,i)/A(i,i);
           A(j,:) = A(j,:)-I*A(i,:);
           b(j) = b(j) - I*b(i); 
       end
    end
end
x = backsubstitution(A,b);
end


