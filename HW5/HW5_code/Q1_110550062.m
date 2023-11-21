f = @(y,t) (y.^2+t.^2);
t_start = 1;
t_end = 2;
h1 = 0.1;
h2 = 0.05;

fprintf("---h=0.1---\n");
t1 = [1];
y1 = [0];
n = (t_end - t_start)/h1;
fprintf("t%d=%f, y%d=%f\n",0, t1(1), 0, y1(1));
for i=1:1:n
    y1(i+1) = y1(i) + h1 * f(y1(i),t1(i));
    t1(i+1) = t1(i)+h1;
    fprintf("t%d=%f, y%d=%f\n",i, t1(i+1), i, y1(i+1));
end

fprintf("\n---h=0.05---\n");
t2 = [1];
y2 = [0];
n = (t_end - t_start)/h2;
fprintf("t%d=%f, y%d=%f\n",0, t2(1), 0, y2(1));
for i=1:1:n
    y2(i+1) = y2(i) + h2 * f(y2(i),t2(i));
    t2(i+1) = t2(i)+h2;
    fprintf("t%d=%f, y%d=%f\n",i, t2(i+1), i, y2(i+1));
end

fprintf("\n---error with Romberg Integration---\n");
error = abs(y2(end)-y1(end))/(2^2-1);
fprintf("%f\n", error);