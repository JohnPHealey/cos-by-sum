function [double_res, single_res] = cos_by_sum(x)
    format LONG
    x = pi/4 * (x-1);
    curr_term = 0;
    double_res = 0;
    for n = 1:50
        display(n)
        temp = (-1)^n * x^(2*n) / factorial(2*n);
        double_res = double_res + temp;
        if (abs(temp - curr_term) < 0.000001)
            break;
        end;
        curr_term = temp;
    end;
    
end