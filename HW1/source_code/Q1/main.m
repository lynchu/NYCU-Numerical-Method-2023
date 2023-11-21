clear all;
clf;
save = 1;
f = inline('x.*x + sin(x) - exp(x)/4 - 1','x');
df = inline('2*x + cos(x) - exp(x)/4', 'x');
x0 = -2;
tol = 1e-5;

%[Xn, Xa, Xb, N] = bisection(f, 0, 2, tol, save);
[Xn, N] = secant(f, -2, 0, tol, save);
%[Xn, N] = newton(f,df,x0,tol,save);
X = linspace(Xn(1),1,100);
Y = f(X);
for i=1:N-2
    clf;
    plot(X,Y);
    hold on;
    line([Xn(i), Xn(i+1)],[f(Xn(i)), f(Xn(i+1))]);
    plot(Xn(i+2), f(Xn(i+2)), 'ro');
    plot(Xn(i+2), 0, 'r*');
    grid;
    fprintf('(N=%i)  root = %f\n', i, Xn(i+2));    
    pause();
end
