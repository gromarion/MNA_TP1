function [A, B, C] = ABC(n, gamma)
	A = A(n, gamma);
	B = B(n);
	C = C(A, B);
end

function A = A(n, gamma)
	A = -2 * eye(n + 1);
	for i = 2 : n
		A(i - 1, i) = 1;
		A(i + 1, i) = 1;
	end
	A(2, 1) = 1;
	A(n, n + 1) = 1
	A(n, n - 1) = 1;
	A(n + 1, 1) = 4;
	A(n + 1, 2) = -1;
	A(n + 1, n - 1) = gamma;
	A(n + 1, n) = -4 * gamma;
	A(n + 1, n + 1) = 3 * gamma;
end

function B = B(n)
	B = h(n)^2 * eye(n + 1);
	B(n + 1, n + 1) = 0;
end

function C = C(A, B)
	C = A^-1 * B;
end

function h = h(n)
	h = 1 / (n + 1);
end

