% Define the function and x
fx = [1.543 1.669 1.811 1.971 2.151 2.352 2.577 2.828 3.107];
x = [1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8];

h = (1.1 - 1.0); % panel width
% Combination1: Use Simpson's 3/8 rule over the first two and middle two panels
% [1/3, 3/8, 3/8]
sum13 = h/3 * (fx(1) + 4*fx(2) + fx(3)); 
sum38 = 3/8 * h * (fx(3) + 3*fx(4) + 3*fx(5) + fx(6)); 
sum38_2 = 3/8 * h * (fx(6) + 3*fx(7) + 3*fx(8) + fx(9));
approx1 = sum13 + sum38 + sum38_2;
fprintf("Approximate Value of Combination1 [1/3, 3/8, 3/8]:%.9f\n", approx1);

% Combination2: Use Simpson's 3/8 rule over the first two and last two panels
% [3/8, 1/3, 3/8]
sum38 = 3/8 * h * (fx(1) + 3*fx(2) + 3*fx(3) + fx(4)); 
sum13 = h/3 * (fx(4) + 4*fx(5) + fx(6)); 
sum38_2 = 3/8 * h * (fx(6) + 3*fx(7) + 3*fx(8) + fx(9));
approx2 = sum13 + sum38 + sum38_2;
fprintf("Approximate Value of Combination2 [3/8, 1/3, 3/8]:%.9f\n", approx2);

% Combination3: Use Simpson's 3/8 rule over the middle and last two panels
% [3/8, 3/8, 1/3]
sum38 = 3/8 * h * (fx(1) + 3*fx(2) + 3*fx(3) + fx(4)); 
sum38_2 = 3/8 * h * (fx(4) + 3*fx(5) + 3*fx(6) + fx(7)); 
sum13 = h/3 * (fx(7) + 4*fx(8) + fx(9)); 
approx3 = sum13 + sum38 + sum38_2;
fprintf("Approximate Value of Combination3 [3/8, 3/8, 1/3]:%.9f\n", approx3);

% Set "the combinations of using Simpson's 1/3 rule over all the panels" as
% true value
sum13_1 =  h/3 * (fx(1) + 4*fx(2) + fx(3)); 
sum13_2 =  h/3 * (fx(3) + 4*fx(4) + fx(5)); 
sum13_3 =  h/3 * (fx(5) + 4*fx(6) + fx(7)); 
sum13_4 =  h/3 * (fx(7) + 4*fx(8) + fx(9)); 
true = sum13_1 + sum13_2 + sum13_3 + sum13_4;
fprintf("True Value Calculated with Simpson 1/3 rule: %.9f\n", true)
