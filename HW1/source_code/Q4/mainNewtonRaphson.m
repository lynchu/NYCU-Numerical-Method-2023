fn = @(v) [v(1)-3*v(2)-v(3)^2+3 ; 2*v(1)^3+v(2)-5*v(3)^2+2 ; 4*v(1)^2+v(2)+v(3)-7];
jacob_fn = @(v) [1 -3 -2*v(3);6*v(1)^2 1 -10*v(3);8*v(1) 1 1];
error = 10^-5 ;
x_init = 2.5;
y_init = 1;
z_init = -0.2;
no_itr = 20 ;
roots = [];
fprintf('      Iteration|    x     |     y      |    z      | Error      | \n')

start = 200;
distance = -0.2;
theand = 150;

for xi = -1.865:-0.001:-1.875
    for yi = 3.1:-0.001:3
        for zi = 15:0.1:25
            x_init = xi;
            y_init = yi;
            z_init = zi;
            v = [x_init;y_init;z_init] ;
            %fprintf("\n%f %f %f",v(1),v(2),v(3))
            [v1,no_itr,norm1,success,exists,roots]=NewtonRaphson_nl_print(v,fn,jacob_fn,no_itr,error,roots);
            if success == 1
                new = [v1(1) v1(2) v1(3)];
                if exists==0
                    roots = [roots;new];
                end
                %s= size(roots);
                %display(size(roots));
                %display(s(2))
                %for j = 1:s(1)
                %    fprintf("%f %f %f",roots(j,1),roots(j,2),roots(j,3));
                %end
            end
            
        end
    end
end
s = size(roots);
for j = 1:s(1)
    fprintf("\n%f %f %f",roots(j,1),roots(j,2),roots(j,3));
end
fprintf("\n");