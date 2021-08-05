% do podpunktu 1 - 3.1 usuwanie pikow oraz legenda itp 
function [Ufilter,SigmaFilter]=usunacPiki(J,BO,u,sigma)
% u=u1;
% sigma=sigma3_1;
% % WalidacjaKrzyzowa;
% u=u1;
% sigma=sigma3_1;
% J=J1;
close all;
mu=mean(abs(diff(u)))/20;
[~,iUpik]=find(diff(u)>mu);
% szuka szumu(pik�w) je�li znajdzie pochodn� w�wczas wyznacza m�wi w
% kt�rych indeksach jest dany pik 
%% filtruj srednia do przodu i do tylu
% filtracja pik�w
% nx - wektor n-ty pik�w przesuniety o jeden  
% 
nx=iUpik+1;
for n=1:length(nx)
%     je�eli nie jest to na skrajnych rz�dach to filtruj : usuwaj piki
    if nx(n) > 1 && nx(n) < length(u)
%         u- wartosc srednia 
        u(nx(n))=mean([u(nx(n)-1) u(nx(n)+1)]);
        sigma(nx(n))=mean([sigma(nx(n)-1) sigma(nx(n)+1)]);
        J(nx(n))=mean([J(nx(n)-1) J(nx(n)+1)]);
    end
end
% spom- zmienna pomocnicza kt�ra pokazuje najlepszy rz�d o naj. sredniej
% bar 
% upom - zmienna pomocnicza kt�ra pokazuje najlepsza srednia errorbar
spom=zeros(length(u),1);upom=zeros(length(u),1);
spom(BO)=sigma(BO);
% upom(BO)=u(BO);
subplot(212)% dodalem 
errorbar(u,sigma,'b');hold on;
errorbar(u,spom,'r')
legend('Warto�ci poszczeg�lnych rz�d�w','Najlepszy rz�d')
xlabel('Numery rz�du')
ylabel('\mu, \sigma')
xlim([0 100])
Jpom=zeros(length(J),1);
Jpom(BO)=J(BO);
% figure(2)
subplot(211) % dodalem 
bar(J,'b'); hold on;
bar(Jpom,'r')
xlim([0 100])
legend('Warto�ci poszczeg�lnych rz�d�w','Najlepszy rz�d')
title('Kryterium (3.8)')
xlabel('Numery rz�du')
ylabel('\Deltai')

Ufilter=u;
SigmaFilter=sigma;
end