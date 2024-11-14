 function q = demand(x)
    % Calculates demand based on a random variable x
    % x must be a scalar in the interval [0, 1]
    
    if length(x) > 1
        error('x must be a scalar')
        q = 0;
        return;
    end
    
    if x < 0 | x > 1
        error('x must be in the interval [0, 1]')
        q = 0;
        return;
    end

    % Cubic spline coefficients computed by cubicsplines.m
    splines = [
       % x^3 coefficient        x^2 coefficient        x coefficient          constant term
         7.508262254911285e+05  0                      4.924917377450891e+03  1000                  % S1  [0.00, 0.01)
        -1.501652450982267e+06  6.757436029420185e+04  4.249173774508872e+03  1.002252478676473e+03 % S2  [0.01, 0.03)
         4.518176960804987e+05 -1.082379529414470e+05  9.523543171578338e+03  9.495087847057786e+02 % S3  [0.03, 0.08)
        -4.918918507206453e+03  1.378834559602201e+03  7.542001714944003e+02  1.183357931374684e+03 % S4  [0.08, 0.20)
         2.475988361845712e+03 -3.058109561829099e+03  1.641588995780660e+03  1.124198676422266e+03 % S5  [0.20, 0.40)
         1.407951004512076e+02 -2.558776481556927e+02  5.206962303112980e+02  1.273651045151514e+03 % S6  [0.40, 0.67)
         5.655707448149366e+03 -1.134085146702899e+04  7.947628688956410e+03 -3.850305372792314e+02 % S7  [0.67, 0.85)
         1.196511079204448e+04 -2.742982999396154e+04  2.162326043684908e+04 -4.259792865848703e+03 % S8  [0.85, 0.93)
         3.826482594740238e+05 -1.061635814816684e+06  9.834348263219807e+05 -3.024213782902393e+05 % S9  [0.93, 0.97)
        -5.763402250302850e+05  1.729020675090855e+06 -1.723501968888332e+06  5.728215188277620e+05 % S10 [0.97, 1.00]
    ];
   
    if x < 0.01
        q = polyval(splines(1, :), x);
    elseif x < 0.03
        q = polyval(splines(2, :), x);
    elseif x < 0.08
        q = polyval(splines(3, :), x);
    elseif x < 0.20
        q = polyval(splines(4, :), x);
    elseif x < 0.40
        q = polyval(splines(5, :), x);
    elseif x < 0.67
        q = polyval(splines(6, :), x);
    elseif x < 0.85
        q = polyval(splines(7, :), x);
    elseif x < 0.93
        q = polyval(splines(8, :), x);
    elseif x < 0.97
        q = polyval(splines(9, :), x);
    else
        q = polyval(splines(10, :), x);
    end
end