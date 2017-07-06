% taylor_exp3(x)
%
% Josemari Feliciano
%
% taylor_exp3(x)
% Use Taylor Series to compute e^x
% Input: x
% Output: Approximation of e^x
% Use Horner''s Method to reduce computations







function res = taylor_exp3(x)

sum = 0;
power = 1;
limit = 200

for iter = 1:limit
  count = limit + 1 -iter;
  term = (sum * (x/count));
  sum = 1 + term;
  fprintf('%d %8.5f %8.5f \n', count, term, sum)
end

res = sum;
