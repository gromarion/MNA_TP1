function mus = mus(n, gamma, limit)
	mus = zeros(1, 8 * limit + 4);
	sigma_plus = 1 / gamma + sqrt(1 / gamma^2 - 1);
	sigma_minus = 1 / gamma - sqrt(1 / gamma^2 - 1);
	ln_sigma_plus = log(sigma_plus);
	ln_sigma_minus = log(sigma_minus);
	ln_sigma_plus_2 = ln_sigma_plus^2;
	ln_sigma_minus_2 = ln_sigma_minus^2;

	mus(1) = - sqrt((pi^2 - ln_sigma_plus_2) - (2 * pi * ln_sigma_plus) * i);
	mus(2) = - sqrt((pi^2 - ln_sigma_minus_2) - (2 * pi * ln_sigma_minus) * i);
	mus(3) = sqrt((pi^2 - ln_sigma_plus_2) - (2 * pi * ln_sigma_plus) * i);
	mus(4) = sqrt((pi^2 - ln_sigma_minus_2) - (2 * pi * ln_sigma_minus) * i);
	l = 5;
	for k = 1 : limit
		for j = 0 : 1
			[mu1, mu2, mu3, mu4] = partial_mus(k, mod(j, 2), ln_sigma_plus, ln_sigma_minus, ln_sigma_plus_2, ln_sigma_minus_2);
			mus(l) = mu1;
			mus(l + 1) = mu2;
			mus(l + 2) = mu3;
			mus(l + 3) = mu4;
			l = l + 4;
		end
	end
end

function [mu1, mu2, mu3, mu4] = partial_mus(k, j, ln_sigma_plus, ln_sigma_minus, ln_sigma_plus_2, ln_sigma_minus_2)
	mu1 = (-1)^j * sqrt(((2 * k  + 1)^2 * pi^2 - ln_sigma_plus_2) - ((2 * k + 1) * 2 * pi * ln_sigma_plus) * i);
	mu2 = (-1)^j * sqrt(((2 * k  + 1)^2 * pi^2 - ln_sigma_minus_2) - ((2 * k + 1) * 2 * pi * ln_sigma_minus) * i);
	mu3 = (-1)^j * sqrt(((2 * (-k) + 1)^2 * pi^2 - ln_sigma_plus_2) - ((2 * (-k) + 1) * 2 * pi * ln_sigma_plus) * i);
	mu4 = (-1)^j * sqrt(((2 * (-k) + 1)^2 * pi^2 - ln_sigma_minus_2) - ((2 * (-k) + 1) * 2 * pi * ln_sigma_minus) * i);
end