function [c, L, D] = inventory(Q, T, d, s, N)
    % Simulates inventory by Monte Carlo method
    % Q: Delivery quantity of gasoline in gallons
    % T: Time between deliveries in days
    % d: Delivery cost in dollars per delivery
    % s: Storage cost per gallon per day
    % N: Number of days to run the simulation
    % Returns [average daily cost, number of days with unfilled demands, amount of unfilled demand in gallons]
    
    K = N; % K: Days remaining in the simulation
    I = 0; % I: Current inventory in gallons
    C = 0; % C: Total running cost
    L = 0; % L: Number of days with unfilled demands
    D = 0; % D: Amount of unfilled demand in gallons
    flag = 0; % flag: An indicator used to terminate the algorithm
    while flag == 0
        % Begin the next inventory cycle with a delivery
        I = I + Q; % Add delivery quantity to current inventory
        C = C + d; % Add delivery cost to running cost
        if T >= K % Determine if the simulation will terminate during this cycle
            T = K; % If we will stop the simulation before the next delivery, we reduce
                   % the cycle time to be the number of days left in the simulation
            flag = 1; % Stop the loop after this iteration
        end
        for i = 1:T % Simulate each day in the inventory cycle (or portion remaining)
            x_i = rand(); % A random number in the interval [0, 1]
            q_i = demand(x_i); % A daily demand (from cubic splines)
            if q_i > I % If there is not enough inventory to meet demand
                L = L + 1; % Increment the number of days with unfilled demands
                D = D + (q_i - I); % Increase amount of unfilled demands by deficit
            end
            I = I - q_i; % Deduct the demand from the current inventory
            if I <= 0 % Determine if the inventory has been depleted
                I = 0; % We cannot have negative inventory
            else
                C = C + I * s; % Any gasoline remaining in inventory needs to be stored, so add storage cost to running cost
            end
            K = K - 1; % Decrement the number of days remaining in the simulation
        end
    end
    c = C/N; % Return average daily cost
end