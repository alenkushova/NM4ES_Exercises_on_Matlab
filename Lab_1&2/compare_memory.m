function compare_memory(f)
% this function solves A x = f for arbitrary f, with the different methods
% seen: GEM, LU, inverted A. 
% CALL:     compare_methods(f)
%
%INPUT:     f = the rhs for Ax = f with A from exercise slides.
%               f is expected as column vector of size n.
%

n  = size(f,1);
e = ones(n,1);
A = spdiags([-e 2*e -e],-1:1,n,n); %create spars diagonal matrix
A = full(A);

% full(A) matrix storage:
disp("Memory storage for dense matrices:")
whos A
A = sparse(A);
% sparse(A) matrix storage:
disp("Memory storage for sparse matrices:")
whos A
end

% test with: 
% f = sin(pi*linspace(0,1,n))';
% with n = 100.

% try also with the matrix B
% B = 2*speye(n);
% B(1,2:end) = ones(1,n-1);
% B(2:end,1) = ones(n-1,1);
