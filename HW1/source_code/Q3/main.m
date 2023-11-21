clear all;
clf;
save = 1;
f = inline('x.^3 - 4','x');
df = inline('3*x.^2', 'x');
ddf = inline('6*x', 'x');
%g = inline('(4+2*x.^3)/x.^2 - 2*x', 'x');
g = inline('2/(x.^(1/2))', 'x');
%g = inline('(16+x.^3)/(5*x.^2)', 'x');
x0 = -0.00001;
tol = 0.00001;
[Xn, N] = Newton(f,g,x0,tol,save);
dg = f(Xn(N))*ddf(Xn(N))/(df(Xn(N))*df(Xn(N)));
fprintf("dg = %f\n", dg)

X = linspace(Xn(1),Xn(N),100);
Y = f(X);
for i=1:N-1
    clf;
    plot(X,Y);
    hold on;
    line([Xn(i), Xn(i+1)],[f(Xn(i)), 0]);
    plot(Xn(i), f(Xn(i)), 'ro');
    plot(Xn(i+1), 0, 'r*');
    grid;
    fprintf('root = %f\n', Xn(i+1)); 
    pause();
end