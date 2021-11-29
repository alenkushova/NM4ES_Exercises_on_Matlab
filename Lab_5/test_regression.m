% load the dataset
load('least_squares_data.mat')

%% Test 1, linear regression:
c = linear_regression(x,y);
figure(1)
scatter(x,y,'filled');
hold on
plot(x,c(1) + c(2)*x ,'LineWidth',2)
title('Linear regression test')
legend('Dataset','Linear fitting','Location','northwest')
hold off

%% Test 2, quadratic regression:
c = quadratic_regression(x,y);
figure(2)
scatter(x,y,'filled');
hold on
plot(x,c(1) + c(2)*x + c(3)*x.^2,'LineWidth',2)
title('Quadratic regression test')
legend('Dataset','Quadratic fitting','Location','northwest')
hold off