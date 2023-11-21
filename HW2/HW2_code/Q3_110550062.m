A = [4.63 -1.21 3.22; -3.07 5.48 2.11; 1.26 3.11 4.57];
b = [2.22; -3.17; 5.11];

% Part (a): Solve using the Jacobi method
D = diag(diag(A));
L = tril(A,-1);
U = triu(A,1);
%inv_D = inv(D);

% Set the initial guess vector
x = [0; 0; 0];

% Iterate until convergence or max number of iterations
max_iter = 5000;
tol = 1e-7;
for iter=1:max_iter
    x_new = D \ (b - L * x - U * x); % D\ same as inv(D)
    if norm(x_new - x) < tol
        break;
    end
    x = x_new;
end

% Print the solution vector
disp(['Jacobi method: ' num2str(x_new')]);

% Part (b): Solve using the Gauss-Seidel method
D = diag(diag(A));
L = tril(A,-1);
U = triu(A,1);
DL = D + L;
%inv_DL = inv(DL);

% Set the initial guess vector
x = [0; 0; 0];

% Iterate until convergence or max number of iterations
max_iter = 1000;
tol = 1e-7;
w = 1.0;
for iter=1:max_iter
    x_new = DL \ (b - U * x_new);
    if norm(x_new - x) < tol
        break;
    end
    x = x_new;
end

% Print the solution vector
disp(['Gauss-Seidel method: ' num2str(x_new')]);
disp('iteration: ' iter);