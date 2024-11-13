x = [0, 0.01 0.03 0.08 0.2 0.4 0.67 0.85 0.93 0.97 1];
q = [1000, 1050:100:1850 2000];
A = zeros(40, 40);

% Set adjacent functions equal to the q values at the endpoints

A(1, 1:4) = [x(1).^3 x(1).^2 x(1) 1];
A(2, 1:4) = [x(2).^3 x(2).^2 x(2) 1];
A(3, 5:8) = [x(2).^3 x(2).^2 x(2) 1];
A(4, 5:8) = [x(3).^3 x(3).^2 x(3) 1];
A(5, 9:12) = [x(3).^3 x(3).^2 x(3) 1];
A(6, 9:12) = [x(4).^3 x(4).^2 x(4) 1];
A(7, 13:16) = [x(4).^3 x(4).^2 x(4) 1];
A(8, 13:16) = [x(5).^3 x(5).^2 x(5) 1];
A(9, 17:20) = [x(5).^3 x(5).^2 x(5) 1];
A(10, 17:20) = [x(6).^3 x(6).^2 x(6) 1];
A(11, 21:24) = [x(6).^3 x(6).^2 x(6) 1];
A(12, 21:24) = [x(7).^3 x(7).^2 x(7) 1];
A(13, 25:28) = [x(7).^3 x(7).^2 x(7) 1];
A(14, 25:28) = [x(8).^3 x(8).^2 x(8) 1];
A(15, 29:32) = [x(8).^3 x(8).^2 x(8) 1];
A(16, 29:32) = [x(9).^3 x(9).^2 x(9) 1];
A(17, 33:36) = [x(9).^3 x(9).^2 x(9) 1];
A(18, 33:36) = [x(10).^3 x(10).^2 x(10) 1];
A(19, 37:40) = [x(10).^3 x(10).^2 x(10) 1];
A(20, 37:40) = [x(11).^3 x(11).^2 x(11) 1];

% Set adjacent first derivatives equal to each other at the endpoints

A(21, 1:8) = [3.*x(2).^2 2.*x(2) 1 0 -3.*x(2).^2 -2.*x(2) -1 0];
A(22, 5:12) = [3.*x(3).^2 2.*x(3) 1 0 -3.*x(3).^2 -2.*x(3) -1 0];
A(23, 9:16) = [3.*x(4).^2 2.*x(4) 1 0 -3.*x(4).^2 -2.*x(4) -1 0];
A(24, 13:20) = [3.*x(5).^2 2.*x(5) 1 0 -3.*x(5).^2 -2.*x(5) -1 0];
A(25, 17:24) = [3.*x(6).^2 2.*x(6) 1 0 -3.*x(6).^2 -2.*x(6) -1 0];
A(26, 21:28) = [3.*x(7).^2 2.*x(7) 1 0 -3.*x(7).^2 -2.*x(7) -1 0];
A(27, 25:32) = [3.*x(8).^2 2.*x(8) 1 0 -3.*x(8).^2 -2.*x(8) -1 0];
A(28, 29:36) = [3.*x(9).^2 2.*x(9) 1 0 -3.*x(9).^2 -2.*x(9) -1 0];
A(29, 33:40) = [3.*x(10).^2 2.*x(10) 1 0 -3.*x(10).^2 -2.*x(10) -1 0];

% Set adjacent second derivatives equal to each other at the endpoints

A(30, 1:8) = [6.*x(2) 2 0 0 -6.*x(2) -2 0 0];
A(31, 5:12) = [6.*x(3) 2 0 0 -6.*x(3) -2 0 0];
A(32, 9:16) = [6.*x(4) 2 0 0 -6.*x(4) -2 0 0];
A(33, 13:20) = [6.*x(5) 2 0 0 -6.*x(5) -2 0 0];
A(34, 17:24) = [6.*x(6) 2 0 0 -6.*x(6) -2 0 0];
A(35, 21:28) = [6.*x(7) 2 0 0 -6.*x(7) -2 0 0];
A(36, 25:32) = [6.*x(8) 2 0 0 -6.*x(8) -2 0 0];
A(37, 29:36) = [6.*x(9) 2 0 0 -6.*x(9) -2 0 0];
A(38, 33:40) = [6.*x(10) 2 0 0 -6.*x(10) -2 0 0];

% Natural splines

A(39, 2) = 2;
A(40, 37:38) = [6.*x(11) 2];

% Solve the matrix-vector equation to get the coefficient vector c

b = [q(1) q(2) q(2) q(3) q(3) q(4) q(4) q(5) q(5) q(6) q(6) q(7) q(7) q(8) q(8) q(9) q(9) q(10) q(10) q(11) zeros(1, 20)]';
c = A\b;

% Plot original data points

plot(x, q, 'ro')

% Plot the splines

hold on
X = x(1):0.001:x(2);
plot(X, polyval(c(1:4), X), 'b-')
X = x(2):0.001:x(3);
plot(X, polyval(c(5:8), X), 'b-')
X = x(3):0.001:x(4);
plot(X, polyval(c(9:12), X), 'b-')
X = x(4):0.001:x(5);
plot(X, polyval(c(13:16), X), 'b-')
X = x(5):0.001:x(6);
plot(X, polyval(c(17:20), X), 'b-')
X = x(6):0.001:x(7);
plot(X, polyval(c(21:24), X), 'b-')
X = x(7):0.001:x(8);
plot(X, polyval(c(25:28), X), 'b-')
X = x(8):0.001:x(9);
plot(X, polyval(c(29:32), X), 'b-')
X = x(9):0.001:x(10);
plot(X, polyval(c(33:36), X), 'b-')
X = x(10):0.001:x(11);
plot(X, polyval(c(37:40), X), 'b-')
hold off
xlabel("x, random variable")
ylabel("q, demand")
legend("Cumulative probabilities", "Cubic splines")
legend("location", "northwest")
title("Cubic spline interpolation of x and q")

% Display the spline polynomials

fprintf("S1: %.4fx^3 + %.4fx^2 + %.4fx + %.4f, for [%.2f, %.2f)\n\n", c(1:4), x(1:2))
fprintf("S2: %.4fx^3 + %.4fx^2 + %.4fx + %.4f, for [%.2f, %.2f)\n\n", c(5:8), x(2:3))
fprintf("S3: %.4fx^3 + %.4fx^2 + %.4fx + %.4f, for [%.2f, %.2f)\n\n", c(9:12), x(3:4))
fprintf("S4: %.4fx^3 + %.4fx^2 + %.4fx + %.4f, for [%.2f, %.2f)\n\n", c(13:16), x(4:5))
fprintf("S5: %.4fx^3 + %.4fx^2 + %.4fx + %.4f, for [%.2f, %.2f)\n\n", c(17:20), x(5:6))
fprintf("S6: %.4fx^3 + %.4fx^2 + %.4fx + %.4f, for [%.2f, %.2f)\n\n", c(21:24), x(6:7))
fprintf("S7: %.4fx^3 + %.4fx^2 + %.4fx + %.4f, for [%.2f, %.2f)\n\n", c(25:28), x(7:8))
fprintf("S8: %.4fx^3 + %.4fx^2 + %.4fx + %.4f, for [%.2f, %.2f)\n\n", c(29:32), x(8:9))
fprintf("S9: %.4fx^3 + %.4fx^2 + %.4fx + %.4f, for [%.2f, %.2f)\n\n", c(33:36), x(9:10))
fprintf("S10: %.4fx^3 + %.4fx^2 + %.4fx + %.4f, for [%.2f, %.2f)", c(37:40), x(10:11))