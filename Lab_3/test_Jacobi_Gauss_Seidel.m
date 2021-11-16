% Test the two methods (Jacobi/Gauss-Seidel) on the problem Ax = b, where
A     = [7 6 3;2 5 -4; -4 -3 8]; 
b     = [16; 3; 1]; 
tol   = 1.e-6;
maxit = 1000;
x0    = zeros(size(A,1),1);
[Jx,Jres,Jits] = Jacobi(A,b,tol,maxit,x0);
[Gx,Gres,Gits] = Gauss_Seidel(A,b,tol,maxit,x0);

figure(1)
semilogy(linspace(0,Jits,Jits+1),Jres,'--sk',...
    'LineWidth',2,...
    'MarkerSize',5,...
    'MarkerEdgeColor','#0072BD',...
    'MarkerFaceColor','#0072BD')
hold on
grid on
semilogy(linspace(0,Gits,Gits+1),Gres,'--^k',...
    'LineWidth',2,...
    'MarkerSize',5,...
    'MarkerEdgeColor','#D95319',...
    'MarkerFaceColor','#D95319')
legend('Jacobi','Gauss-Seidel')
title('Convergence of Jacobi and Gauss-Seidel methods')
xlabel('iter. number')
ylabel('log_{10}(|| b - Ax^k ||_{l^2})')

%% Who is max_i (\lambda_i(B)), where B = M^{-1}*N ? (recall A = M - N) 
MJ = diag(diag(A)); BJ = inv(MJ)*(MJ-A);
MG = tril(A); BG = inv(MG)*(MG-A);
J_lambda = max(abs(eigs(BJ)))
G_lambda = max(abs(eigs(BG)))
% If this value is lower than 1 (max_i (\lambda_i(B)) < 1) we have
% convergence. But it is an 'if and only if' and since we tested the
% convergence before, we are expecting this value to be of course < 1.