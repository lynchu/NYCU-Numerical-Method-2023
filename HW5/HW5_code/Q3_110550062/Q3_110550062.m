%% (a)
fprintf("---(a)---\n");
y = [0 1 0];

[t1,y1] = ode45('vdp', [0 0.2], y);
[t2,y2] = ode45('vdp', [0 0.4], y);
[t3,y3] = ode45('vdp', [0 0.6], y);

fprintf("y(0.2) = %f\n", y1(end,1));
fprintf("y(0.4) = %f\n", y2(end,1));
fprintf("y(0.6) = %f\n", y3(end,1));

%% (b)
fprintf("\n---(b)---\n");
% compute f
f0 = vdp(0,y)';
f1 = vdp(0.2,y1(end,:))';
f2 = vdp(0.4,y2(end,:))';
f3 = vdp(0.6,y3(end,:))';

% first, compute y0.8 using predictor
y4_p = y3(end,:) + 0.2/24*(55*f3-59*f2+37*f1-9*f0);
% compute derivative f0.8
f4 = vdp(0.8,y4_p(end,:))';
% recompute y0.8 using corrector
y4_c = y3(end,:) + 0.2/24*(9*f4+19*f3-5*f2+f1);

fprintf("y0.8 from predictor: (%f, %f, %f)\n", y4_p);
fprintf("f0.8               : (%f, %f, %f)\n", f4);
fprintf("y0.8 from corrector: (%f, %f, %f)\n", y4_c);

% first, compute y1.0 using predictor
y5_p = y4_p(end,:) + 0.2/24*(55*f4-59*f3+37*f2-9*f1);
% compute derivative f1.0
f5 = vdp(1.0,y5_p(end,:))';
% recompute y1.0 using corrector
y5_c = y4_p(end,:) + 0.2/24*(9*f5+19*f4-5*f3+f2);

fprintf("\ny1.0 from predictor: (%f, %f, %f)\n", y5_p);
fprintf("f1.0               : (%f, %f, %f)\n", f5);
fprintf("y1.0 from corrector: (%f, %f, %f)\n", y5_c);

function dy=vdp(t,y)
    dy = [y(2) y(3) y(1)*2-t*y(2)+t]';
end
