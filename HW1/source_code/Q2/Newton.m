function [x1,N] = Newton(f, df, x0, k, tol, save)
N = 1;
X(1) = x0;
while abs(f(x0)) > tol  
    N = N+1;
    x1 = x0 - k*f(x0)/df(x0);
    if save == 1
        X(N) = x1;
    end
    x0 = x1;
    %fprintf('val = %f\n', abs(f(x0)))
end

if save == 1
    x1 = X;
end