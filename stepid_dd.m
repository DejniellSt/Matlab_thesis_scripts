%% Data-driven method for dynamic measurement
% 
% uh = stepid_dd(y, g, n, f)
%
% y - measured output 
% g - DC-gain 
% n - order - rz¹d 
% f - forgetting factor - wspó³czynnik zapomnienia 
% uh - vector of input estimates (in real-time)
% 
% I. Markovsky "Comparison of adaptive and model-free methods 
%               for dynamic measurement", IEEE-SPL, 2015 

function uh = stepid_dd(y, g, n, f)
if nargin == 3, ff = 1; end
dy = diff(y);
T  = size(y, 1); [p, m] = size(g); 
Tt = T - n; yt = y((n + 1):T, :)'; if n == 0, dy = [0; dy]; end 
x  = rls([kron(ones(Tt, 1), g), blkhank(dy, Tt)], yt(:), f);
uh = x(1:m, p:p:end)'; uh = [NaN * ones(n, m); uh];
end

%% recursive least-squares (RLS)
function x = rls(a, b, f)
[m, n] = size(a); finv = 1 / f;
ai = a(1:n, 1:n); x = zeros(n, m); 
x(:, n) = pinv(ai) * b(1:n); p = pinv(ai' * ai);
for i = (n + 1):m
  ai = a(i, :);
  k  = finv * p * ai' / (1 + finv * ai * p * ai');
  x(:, i) = x(:, i - 1) + k * (b(i) - ai * x(:, i - 1));
  p  = 1 / f * (p - k * ai * p);
end
end