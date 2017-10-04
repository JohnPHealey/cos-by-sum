function [double_res, single_res] = cos_by_sum(x)
    format LONG
    x = pi/4 * (x-1);
    curr_term = 0;
    double_res = 0;
    denom = 2
    for n = 1:50
        %display(n)
        if n > 1
            denom = 2*n*(2*n-1)*denom;
        end;
        temp = (-1)^n * x^(2*n) / denom;
        double_res = double_res + temp;
        if (abs(temp - curr_term) < 0.00001)
            break;
        end;
        curr_term = temp;
    end;
    
end