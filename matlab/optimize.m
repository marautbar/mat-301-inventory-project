function [min_cost, min_Q, min_T] = optimize(d, s, N, plots)
    % Finds optimum delivery quantity in gallons and time between deliveries in days to minimize average daily cost
    % d: Delivery cost in dollars per delivery
    % s: Storage cost per gallon per day
    % N: Number of days to run the simulation
    % plots: Whether to show surface plots or not
    % Returns [minimum cost, quantity, time]
    
    % Q: Delivery quantity of gasoline in gallons
    Q = 3000:500:60000;

    % T: Time between deliveries in days
    T = 3:1:30;
    
    % Build the cost matrix from the inventory function
    % We need to use a nested for loop instead of a vectorized function to avoid a MATLAB warning

    cost = zeros(length(Q), length(T));
    unfilled_days = zeros(length(Q), length(T));
    unfilled_gallons = zeros(length(Q), length(T));
    cost_remove_unfilled = zeros(length(Q), length(T));

    for i = 1:length(Q)
        for j = 1:length(T)
            [cost(i, j) unfilled_days(i, j) unfilled_gallons(i, j)] = inventory(Q(i), T(j), d, s, N);
            if unfilled_days(i, j) > 0
                cost_remove_unfilled(i, j) = NaN;
            else
                cost_remove_unfilled(i, j) = cost(i, j);
            end
        end
    end

    if plots
        % Plot cost surface as a function of Q and T

        [TT, QQ] = meshgrid(T, Q);

        figure(1)
        surf(QQ, TT, cost)
        colormap turbo
        xlabel("Gallons per delivery")
        ylabel("Time between deliveries")
        zlabel("Average daily cost")
        title("Minimum cost vs. quantity and period of deliveries")

        figure(2)
        surf(QQ, TT, unfilled_days)
        colormap turbo
        xlabel("Gallons per delivery")
        ylabel("Time between deliveries")
        zlabel("Number of days with unfilled demands")
        title("Days with unfilled demands vs. quantity and period of deliveries")

        figure(3)
        surf(QQ, TT, unfilled_gallons)
        colormap turbo
        xlabel("Gallons per delivery")
        ylabel("Time between deliveries")
        zlabel("Amount of unfilled demands in gallons")
        title("Gallons of unfilled demands vs. quantity and period of deliveries")

        figure(4)
        surf(QQ, TT, cost_remove_unfilled)
        colormap turbo
        xlabel("Gallons per delivery")
        ylabel("Time between deliveries")
        zlabel("Average daily cost")
        title("Minimum cost vs. quantity and period of deliveries (unfilled demands removed)")
    end

    % Find minimum cost among those with no unfilled demands
    min_cost = min(min(cost_remove_unfilled));
    [min_i min_j] = find(cost_remove_unfilled == min_cost);
    min_Q = Q(min_i);
    min_T = T(min_j);
end