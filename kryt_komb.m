%  Funkcja która wyznacza J , (zakres rzêdów, pomiar, fotokomórke, waga
%  stat.)
function J = kryt_komb(vector_order,x,f,waga_statyczna)% vector order - o jakie rzedy chodzi
Markovski = MacierzMarkovski(x,f,waga_statyczna,vector_order);
[J,~]=kryt_kombOgolne(Markovski);
end