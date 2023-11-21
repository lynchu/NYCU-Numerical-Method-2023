% Define the given difference table
format long
x = [0.12 0.24 0.36 0.48 0.60 0.72];
f = [0.79168 0.77334 0.74371 0.70413 0.65632 0.60228];
df = [-0.01834 -0.02963 -0.03958 -0.04781 -0.05404 0];
d2f = [-0.01129 -0.00995 -0.00823 -0.00623 0 0];
d3f = [0.00134 0.00172 0.00200 0 0 0];
d4f = [0.00038 0.00028 0 0 0 0];

% Part(a): Estimate f(0.231) from the Newton-Gregory polynomial of degree-2 with x0=0.12.
x0 = 0.12;
h = x(2) - x(1);
s = (0.231 - x0) / h;
N2 = f(1) + s*df(1) + (s*(s-1)/2)*d2f(1);
disp("The estimate of f(0.231) using Newton-Gregory polynomial of degree 2 with x0=0.12 is ");
disp(N2);

% Part(b): Add one term to part (a) to get f(0.231) from the third-degree polynomial.
%d3f_0_12 = d3f(1);
N3 = N2 + (s*(s-1)*(s-2)/6)*d3f(1) ;
disp('The estimate of f(0.231) using third-degree polynomial is ');
disp(N3);

% Part(c): Estimate the errors of both parts (a) and (b).
% error = (f^(n+1)(ξ) / (n+1)!) * h^(n+1)
% Error in N2
N4 = N3 + (s*(s-1)*(s-2)*(s-3)/24)*d4f(1) ;
%disp('The estimate of f(0.231) using fourth-degree polynomial is ');
%disp(N4);
%disp('The error in the estimate of f(0.231) using Newton-Gregory polynomial of degree 2 with x0=0.12 is ');
%disp(abs(N4-N2));
E2 = abs((s*(s-1)/2)*d2f(1)*(0.231 - 0.12)^2*(0.231 - 0.24)/(factorial(2)));
disp('The error in the estimate of f(0.231) using Newton-Gregory polynomial of degree 2 with x0=0.12 is ');
disp(E2);

% Error in N3
%disp('The error in the estimate of f(0.231) using Newton-Gregory polynomial of degree 3 with x0=0.12 is ');
%disp(abs(N4-N3));
E3 = abs((s*(s-1)*(s-2)/6)*d3f(1)*(0.231 - 0.12)^3*(0.231 - 0.24)^2*(0.231 - 0.36)/factorial(3));
disp('The error in the estimate of f(0.231) using Newton-Gregory polynomial of degree 3 with x0=0.12 is ');
disp(E3);

% (d) Is it better to start with x0 = 0.24 or with x0 = 0.36 when getting f(0.42) from a quadratic? Justify your answer.
x0_1 = 0.24;
s_1 = (0.42 - x0_1) / h;
Q2 = f(2) + s_1*df(2) + (s_1*(s_1-1)/2)*d2f(2);
Q4 = Q2 + (s_1*(s_1-1)*(s_1-2)/6)*d3f(2) + (s_1*(s_1-1)*(s_1-2)*(s_1-3)/24)*d4f(2);
E_q1 = abs((s_1*(s_1-1)/2)*d2f(2)*(0.42 - 0.24)^2*(0.42 - 0.36)/(2*factorial(2)));
disp('The error in the estimate of f(0.42) using x0=0.24 in quadratic is ');
%disp(abs(Q4-Q2));
disp(E_q1);

x0_2 = 0.36;
s_2 = (0.42 - x0_2) / h;
%E_q2 = abs((s_2*(s_2-1)/2)*d2f(3)*(0.42 - 0.36)^2*(0.42 - 0.48)/(2*factorial(2)));
P2 = f(3) + s_2*df(3) + (s_1*(s_2-1)/2)*d2f(3);
P4 = P2 + (s_2*(s_2-1)*(s_2-2)/6)*d3f(3) + (s_2*(s_2-1)*(s_2-2)*(s_2-3)/24)*d4f(3);
disp('The error in the estimate of f(0.42) using x0=0.36 in quadratic is ');
%disp(abs(P4-P2));
disp(E_q2);
