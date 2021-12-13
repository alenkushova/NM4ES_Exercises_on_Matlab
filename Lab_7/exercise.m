% This script wants to compute the \int_0^1 sin(\pi x) dx with the
% following wuadrature rules: 
%       1) Composite midpoint quadrature;
%       1) Composite trapezoidal quadrature;
%       1) Composite Simpson quadrature.
% The mesh size is identified by h.
%

% Define the function here.
f = @(x) sin(pi*x);
% Solution 
sol = 2/pi;

% Initialize fields
h = []; I_m = []; I_t = []; I_S = [];

for N = 1:50:1000
    h   = [h 1/N];
    I_m = [I_m CompositeMidpointRule(f,N)]; 
    I_t = [I_t CompositeTrapezoidalRule(f,N)];
    I_S = [I_S CompositeSimpsonRule(f,N)];
end

% Plot of the errors:
figure(1)
loglog(h, abs(I_m-sol),'-o','LineWidth',1.5)% error with midpoint rule
hold on
loglog(h, abs(I_t-sol),'-s','LineWidth',1.5)% error with trapezoidal rule
loglog(h, abs(I_S-sol),'-d','LineWidth',1.5)% error with Simpson rule
loglog(h, h,   '--','LineWidth',1.5)%   h
loglog(h, h.^2,'-.','LineWidth',1.5)%    h^2
loglog(h, h.^3,':','LineWidth',1.5)%     h^3
loglog(h, h.^4,'.:','LineWidth',1.5)%     h^4
legend('Mid.','Trap.','Simp.','O(h)','O(h^2)','O(h^3)','O(h^4)','Location','southeast')
xlabel('h')
ylabel('Error')
title('Error convergence for quadrature of sin(\pi x)')
grid on 
hold off
       
