tic
d = 500; % Delivery cost
s = 0.001; % Storage cost
N = 365; % Number of days
trials = 1000;
results = zeros(trials, 3);
for i = 1:trials
    fprintf("Performing simulation %d of %d (%.2f%%)...\n", i, trials, (i / trials) * 100);
    [min_cost min_Q min_T] = optimize(500, 0.001, 365, false);
    results(i, :) = [min_cost, min_Q, min_T];
end
format bank
results
summary(results)
clf
figure(1)
histogram(results(:, 1), 25)
xlabel("Minimum cost")
ylabel("Frequency")
title("Frequency histogram of minimum cost")
toc