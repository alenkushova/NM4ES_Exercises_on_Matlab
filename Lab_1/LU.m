function [x, P, L, U] = LU (A, b)
% This function solves linear system of the kind A x = b with LU
% factorization
%
%  CALL:         x         = LU (A, b)
%                [x,P,L,U] = LU (A, b)
%
%  INPUT:        A = squared matrix of size n x n;
%                b = right hand side vector of size n.
%
%  OUTPUT:       x = solution of the linear system A x = b.
%                P = permutation matrix
%                L = lower triangular matrix of decomposition
%                U = upper triangular matrix of decomposition
%
% Test the code with the matlab backslash and the matrix:
% A = [2 2 0; 1 1 -1 ; 3 -2 4];
% b = [4 ; 5 ; 1];
%


n = size(A, 1);
P = eye(n);
L = zeros(n);
% routine senza pivoting:
for i = 1 : n
    [m,k] = max(abs(A(i:end,i))); %we look for the highest pivotin modulus
    h = i+k-1; %global index
    if (h == i) %if we don't have to change pivot
       for j = i+1:n
           L(j,i) = A(j,i)/A(i,i);
           A(j,:) = A(j,:)-L(j,i)*A(i,:);
           b(j) = b(j) - L(j,i)*b(j); 
       end
    else %this means we have to change pivot
        ID = eye(n);
        temp   = ID(i,:); % update permutation matrix
        ID(i,:) = ID(h,:);
        ID(h,:) = temp;
        P = ID * P; %change rows of P
        L = ID * L; %change rows of L
        A = ID * A; %change rows of A
        b = ID * b; %change rows of b
        for j = i+1:n % gaussian elimination
           L(j,i) = A(j,i)/A(i,i);
           A(j,:) = A(j,:)-L(j,i)*A(i,:);
           b(j) = b(j) - L(j,i)*b(i); 
        end
    end
end
L = L + eye(n); %constraint on diagonal terms
U = A;
x = backsubstitution(A,b);
end


