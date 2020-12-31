% Q3) Using the linear programming formulation, 
% compute the minimum and maximum probabilities that C is true.
% 
% Given:
% P(A = true) = 0.8
% P(B = true) = 0.7
% P((A v B) -> C = true) = 0.9

A = [ 1 1 1 1 0 0 0 0 ;  % A
      1 1 0 0 1 1 0 0 ;  % B
      1 0 1 0 1 0 1 1 ;  % (A v B) -> C 
      1 1 1 1 1 1 1 1];
b = [ 0.8;  % P(A=true)
      0.7;  % P(B=true)
      0.9;  % P((A v B)-> C = true)
      1 ];
f = [ 1 0 1 0 1 0 1 0 ];  % P(C) = x1 + x3 + x5 + x7
A = [ A ; -A ; -diag(ones(8, 1)) ];
b = [ b ; -b ; zeros(8,1)];
pMin = linprog(f, A, b);
pMax = linprog(-f, A, b);
disp("Min Prob = ");
disp(dot(pMin, f));
disp("Max Prob = ");
disp(dot(pMax, f));