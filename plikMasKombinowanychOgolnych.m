%% 3.2 Walidacja krzyzowa najlepsze rzedy do masy oraz najlepsze wartosci J do mas
clear;clc;close all;
plikMasKombinowanychM1;
plikMasKombinowanychM2;
plikMasKombinowanychM3;
plikMasKombinowanychM4;
%% krzyz mas kombinowanych
J = [J1; J2; J3; J4];
U = [u1; u2; u3; u4];
S = [sigma1; sigma2; sigma3; sigma4];
orderO=[orderM1;orderM2;orderM3;orderM4];
% J - wektor z warto�ciami kryterium(3.8) po walidacji k-krotnej
% U - wektor z warot�ciami b��du �redniego po walidacji k-krotnej
% S - wektor z waro�ciami odchylenia standardowego po walidacji k-krotnej 
%  orderO - wektor z warto�ciami najlepszych rz�d�w dla mas oraz ich serii
krzyzO=[krzyzM1;krzyzM2;krzyzM3;krzyzM4];
orderO=[orderM1;orderM2;orderM3;orderM4];
figure(1)
bar(krzyzO)
title('Kryterium (3.8) dla poszczeg�lnych mas')
xlabel('Numery mas oraz ich poszczeg�lne serie pomiarowe ');
ylabel('\Deltai');
figure(2)
bar(orderO)
title('Rz�dy dla poszczeg�lnych mas')
xlabel('Numery masy oraz ich poszczeg�lne serie pomiarowe ');
ylabel('Numery rz�du');

%%
subplot(2,1,1)
%figure(3)
bar(J)
title('Kryterium (3.8) dla poszczeg�lnych mas - najlepsze rezultaty')
xlabel('Numery mas - zbi�r ucz�cy ');
ylabel('\Deltai');

subplot(2,1,2)
%figure(4)
errorbar(U,S,'x')
xlabel('Numery mas')
ylabel('\mu, \sigma')
%% Obliczenia procentowe 
% ws1=769.58; % masa 1 
% ws2=367.94; % masa 2 
% ws3=361.26; % masa 3 
% ws4=361.25; % masa 4 
% ws = [ws1 ws2 ws3 ws4];
% procentJ= J./ws'*100;
% figure(5)
% bar(procentJ)
% title('Kryterium J dla poszczeg�lnych mas')
% xlabel('Numery mas oraz ich poszczeg�lne serie pomiarowe ');
% ylabel('\Deltai (%)')
% zrobic jeszcze error bar
