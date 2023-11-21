% Define the function to interpolate and data points
f = @(x) 1 + log10(x);
x = [0.15 0.21 0.23 0.27 0.32 0.35];
fx = f(x);
format short

% Compute the divided difference table
n = length(x);
D = zeros(n, n);
D(:, 1) = fx;
for j = 2:n
  for i = 1:n-j+1
    D(i,j) = (D(i+1,j-1) - D(i,j-1))/(x(i+j-1) - x(i));
  end
end
disp(D)

% Compute the true value
syms t;
tf = 1 + log10(t);
tfd = diff(tf, t);
true = eval(subs(tfd, t, 0.268));

% Compute the value of f prime at x = 0.268 using a quadratic
% interpolating polynomial that fits the table at the three points
% that provide the most accurate answer
est = Inf;
dif = Inf;
start = 1;
s = 0.268;
for idx = 1:4
    tmp = D(idx,2)+D(idx,3)*((s-x(idx))+(s-x(idx+1)));
    tmpd = abs(true - tmp);
    if(tmpd<dif)
        dif = tmpd;
        est = tmp;
        start = idx;
    end
end

% Display the three points that provide the most accurate answer
fprintf("From a quadratic polynomial start from x = %f, 𝑓′(0.268) = %.4f\n", x(start), est);