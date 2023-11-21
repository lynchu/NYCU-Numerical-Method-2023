function [xn, N] = secant(f, x0, x1, tol, save)
N = 2;
X(1) = x0;
X(2) = x1;
x2 = x1;
while abs(f(x2)) > tol
    N = N+1;
    x2 = x1 - f(x1)*(x0-x1)/(f(x0)-f(x1));
    if (f(x0)*f(x2)<0)
        x1 = x2;
    else 
        x0 = x2;
    end
    if save==1
        X(N) = x2;
    end
end

if save == 1
    xn = X;
end