function x2 = secant(f, x0, x1, tol, SHOW_PLOT)

if abs(f(x0)) < abs(f(x1)),
    tmp = x0;
    x0 = x1;
    x1 = tmp;
end;

if nargin == 5,
    if SHOW_PLOT,
        if x1 > x0,
            xrange = x0 - (x1-x0)*0.2:(x1-x0)/250:x1 + (x1-x0)*0.2;
        else
            xrange = x1 - (x0-x1)*0.2:(x0-x1)/250:x0 + (x0-x1)*0.2;
        end;
        for i=1:length(xrange),            
            yval(i) = f(xrange(i));
        end;
        figure;        
        hold on;        
        plot(xrange, yval);
        plot(xrange, zeros(length(xrange)));
    end;
end;

i=1;
x2 = x1 - f(x1)*(x0-x1)/(f(x0)-f(x1));
while abs(f(x2)) > tol,
    if SHOW_PLOT,
        if exist('h0', 'var') && ishandle(h0), 
            delete(h0);
            delete(h1);
            delete(h2);
            delete(h3);
            delete(htext);
        end;
        h0 = plot(x0, f(x0), 'o');
        h1 = plot(x1, f(x1), 'o');
        h2 = plot(x2, f(x2), 'o');
        h3 = line([x0, x1], [f(x0), f(x1)]);
        set(h3, 'color', 'r');
        htext = text([x0, x1, x2], [0, 0, 0], {'x_0', 'x_1', 'x_2'});
        set(htext, 'color', 'r');
        disp(sprintf('iteration %d', i));
        [x0, f(x0); x1, f(x1); x2, f(x2)]
        disp('click to continue');
        pause;
    end;    
    x0 = x1;
    x1 = x2;
    x2 = x1 - f(x1)*(x0-x1)/(f(x0)-f(x1));
    i=i+1;
end;

