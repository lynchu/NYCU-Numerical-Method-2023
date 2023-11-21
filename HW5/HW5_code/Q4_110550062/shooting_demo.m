% Demonstration of shooting method.  
% Given a BVP: y" + y/4=0, y(0)=0, y(pi)=2
% Let U = [u1 
%          u2];
%    dU/dx = [du1/dx   = [ y2 
%             du2/dx ]    -y/4]; 
clear all;
% Secant method for finding the root of P(v) = y(pi,v) - 2 = 0
% where y(x,v) is the solution curve y(x) obtained with initial velocity v
SHOW_PLOT = 0;
U3 = secant(@shooting, [0, 0], [0, 1], 1e-5, SHOW_PLOT);
% In this root finding problem, the root is found in one step.
fprintf("U3(2):%f\n", U3(2));
% Plot results:
% Ux1: solution u(x) with U1 = [u, u'] = [0, 2/pi]
% Ux2: solution u(x) with U2 = [u, u'] = [0, 1]
% Ux3: solution u(x) with U3 = [u, u'] = [0, root]
% the first output argument of shooting() is only used for root-finding, see shooting.m for the details. 
%[dummy, x, Ux1] = shooting([0, 0]);
%[dummy, x, Ux2] = shooting([0, 1]);
max_h = 0;
U = @(t) 2*sin(t/2);
tol = 0.005;
for h=0.2:-0.01:0.1
    [dummy, x, Ux3] = shooting([0, U3(2)], h);
    flag = 0;
    for i=0:h:pi
        if abs(Ux3(i)-U(i))>tol
            flag = 1;
            break;
        end
    end
    if flag==0
        if h>max_h
            max_h=h;
        end
    end
end


