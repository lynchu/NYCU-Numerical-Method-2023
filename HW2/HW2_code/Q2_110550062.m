% Create the tridiagonal matrix in compact storage form
format long;
n = 6;
a1 = -1*ones(n-1, 1); % subdiagonal
a2 = 4*ones(n, 1); % diagonal
a3 = -1*ones(n-1, 1); % superdiagonal
b = [100; 200*ones(n-2, 1); 100];

% (a) Algorithm for solving a symmetric tridiagonal system
% forward substitution
for k = 2:n 
    m = a1(k-1) / a2(k-1);
    a2(k) = a2(k) - m*a3(k-1);
    b(k) = b(k) - m*b(k-1);
end

x = zeros(n, 1);
x(n) = b(n) / a2(n);
% backward substitution
for k = n-1:-1:1
    x(k) = (b(k) - a3(k)*x(k+1)) / a2(k);
end

% Solution vector
disp('Solution:');
disp(x);

