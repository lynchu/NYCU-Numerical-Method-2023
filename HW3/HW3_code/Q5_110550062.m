% Given data points
x = [0.40 1.2 3.4 4.1 5.7 7.2 9.3]';
y = [0.70 2.1 4.0 4.9 6.3 8.1 8.9]';
z = [0.031 0.933 3.058 3.349 4.870 5.757 8.921]';

% Number of data points
n = length(x);
% Construct the matrix A
A = [x y ones(n,1)];
% Compute the coefficients using normal equations
coeff = (A' * A) \ (A' * z)
str = 'Normal equation: z = %.4fx + %.4fy + %.4f\n';

if coeff(2)<0
    str(28)='-';
end
if coeff(3)<0
    str(36)='-';
end

a = coeff(1);
b = coeff(2);
c = coeff(3);

% Calculating the sum of the squares of the deviations
z_fit = a*x + b*y + c;
deviation = z - z_fit;
sum_squares = sum(deviation.^2);

% Displaying the results
disp(['Sum of squares of deviations = ' num2str(sum_squares)]);

% Print the normal equation in the form z = ax + by + c
fprintf(str,coeff(1),abs(coeff(2)),abs(coeff(3)));