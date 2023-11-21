% Define the bandwidth and matrix size
W = 1;
N = 6;
% Define the vector b
b = [100; 200; 200; 200; 200; 100];
% Create a banded matrix A
diagonal = 4*ones(N,1);
upper_diagonal = -1*ones(N-1,1);
upper_diagonal = [upper_diagonal; 0];
lower_diagonal = -1*ones(N-1,1);
lower_diagonal = [0; lower_diagonal];
A = spdiags([upper_diagonal diagonal lower_diagonal], -W:W, N, N);
disp(A);
% Solve the linear system using the banded matrix solver
x = banded_matrix_solver(A, b, W);
disp(x);

function x = banded_matrix_solver(A, b, W)
% Get the size of the matrix A and Set up the output vector x
N = size(A, 1);
x = zeros(N, 1);
% Factor the matrix A into the product of two triangular matrices L and U,
for k = 1:N-1
    for i = k+1:min(k+W,N)
        A(i,k) = A(i,k) / A(k,k);
        for j = k+1:min(k+W,N)
            A(i,j) = A(i,j) - A(i,k)*A(k,j);
        end
    end
end
% Solve the lower triangular system Lx = b using forward substitution
for i = 1:N
    x(i) = b(i);
    for j = max(1,i-W):i-1
        x(i) = x(i) - A(i,j)*x(j);
    end
end
% Solve the upper triangular system Ux = y using backward substitution
for i = N:-1:1
    for j = i+1:min(i+W,N)
        x(i) = x(i) - A(i,j)*x(j);
    end
    x(i) = x(i) / A(i,i);
end
end