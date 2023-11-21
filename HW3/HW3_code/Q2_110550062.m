% Define the function f(x)
f = @(x) (x >= -1 & x < -0.5) .* 0 + (x >= -0.5 & x < 0.5) .* (1 - abs(2*x)) + (x >= 0.5 & x <= 1) .* 0;

% Define the evenly spaced points to match the spline to
x = linspace(-1, 1, 5);
y = f(x);

% Fit the natural cubic spline with zero end slopes
pp = spline(x, [0 y 0]);

% Evaluate the spline curve at a denser set of points for plotting
xx = linspace(-1, 1, 1000);
yy = ppval(pp, xx);

% Plot the spline curve together with f(x)
plot(xx, yy, 'b', 'LineWidth', 2);
hold on;
plot(xx, f(xx), 'r--', 'LineWidth', 2);
legend('Cubic Spline', 'Original Function');
xlabel('x');
ylabel('f(x)');

