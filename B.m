function [B] = B(n)
	B = eye(n + 1);
	B(n + 1, n + 1) = 0;
end

function [h] = h(n)
	h = 1 / (n + 1);
end