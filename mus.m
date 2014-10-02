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
	l = 0;
	for k = 1 : limit
		for j = l : l + 1
			[mu1, mu2, mu3, mu4] = partial_mus(k, l, ln_sigma_plus, ln_sigma_minus, ln_sigma_plus_2, ln_sigma_minus_2);
			mus(4*k + l + 1) = mu1;
			mus(4*k + l + 2) = mu2;
			mus(4*k + l + 3) = mu3;
			mus(4*k + l + 4) = mu4;
			l = l + 4;
		end
	end
end

function [mu1, mu2, mu3, mu4] = partial_mus(k, l, ln_sigma_plus, ln_sigma_minus, ln_sigma_plus_2, ln_sigma_minus_2)
	mu1 = (-1)^l * sqrt(((2 * k  + 1)^2 * pi^2 - ln_sigma_plus_2) - ((2 * k + 1) * 2 * pi * ln_sigma_plus) * i);
	mu2 = (-1)^l * sqrt(((2 * k  + 1)^2 * pi^2 - ln_sigma_minus_2) - ((2 * k + 1) * 2 * pi * ln_sigma_minus) * i);
	mu3 = (-1)^l * sqrt(((2 * (-k) + 1)^2 * pi^2 - ln_sigma_plus_2) - ((2 * (-k) + 1) * 2 * pi * ln_sigma_plus) * i);
	mu4 = (-1)^l * sqrt(((2 * (-k) + 1)^2 * pi^2 - ln_sigma_minus_2) - ((2 * (-k) + 1) * 2 * pi * ln_sigma_minus) * i);
end