function x = backsubstitution(U,b)
% First comment will appear in 'help'.
% You can give here information about your code/function.
%
%
% This function solves linear system of the kind U x = b
% in the particular case where U is upper triangular matrix.
%
%  CALL:         x = backsubstitution(U,b)
%
%  INPUT:        U = squared uppertriangular matrix of size n x n;
%                b = right hand side vector of size n.
%
%  OUTPUT:       x = solution of the linear system U x = b.
%
% Test your code with the matlab 'backslash' function (\).
% Test with:
% A = [-3 -1 2; 0 1 -5; 0 0 2];
% b = [4; -4; 2];
%

% The code starts here: 

n = size(U,1); %this gets the size of U along the first univariate direction
               %notice U is expected to be squared matrix. 
x = zeros(n,1); %initialize solution vector.
x(n) = b(n)/U(n,n); % start solving the problem/ initialize x(n)

%loop and write the backsubstitution steps here. (proposed solution)
for i = n-1: -1 : 1
    sum = 0;
    for j = i+1 : n
        sum = sum + U(i,j)*x(j);
    end
    x(i) = (b(i) - sum) / U(i,i);
end

end


