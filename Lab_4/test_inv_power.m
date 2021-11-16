%% test 1.    A symmetric
Q = orth(randn(10,10));
A = Q*diag(1:10)*inv(Q);
maxit = 1000;
tol   = 1.e-6; 
mu_par =[1.55 1.65 1.75 1.85 1.95];
lambda = eigs(A,2,'smallestabs');
num_it = [];
for par = mu_par
    [x,mu,i] = inverse_power(A,par,maxit,tol);
    num_it = [num_it i];
end

xline = abs(lambda(2) - mu_par)./abs(lambda(1) - mu_par);
%Give a look at 'xline' to understand better !!
figure(1)
plot(xline,num_it,'--sk',...
    'LineWidth',2,...
    'MarkerSize',5,...
    'MarkerEdgeColor','#0072BD',...
    'MarkerFaceColor','#0072BD')
title('Convergence of inverse power method on A symmetric')
xlabel('|\lambda_9-\mu| / |\lambda_{10} - \mu|')
ylabel('Numb. iterations')

%% test 2.    A non-symmetric
Q = orth(randn(10,10));
A = Q*diag(1:10)*inv(Q);
maxit = 1000;
tol   = 1.e-6; 
mu_par =[1.55 1.65 1.75 1.85 1.95];
lambda = eigs(A,2,'smallestabs');
num_it = [];
for par = mu_par
    [x,mu,i] = inverse_power(A,par,maxit,tol);
    num_it = [num_it i];
end

xline = abs(lambda(2) - mu_par)./abs(lambda(1) - mu_par);
%Give a look at 'xline' to understand better !!
figure(2)
plot(xline,num_it,'--sk',...
    'LineWidth',2,...
    'MarkerSize',5,...
    'MarkerEdgeColor','#0072BD',...
    'MarkerFaceColor','#0072BD')

title('Convergence of inverse power method on A non-symmetric')
xlabel('|\lambda_9-\mu| / |\lambda_{10} - \mu|')
ylabel('Numb. iterations')
