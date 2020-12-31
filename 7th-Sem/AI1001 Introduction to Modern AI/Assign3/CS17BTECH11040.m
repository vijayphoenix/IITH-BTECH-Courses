% Input [ X1 X2 ]
X = [ -1 -0.2 ; 
      3.5 1.8 ; 
      5.3 1.2 ; 
      2.2 1.1 ; 
      7.5 1.4 ; 
      2.3 -0.3 ; 
      4.4 1.1 ; 
      7 0.5 ];

% Labels
y = [ ones(5,1) ; zeros(3,1) ];

% Coefficients
b = glmfit(X,y,'binomial','link','logit');

X1 = [ ones(8,1) X ];
c = X1 * b;

% Probability of assigning the label 1
p = 1 ./ (1 + exp(-c));
disp('p = ')
disp(p);

% Plotting 
% 1) Optimal line 
% 2) Inputs vectors with corresponding probabilities
X1 = -5:10;
X2 = -(b(1) + b(2)* X1)/b(3);
labels = cellstr(num2str(p));
plot(X(:, 1), X(:, 2), '.', X1, X2, 'r-');
text(X(:, 1), X(:, 2), labels, 'VerticalAlignment', 'bottom', "HorizontalAlignment", "right", "FontSize", 7);
xlabel('X1'); ylabel('X2');

hold on;

% Test Input
Xt = [0.7 0.2; 4.7 -0.2];
Xt1 = [ones(2,1) Xt] ; 
ct1 = Xt1 * b; 
pt1 = 1 ./ (1+exp(-ct1));
disp('p = ')
disp(pt1)
plot(Xt(:, 1), Xt(:, 2), '.r');
labels = cellstr(num2str(pt1));
text(Xt(:, 1), Xt(:, 2), labels, 'VerticalAlignment', 'bottom', "HorizontalAlignment", "right", "FontSize", 7);
