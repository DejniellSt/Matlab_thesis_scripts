%% Construct a block-Hankel matrix with i block rows and j columns
function H = blkhank(w, i, j)
[T, dw]  = size(w);
if T < dw 
    w = w'; [T, dw]  = size(w);
end
if nargin < 3 | isempty(j)
    j = T - i  + 1;
end
H = zeros(i * dw, j);
w = w';
for ii = 1:i
    H(((ii - 1) * dw + 1):(ii * dw), :) = w(:, ii:(ii + j - 1));
end
