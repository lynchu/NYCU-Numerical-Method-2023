function [x1, N] = newton(f, df, x0, tol, save)
N = 1;
X(1) = x0;
while abs(f(x0)) > tol   
    N = N+1;
    x1 = x0 - f(x0)/df(x0);
    if save == 1
        X(N) = x1;
    end
    x0 = x1;
end

if save == 1
    x1 = X;
end