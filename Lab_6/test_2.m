f     = @(x) exp(x) - cos(x) - 2 ;
dervf = @(x) exp(x) + sin(x); 
% Solution is known at x_0 = 0.

% Appropriate interval: 
a = -1;    b = 2;
% Appropriate starting point:
x0 = 1/2;
% (Notice that if a = -b bisection converges in 1 iteration, why?)
tol    = 1.e-6;
maxits = 1.e+2;

% Solve the nonlinear system 
[x,xits] = bisection(f,a,b,tol,maxits); % with bisection method
[y,yits] = newton(f,dervf,x0,tol,maxits);

% Solution is NOT KNOWN:
sol = fsolve(f,0);
% Plot the solution here:
figure(1)
semilogy(1:xits,abs(x-sol),'LineWidth', 1.5)
hold on; grid on;
semilogy(1:yits,abs(y(2:end)-sol),'LineWidth', 1.5)
legend('Bisection','Newton')
title('f(x) = exp(x) + cos(x) - 2')
xlabel('Iterations')
ylabel('log_{10}|x-0|')
hold off
