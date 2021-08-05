%% 23.05.17 Rysunki nowe do poprawy
clear;clc;close all;
plikMasKombinowanychM1;
plikMasKombinowanychM2;
plikMasKombinowanychM3;
plikMasKombinowanychM4;
% Porównanie rysunków k-krotna
M_1best=3.8625;
M_2best=2.4363;
M_3best=2.7385;
% Porównanie wyników walidacja k-krotna oraz kryterium (3.8) rzêdy dla
% poszczególnych mas 
M_4best=2.5535;
M_1=[2.0063 M_1best] ;
M_2=[1.0776 M_2best];
M_3=[1.3666 M_3best];
M_4=[1.1059 M_4best];
rysuj=[M_1; M_2; M_3; M_4]
figure(1)
bar(rysuj)
ylabel('\Deltai')
xlabel('Numery masy')
legend('Kryterium (3.8) dla poszczególnych mas','Kryterium (3.8) dla walidacji k-krotnej')