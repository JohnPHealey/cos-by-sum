function [double_res, single_res] = cos_by_sum(x)
    format LONG
    x = x * (pi/180);
    n = 50;
    n_range = 0:n;
    exponents = n_range .* 2;
    
    %create 1/(2n)! vector
    coeffs = factorial(exponents) .^ -1;
    coeffs_single = single(factorial(exponents)) .^ -1;
    
    %create (-1) ^ n vector
    ones_matrix = ones(n+1);
    ones_vector = ones_matrix(1, :);
    signs = (ones_vector .* -1) .^ n_range;
    
    %create (-1)^n / (2n)! vector
    coeffs = coeffs .* signs;
    coeffs_single = coeffs_single .* signs;
    
    x = (pi/4) * (x-1);
    inner = coeffs .* (x .^ exponents);
    inner_single = coeffs_single .* single(single(x) .^ exponents)
    %inner_single(isnan(inner_single)) = []
    %inner_single(isinf(inner_single)) = []
    double_res = sum(inner);
    single_res = sum(inner_single);
end