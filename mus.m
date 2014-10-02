function mus = mus(n, gamma, limit)
	mus = zeros(1, 8 * limit + 4);
	sigma_plus = 1 / gamma + sqrt(1 / gamma^2 - 1);
	sigma_minus = 1 / gamma - sqrt(1 / gamma^2 - 1);
	ln_sigma_plus = log(sigma_plus);
	ln_sigma_minus = log(sigma_minus);
	ln_sigma_plus_2 = ln_sigma_plus^2;
	ln_sigma_minus_2 = ln_sigma_minus^2;

	mus(1) = sqrt((pi^2 - ln_sigma_plus_2) - (2 * pi * ln_sigma_plus) * i);
	mus(2) = sqrt((pi^2 - ln_sigma_minus_2) - (2 * pi * ln_sigma_minus) * i);
	mus(3) = - sqrt((pi^2 - ln_sigma_plus_2) - (2 * pi * ln_sigma_plus) * i);
	mus(4) = - sqrt((pi^2 - ln_sigma_minus_2) - (2 * pi * ln_sigma_minus) * i);
	for k = 1 : limit
		mus(8*k - 3) = sqrt(((2 * k  + 1)^2 * pi^2 - ln_sigma_plus_2) - ((2 * k + 1) * 2 * pi * ln_sigma_plus) * i);
		mus(8*k - 2) = sqrt(((2 * k  + 1)^2 * pi^2 - ln_sigma_minus_2) - ((2 * k + 1) * 2 * pi * ln_sigma_minus) * i);
		mus(8*k - 1) = sqrt(((2 * (-k) + 1)^2 * pi^2 - ln_sigma_plus_2) - ((2 * (-k) + 1) * 2 * pi * ln_sigma_plus) * i);
		mus(8*k) = sqrt(((2 * (-k) + 1)^2 * pi^2 - ln_sigma_minus_2) - ((2 * (-k) + 1) * 2 * pi * ln_sigma_minus) * i);
		mus(8*k + 1) = - sqrt(((2 * k  + 1)^2 * pi^2 - ln_sigma_plus_2) - ((2 * k + 1) * 2 * pi * ln_sigma_plus) * i);
		mus(8*k + 2) = - sqrt(((2 * k  + 1)^2 * pi^2 - ln_sigma_minus_2) - ((2 * k + 1) * 2 * pi * ln_sigma_minus) * i);
		mus(8*k + 3) = - sqrt(((2 * (-k) + 1)^2 * pi^2 - ln_sigma_plus_2) - ((2 * (-k) + 1) * 2 * pi * ln_sigma_plus) * i);
		mus(8*k + 4) = - sqrt(((2 * (-k) + 1)^2 * pi^2 - ln_sigma_minus_2) - ((2 * (-k) + 1) * 2 * pi * ln_sigma_minus) * i);
	end
end
