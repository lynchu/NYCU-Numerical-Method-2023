function [x1, xa, xb, N] = bisection(f, a, b, tol, save)
N = 1;
X(1) = (a+b)/2;
A(1) = a;
B(1) = b;
while abs(f((a+b)/2)) > tol
    N = N+1;
    m = (a+b)/2;
    if (f(a)*f(m)<0)
        b = m;
    else 
        a = m;
    end
    if save==1
        X(N) = m;
        A(N) = a;
        B(N) = b;
    end
end

if save == 1
    x1 = X;
    xa = A;
    xb = B;
end