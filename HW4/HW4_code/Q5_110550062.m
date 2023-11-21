f = @(x) 1/x^2;
a = 0.2;
b = 1;
n = 2;
integral_sum = 1;
new_integral_sum = 0;

while(abs(new_integral_sum - integral_sum) > 0.02)
    integral_sum = new_integral_sum;
    new_integral_sum = 0;
    h = (b-a)/n;
    for i= 0 : n-1 
        new_integral_sum = new_integral_sum + h/2*(f(a + i*h) + f(a + (i+1)*h));
    end
    n = n*2;
end

fprintf("The Value of Integral Sum is %.5f while h = %.4f\n", new_integral_sum, h);