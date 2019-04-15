%% Funcao do tipo @
% Funcao para calcular as raizes de uma equação do segundo grau: ax^2 +bx + c = 0
% Necessário informar a, b e c
delta = @(a,b,c) b^2-4*a*c;
raiz = @(a,b,d) [0.5*(-b+d^0.5)/a,0.5*(-b-d^0.5)/a];
