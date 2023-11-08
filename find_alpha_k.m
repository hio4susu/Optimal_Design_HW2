function alpha_k = find_alpha_k(fun, x_k, gradf)
    initial_alpha_guess = 0.1;
    options = optimset('Display', 'off');
    f_alpha = @(alpha) fun(x_k - alpha * gradf);
    alpha_k = fminsearch(f_alpha, initial_alpha_guess, options);
end