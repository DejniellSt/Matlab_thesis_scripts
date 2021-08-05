% 3.1 Kryterium (3.8), Eksperyment 1 
clear;clc;close all;
load('markovskiM1s1s2s3.mat');
load('markovskiM2s1s2s3.mat');
load('markovskiM3s1s2s3.mat');
load('markovskiM4s1s2s3.mat');
%% Kryterium (3.8)-MASA 1 - wywo³anie 
[J1,BO1,u1,sigma3_1]=kryt_kombOgolne(markovskiM1s1s2s3);
[U1,S1]=usunacPiki(J1,BO1,u1,sigma3_1);
% zmienne wejsciowe:
% J1 - wartoœci kruterium (3.8)
% BO1 - najlepszy rz¹d 
% sigma3_1 - odchylenie standardowe
% u1 - b³¹d œredni
%% MASA 2 - wywo³anie 
[J2,BO2,u2,sigma3_2]=kryt_kombOgolne(markovskiM2s1s2s3);
[U2,S2]=usunacPiki(J2,BO2,u2,sigma3_2);
%% MASA 3 - wywo³anie 
[J3,BO3,u3,sigma3_3]=kryt_kombOgolne(markovskiM3s1s2s3);
[U3,S3]=usunacPiki(J3,BO3,u3,sigma3_3);
%% MASA 4 - wywo³anie 
[J4,BO4,u4,sigma3_4]=kryt_kombOgolne(markovskiM4s1s2s3);
 [U4,S4]=usunacPiki(J4,BO4,u4,sigma3_4);

%% PODSUMOWANIE wyników 
close all;
% figure(1)
subplot(2,1,1)
bestJta=[J1(BO1); J2(BO2); J3(BO3); J4(BO4)];
bar(bestJta);
title('Walidacja globalna- najlepsze rezultaty');
xlabel('Numery mas')
ylabel('\Deltai')
% figure(2)
subplot(2,1,2)
errorbar([U1(BO1) U2(BO2) U3(BO3) U4(BO4)],...
[sigma3_1(BO1) sigma3_2(BO2) sigma3_3(BO3) sigma3_4(BO4)],'x');
xlabel('Numery mas')
ylabel('\mu. \sigma')
%% wagi statyczne - procentowo
%Wprowadzenie wagi statycznej 
% ws1=769.58; % masa 1 
% ws2=367.94; % masa 2 
% ws3=361.26; % masa 3 
% ws4=361.25; % masa 4 
% ws = [ws1 ws2 ws3 ws4]';
% procentJ=bestJta./ws*100;
% figure(3)
% bar(procentJ)
% xlabel('i-ta masa')
% ylabel('\Deltai (%)')
% title('Walidacja globalna- najlepsze rezultaty (%)')
% zrobic bar 