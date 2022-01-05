%% Find solution of the ODE given by
%       y'(t) = -3y(t) +2t -2,   for t in [0,1] ;
%       y(0)  = -1 ;
% 
% First use the E.E. then I.E., C.N. and Heun.
% The exact solution is give by the following:

yexact = @(t) 2*t/3 - 1/9 *exp(-3*t) -8/9;

% some parameters:
y0 = -1;
T = 1;

close all

%% Explicit Euler: y' = 1/dt * [ y(t_{n+1}) - y(t_{n}) ] ,
% and consider y' = f(t_{n},y(t_{n})). 
figure ('Units', 'pixels', 'Position', [100 95 1000 500]) ;
fplot(yexact, [0 1], 'LineWidth', 1.5)
hold on 
for dt = [0.5 0.2 0.1]
    N = T/dt;
    yee = [y0 zeros(1,N)];
    for i = 1 : N 
        yee(i+1) = yee(i) + dt*( -3*yee(i) + 2*(i-1)*dt -2);
    end
    plot(0:dt:1, yee,'-.', 'LineWidth', 1.5)
end
hold off
legend('Exact Sol.','\Delta t = 0.5','\Delta t = 0.2','\Delta t = 0.1',...
            'Location','northwest')
title('Explicit Euler method')

%% Implicit Euler: y' = 1/dt * [ y(t_{n+1}) - y(t_{n}) ] ,
% and consider y' = f(t_{n+1},y(t_{n+1})). 
figure ('Units', 'pixels', 'Position', [110 85 1000 500]) ;
fplot(yexact, [0 1], 'LineWidth', 1.5)
hold on 
for dt = [0.5 0.2 0.1]
    N = T/dt;
    yie = [y0 zeros(1,N)];
    for i = 1 : N 
        yie(i+1) = (yie(i) + dt*( + 2*(i)*dt -2)) /(1+3*dt);
    end
    plot(0:dt:1, yie,'-.', 'LineWidth', 1.5)
end
hold off
legend('Exact Sol.','\Delta t = 0.5','\Delta t = 0.2','\Delta t = 0.1',...
            'Location','northwest')
title('Implicit Euler method')

%% Crank-Nicolson: y' = 1/dt * [ y(t_{n+1}) - y(t_{n}) ] ,
% and consider y' = 1/2( f(t_{n+1},y(t_{n+1})) + f(t_{n},y(t_{n})) ). 
figure ('Units', 'pixels', 'Position', [120 75 1000 500]) ;
fplot(yexact, [0 1], 'LineWidth', 1.5)
hold on 
for dt = [0.5 0.2 0.1]
    N = T/dt;
    ycn = [y0 zeros(1,N)];
    for i = 1 : N 
        ycn(i+1) = (ycn(i) + dt/2*(+ 2*(i)*dt -2 -3*ycn(i) + 2*(i-1)*dt -2))...
                     /(1+3/2*dt) ;
    end
    plot(0:dt:1, ycn,'-.', 'LineWidth', 1.5)
end
hold off
legend('Exact Sol.','\Delta t = 0.5','\Delta t = 0.2','\Delta t = 0.1',...
            'Location','northwest')
title('Crank-Nicolson method')

%% Heun : y' = 1/dt * [ y(t_{n+1}) - y(t_{n}) ] ,
% and consider y' = 1/2( f(t_{n+1},y*(t_{n+1})) + f(t_{n},y(t_{n})) ).
% where y*(t_{n+1}) = y(t_{n}) + dt*f(t_{n},y(t_{n})); Prediction with E.E.
figure ('Units', 'pixels', 'Position', [130 65 1000 500]) ;
fplot(yexact, [0 1], 'LineWidth', 1.5)
hold on 
for dt = [0.5 0.2 0.1]
    N = T/dt;
    yh = [y0 zeros(1,N)];
    for i = 1 : N 
        yStar   = yh(i) + dt*( -3*yh(i) + 2*(i-1)*dt -2);
        yh(i+1) = yh(i) + dt/2*( -3*yStar + 2*(i)*dt   -2 ...
                                 -3*yh(i) + 2*(i-1)*dt -2    );
    end
    plot(0:dt:1, yh,'-.', 'LineWidth', 1.5)
end
hold off
legend('Exact Sol.','\Delta t = 0.5','\Delta t = 0.2','\Delta t = 0.1',...
            'Location','northwest')
title('Heun method')
