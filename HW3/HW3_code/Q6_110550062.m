syms x


[n,d] = numden(pade(cos(x)^2, 'Order',[3 3]));
disp("The numerator of Pad´e approximations for cos(x)^2 is ");
disp(n);
disp("The denominator of Pad´e approximations for cos(x)^2 is ");
disp(d);

[n,d] = numden(pade(sin(x^4-x), 'Order',[3 3]));
disp("The numerator of Pad´e approximations for sin(x^4-x) is ");
disp(n);
disp("The denominator of Pad´e approximations for sin(x^4-x) is ");
disp(d);


[n,d] = numden(pade(x*exp(x), 'Order',[3 3]));
disp("The numerator of Pad´e approximations for xexp(x) is ");
disp(n);
disp("The denominator of Pad´e approximations for xexp(x) is ");
disp(d);