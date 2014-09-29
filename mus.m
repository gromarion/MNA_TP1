function mus = mus(n, gamma, limit)
	mus = 1 : 4 * limit + 2;
	sigma_plus = 1 / gamma + sqrt(1 / gamma^2 - 1);
	sigma_minus = 1 / gamma - sqrt(1 / gamma^2 - 1);
	ln_sigma_plus = log(sigma_plus);
	ln_sigma_minus = log(sigma_minus);
	ln_sigma_plus_2 = ln_sigma_plus^2;
	ln_sigma_minus_2 = ln_sigma_minus^2;

	mus(1) = -1 / ((pi^2 - ln_sigma_plus_2) - (2 * pi * ln_sigma_plus) * i);
	mus(2) = -1 / ((pi^2 - ln_sigma_minus_2) - (2 * pi * ln_sigma_minus) * i);
	for k = 1 : limit
		mus(4*k - 1) = - 1 / (((2 * k  + 1)^2 * pi^2 - ln_sigma_plus_2) - ((2 * k + 1) * 2 * pi * ln_sigma_plus) * i);
		mus(4*k) = - 1 / (((2 * k  + 1)^2 * pi^2 - ln_sigma_minus_2) - ((2 * k + 1) * 2 * pi * ln_sigma_minus) * i);
		mus(4*k + 1) = - 1 / (((2 * (-k) + 1)^2 * pi^2 - ln_sigma_plus_2) - ((2 * (-k) + 1) * 2 * pi * ln_sigma_plus) * i);
		mus(4*k + 2) = - 1 / (((2 * (-k) + 1)^2 * pi^2 - ln_sigma_minus_2) - ((2 * (-k) + 1) * 2 * pi * ln_sigma_minus) * i);
	end
end
