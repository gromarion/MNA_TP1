function mus = mus(n, gamma)
	mus = 1 : 2 * n + 1;
	sigma = 1 / gamma + sqrt(1 / gamma^2 - 1);
	ln_sigma = log(sigma);
	ln_sigma_2 = ln_sigma^2;

	for k = 2 : 2 : n
		mus(k) = sqrt(((2 * (k - 1)  + 1)^2 * pi^2 - ln_sigma_2) - ((2 * (k - 1) + 1) * 2 * pi * ln_sigma) * i);
		mus(k + 1) = sqrt(((2 * (-(k - 1)) + 1)^2 * pi^2 - ln_sigma_2) - ((2 * (-(k - 1)) + 1) * 2 * pi * ln_sigma) * i);
	end
	mus(1) = sqrt((pi^2 - ln_sigma_2) - (2 * pi * ln_sigma) * i);
end