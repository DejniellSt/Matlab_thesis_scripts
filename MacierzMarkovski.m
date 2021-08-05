function [Markovski] = MacierzMarkovski(x,f,waga_statyczna,Order)
LiczbaPomiarow=sum(diff(f)>0);
%% szukanie zboczy oraz stworzenie bufora
X=[]; % utworzony bufor 
N=280;%ilosc probek 
% Obliczenie zbocza narastajacego na forokomorce oraz opadajacego 
ff=0;
for i=1 : length(f)
    if(f(i) == 0) &&(ff>0)
    %Zbocze odpadajace
    X(end+1,:)=x(i:i+N);
    end
    ff=f(i);
end
%% Macierz Markovskiego
M=zeros(LiczbaPomiarow,length(Order));
%% 
for r =1:length(Order)
    for i = 1 :LiczbaPomiarow
%         Funkcja stepid_dd
          odpowiedz= stepid_dd( (X(i,:))', 1, r, 1);
        M(i,r) = odpowiedz(end);
        Markovski(i,r)= abs(waga_statyczna-odpowiedz(end));
    end
end
%%
