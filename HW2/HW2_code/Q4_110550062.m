A = [4.63, -1.21, 3.22; -3.07, 5.48, 2.11; 1.26, 3.11, 4.57];
b = [2.22; -3.17; 5.11];
x = [0; 0; 0];

tol = 1e-7;  % convergence tolerance
max_iter = 5000;  % maximum number of iterations
w_vals = 1:0.001:2;
conv_iters = zeros(size(w_vals));

for j = 1:length(w_vals)
    w = w_vals(j);
    x_new = [0; 0; 0];
    
    for iter = 1:max_iter
        x = x_new;
        for i = 1:length(b)
            x_new(i) = x(i) + w*(b(i) - A(i,1:i-1)*x_new(1:i-1) - A(i,i:end)*x(i:end))/A(i,i);
        end
        if (norm(x_new - x) < tol)  % check for convergence
            conv_iters(j) = iter;
            break;
        end
        if (norm(x_new - x) >= tol && iter==max_iter)  % check for convergence
            conv_iters(j) = inf;
            break;
        end
    end
end
conv_iters(conv_iters==0)=inf;
% disp(conv_iters);
[min_iters, min_idx] = min(conv_iters);  % find minimum number of iterations and index of optimal w
optimal_w = w_vals(min_idx);

fprintf('Optimal overrelaxation factor: %f\n', optimal_w);
fprintf('Converges in %d iterations\n', min_iters);
