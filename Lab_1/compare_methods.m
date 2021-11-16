function compare_methods(f)
% this function solves A x = f for arbitrary f, with the different methods
% seen: GEM, LU, inverted A. 
% CALL:     compare_methods(f)
%
%INPUT:     f = the rhs for Ax = f with A from exercise slides.
%               f is expected as column vector of size n.
%
% Test with:
% n = 100; 
% f = sin(pi*linspace(0,1,n))';
% 
% Try also with the matrix B
% B = 2*speye(n);
% B(1,2:end) = ones(1,n-1);
% B(2:end,1) = ones(n-1,1);



n  = size(f,1);

% Next, here you can try with the matrix B given below.
e = ones(n,1);
A = spdiags([-e 2*e -e],-1:1,n,n); %create spars diagonal matrix
%A = full(A); %if you want to use the full=dense matrix
%________________________________________________________



%test with GEM:
disp("Solution with Gaussian elimination:")
tic %use tic and toc to measure the time.
GEM(A,f); 
toc %it will print the elapsed time on video

%test with LU:
disp("Solution with LU factorization:")
tic 
LU(A,f);
toc

%test with inverse: (comment these lines to compare only GEM and LU)
disp("Solution with inverse matrix:")
tic 
inverse(A)*f;
toc
end

