% Define the points
X = [10 50 75 90 105 150 180 190 160 130];
Y = [10 15 60 100 140 200 140 120 100 80];

% Control points
P = [X', Y'];

% Degree of the Bezier curve
n = length(X) - 1;

% Parameter values
t = linspace(0, 1, 1000);

% Bernstein basis functions
B = @(i, n, t) nchoosek(n, i) * t.^i .* (1-t).^(n-i);

% Compute points on the Bezier curve
curve = zeros(length(t), 2);
for i = 0:n
    curve = curve + P(i+1,:) .* B(i,n,t)';
end

% Plot the points and the Bezier curve
plot(X, Y, 'o', curve(:,1), curve(:,2), '-')
xlim([-10 250])
ylim([-10 250])
title('Bezier Curve')
xlabel('x')
ylabel('y')
legend('Control Points', 'Bezier Curve')