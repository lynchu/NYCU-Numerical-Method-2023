% Hermite cubic interpolation polynomial for f(x) = xe^(-x)

% Define the function
f = @(x) x.*exp(-x);
fp = @(x) exp(-x)-x.*exp(-x);

% Define the interpolation points
x = [1, 2, 3];
y = f(x);
y_prime = fp(x);

% Calculate the coefficients
a0 = y(1);
a1 = y_prime(1);
t1 = (y(2) - y(1)) - y_prime(1);
t2 = (y(3) - y(1) - y_prime(1)*(x(3)-x(1))) / ((x(3)-x(1))^2);
a2 = t1 / (x(2)-x(1)) - t2;
a3 = t2 / (x(2)-x(1));

% Define the interpolation range
u = linspace(0, 4, 100); % 100 points between 0 and 4

% Evaluate the Hermite cubic interpolation polynomial at u
result = a0 + a1*(u-x(1)) + a2*(u-x(1)).^2 + a3*(u-x(1)).^2.*(u-x(2));
h = @(u) a0 + a1*(u-x(1)) + a2*(u-x(1)).^2 + a3*(u-x(1)).^2.*(u-x(2));

% Plot the Hermite cubic interpolation polynomial
plot(u, h(u), 'LineWidth', 2);
hold on;
scatter(x, y, 100, 'filled', 'MarkerFaceColor', 'r');
xlabel('x');
ylabel('y');
title('Hermite Cubic Interpolation Polynomial');
legend('Hermite cubic polynomial', 'Interpolation points');
grid on;

est = h(1.5);
fprintf('p(1.5) = %.8f\n', est);