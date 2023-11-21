% function [x, u]=shooting(u0)

% Secant method for finding the root of P(v) = u(3,v) + 1 = 0
% where u(x,v) is the solution curve u(x) obtained with initial velocity v
% u(3,v) is then a curve when x=3. 
% The first output argument is the function valuae P(v)
function [P, x, U] = shooting(U0, h)
[x, U] = rkf(U0, h);
% P = u(3, v) + 1; v = U0(2);
P = U(length(x),1) + 1; 

function [x, U] = rkf(U0, h)
    tspan = 0:h:3.2;
    [x, U] = ode45(@F, tspan, U0);
% Set U = [u
%          u'];
% dU/dx = f(x,U)
function dUdx = F(x,U)
dUdx = [ U(2) 
        -U(1)/4];
