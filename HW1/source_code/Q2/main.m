clear all;
clf;
save = 1;
x0 = 3;
k=3;
tol = 10^(-7);

p = inline('x.^5 - 14*x.^4 + 76*x.^3 - 200*x.^2 + 256*x - 128','x');
dp = inline('5*x.^4 - 56*x.^3 + 228*x.^2 - 400*x + 256', 'x');
ddp = inline('20*x.^3 - 168*x.^2 + 456*x - 400', 'x');
g = inline('x - 3*(x.^5 - 12*x.^4 + 76*x.^3 - 200*x.^2 + 256*x - 128)/(5*x.^4 - 48*x.^3 + 228*x.^2 - 400*x + 256)', 'x');

[Xn, N] = Newton(p, dp, x0, k, tol, save);
dg = p(Xn(N))*ddp(Xn(N))/dp(Xn(N))*dp(Xn(N));

if abs(dg)<1
    fprintf("dg:%f\t-> Convergence\n", dg);
else
    fprintf("dg:%f\t-> Divergence\n", dg);
end
fprintf("root = %f\n", Xn(N));

X = linspace(Xn(1),Xn(N),100);
Y = p(X);
for i=1:N-1
    clf;
    plot(X,Y);
    hold on;
    line([Xn(i), Xn(i+1)],[p(Xn(i)), 0]);
    plot(Xn(i), p(Xn(i)), 'ro');
    plot(Xn(i+1), 0, 'r*');
    grid;
    fprintf('(N=%i)\terror = g(2) - g(xn) = %f - %f = %f\n', i, g(2), g(Xn(i+1)), g(2)-g(Xn(i+1))); 
    pause();
end