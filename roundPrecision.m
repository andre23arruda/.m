function new = roundPrecision(n,spaces)

% Como o octave não possui a dunção round com precisão de casas decimais, resolvi fazer a minha

  entire = fix(n);
  decimal = n - entire;
  spaces = 10^spaces;
  decimal = round(decimal*spaces);
  decimal = decimal/spaces;
  new = entire + decimal;
end
