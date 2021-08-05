function [x,f]=PobierzDane(nazwa,waga_statyczna)
%  wczytanie danych zarejestrowanych pomiarów 
load('rejestracja2.mat');
%% Wyznaczenie wspó³czynników a,b - Kalibracja liniowa 
y1=0;
y2= 500;
x1=6099333;
x2=7341151;
A= [ x1 1; x2 1];
YY=[y1;y2]; 
c=A\YY;
a=c(1);
b = c(2);
%% wyjscia ( pobiera dane ) 
eval(sprintf('x=a*(%s.data.analog)+b+%s.data.zero;',nazwa,nazwa));
eval(sprintf('f=%s.data.digital;',nazwa));
f=double(f)*waga_statyczna;