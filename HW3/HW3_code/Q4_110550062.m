% Define the points
x = [10 50 75 90 105 150 180 190 160 130];
y = [10 15 60 100 140 200 140 120 100 80];

% Plot the points
plot(x,y,'o');
%plot(x, y, 'b', 'LineWidth', 1.4);
xlim([-10 250])
ylim([-10 250])
hold on;

% Compute and plot the B-spline curve
k = 4; % Degree of the B-spline curve
n = length(x); % Number of control points
t = linspace(0,1,n-k+2); % Knot vector
pp = csape(1:n, [x;y], 'periodic', 1:n); % Cubic spline interpolation
fnplt(pp); % Plot the B-spline curve

% Add legend and title
legend('Control Point', 'B-spline Curve');
title('B-spline Curve Interpolation');
