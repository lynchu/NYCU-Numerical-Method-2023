% Given system of linear equations
A = [2.51, 1.48, 4.53; 1.48, 0.93, -1.30; 2.68, 3.04, -1.48];
b = [0.05; 1.03; -0.53];

% Part (a) - Gaussian elimination without interchanges
format long
B = [A b];
n = length(b);
for k = 1:n-1
    for i = k+1:n
        factor = B(i,k)/B(k,k);
        for j = k+1:n
            B(i,j) = B(i,j) - factor*B(k,j);
        end
        B(i,n+1) = B(i,n+1) - factor*B(k,n+1);
    end
end
x_a = zeros(n,1);
x_a(n) = B(n,n+1) / B(n,n);
for i = n-1:-1:1
    x_a(i) = (B(i,n+1) - B(i,i+1:n)*x_a(i+1:n)) / B(i,i);
end

% Part (b) - Gaussian elimination with partial pivoting
C = [A b];
n = length(b);
for k = 1:n-1
    [~,p] = max(abs(C(k:n,k)));
    p = p + k - 1;
    if p ~= k
        C([k,p],:) = C([p,k],:);
    end
    for i = k+1:n
        factor = C(i,k)/C(k,k);
        for j = k+1:n
            C(i,j) = C(i,j) - factor*C(k,j);
        end
        C(i,n+1) = C(i,n+1) - factor*C(k,n+1);
    end
end
x_b = zeros(n,1);
x_b(n) = C(n,n+1) / C(n,n);
for i = n-1:-1:1
    x_b(i) = (C(i,n+1) - C(i,i+1:n)*x_b(i+1:n)) / C(i,i);
end

% Part (c) - Gaussian elimination with partial pivoting and chopping
D = [A b];
n = length(b);
for k = 1:n-1
    [~,p] = max(abs(D(k:n,k)));
    p = p + k - 1;
    if p ~= k
        D([k,p],:) = D([p,k],:);
    end
    for i = k+1:n
        factor = D(i,k)/D(k,k);
        for j = k+1:n
            D(i,j) = D(i,j) - factor*D(k,j);
        end
        D(i,n+1) = D(i,n+1) - factor*D(k,n+1);
    end
end
x_c = zeros(n,1);
x_c(n) = D(n,n+1) / D(n,n);
for i = n-1:-1:1
    x_c(i) = (D(i,n+1) - D(i,i+1:n)*x_c(i+1:n)) / D(i,i);
end
x_c = fix(x_c*1000)/1000;

% Part (d) - Substituting solutions
rhs_a = A*x_a;
rhs_b = A*x_b;
rhs_c = A*x_c;
disp("Part (a) - Gaussian elimination without interchanges")
disp("Solution:")
disp(x_a')
disp("RHS values:")
disp(rhs_a')
disp("Part (b) - Gaussian elimination with partial pivoting")
disp("Solution:")
disp(x_b')
disp("RHS values:")
disp(rhs_b')
disp("Part (c) - Gaussian elimination with partial pivoting and chopping")
disp("Solution:")
disp(x_c);
% fprintf("\t%3f\t%3f\t%3f\n", x_c(1), x_c(2), x_c(3));
disp("RHS values:")
disp(rhs_c')

