tic
d = 500; % Delivery cost
s = 0.001; % Storage cost
N = 365; % Number of days
clf
[min_cost min_Q min_T] = optimize(d, s, N, true);
fprintf("Delivery cost: %d\nStorage cost: %.3f\nDays simulated: %d\nMinimum average daily cost: $%.2f\nDelivery quantity: %d\nTime between deliveries: %d\n", d, s, N, min_cost, min_Q, min_T);
toc