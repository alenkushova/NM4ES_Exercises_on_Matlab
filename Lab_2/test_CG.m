num = linspace(10,100,10);
niter = []; cond=[];
for n = num
    A = gallery('poisson',n);
    b = ones(size(A,1),1);
    tol   = 1.e-6;
    maxit = 1000;
    x0    = zeros(size(A,1),1);
    [X,FLAG,RELRES,ITER,RESVEC] = pcg(A,b,tol,maxit); % CG
    niter = [niter ITER];
    lambda = eigs(A,2,'bothendsreal');
    cond = [cond lambda(end)/lambda(1)];
end

figure(1)
plot(num,niter,'-.sk',...
    'LineWidth',2,...
    'MarkerSize',5,...
    'MarkerEdgeColor','#0072BD',...
    'MarkerFaceColor','#0072BD')
title('Number of iterations VS n in Conjugate Gradients')
legend('Conjugate Gradients','Location','northwest')
xlabel('n')
ylabel('Number of iterations')
%% check the condition number relatet to the iterations:
figure(2)
plot(num,niter,'-.sk',...
    'LineWidth',2,...
    'MarkerSize',5,...
    'MarkerEdgeColor','#0072BD',...
    'MarkerFaceColor','#0072BD')
hold on
plot(num,cond,'-.^k',...
    'LineWidth',2,...
    'MarkerSize',5,...
    'MarkerEdgeColor','#D95319',...
    'MarkerFaceColor','#D95319')
title('Iterations and cond. numb. VS n in Conjugate Gradients')
legend('Iter.','Cond.','Location','northwest')
xlabel('n')
