% Punkt 3.3 Walidacja globlna - podpunkt 3 pracy mgr 
clear;clc;close all;
%%
load('markovskiM1s1s2s3.mat');
load('markovskiM2s1s2s3.mat');
load('markovskiM3s1s2s3.mat');
load('markovskiM4s1s2s3.mat');

M1 =markovskiM1s1s2s3;
M2 =markovskiM2s1s2s3;
M3 =markovskiM3s1s2s3;
M4 =markovskiM4s1s2s3;

%% masa pierwsza

[~,BestOrderM1]=kryt_kombOgolne(M1);
Jm1m1 = kryt_kombOgolne(M1(:,BestOrderM1));
Jm1m2 = kryt_kombOgolne(M2(:,BestOrderM1));
Jm1m3 = kryt_kombOgolne(M3(:,BestOrderM1));
Jm1m4 = kryt_kombOgolne(M4(:,BestOrderM1));
%% masa druga
[~,BestOrderM2]=kryt_kombOgolne(M2);
Jm2m1 = kryt_kombOgolne(M1(:,BestOrderM2));
Jm2m2 = kryt_kombOgolne(M2(:,BestOrderM2));
Jm2m3 = kryt_kombOgolne(M3(:,BestOrderM2));
Jm2m4 = kryt_kombOgolne(M4(:,BestOrderM2));
%% masa trzecia
[~,BestOrderM3]=kryt_kombOgolne(M3);
Jm3m1 = kryt_kombOgolne(M1(:,BestOrderM3));
Jm3m2 = kryt_kombOgolne(M2(:,BestOrderM3));
Jm3m3 = kryt_kombOgolne(M3(:,BestOrderM3));
Jm3m4 = kryt_kombOgolne(M4(:,BestOrderM3));
%% masa czwarta
[~,BestOrderM4]=kryt_kombOgolne(M4);
Jm4m1 = kryt_kombOgolne(M1(:,BestOrderM4));
Jm4m2 = kryt_kombOgolne(M2(:,BestOrderM4));
Jm4m3 = kryt_kombOgolne(M3(:,BestOrderM4));
Jm4m4 = kryt_kombOgolne(M4(:,BestOrderM4));
%%
JM = [Jm1m1 Jm1m2 Jm1m3 Jm1m4;...
      Jm2m1 Jm2m2 Jm2m3 Jm2m4;...
      Jm3m1 Jm3m2 Jm3m3 Jm3m4;...
      Jm4m1 Jm4m2 Jm4m3 Jm1m4;];
bar3(JM)
title('Walidacja globalna')
ylabel('Numery masy testowej')
zlabel('\Deltai')
xlabel('Numery masy ucz¹cej')
legend('Masa 1 - zbiór testowy','Masa 2 - zbiór testowy','Masa 3 - zbiór testowy','Masa 4 - zbiór testowy')
%%


ws1=769.58; % masa 1 
ws2=367.94; % masa 2 
ws3=361.26; % masa 3 
ws4=361.25; % masa 4 
ws = [ws1 ws2 ws3 ws4]';
% jdiag=([ JM(1,1) JM(2,2) JM(3,3) JM(4,4)]);
[WS,~]=meshgrid(ws,1:length(ws));
% JMprocent=100*(JM./XJ-1);
% bar3(JMprocent)
procentJ3d=100*JM./WS
figure(2)
bar3(procentJ3d)
title('Walidacja globalna')
ylabel('i-ta masa')
zlabel('\Deltai (%)')
xlabel('i-ta seria')
legend('Masa 1 - zbiór ucz¹cy','Masa 2 - zbiór ucz¹cy','Masa 3 - zbiór ucz¹cy','Masa 4 - zbiór ucz¹cy')

wartosc1=mean(procentJ3d(1,:))
wartosc2=mean(procentJ3d(2,:))
wartosc3=mean(procentJ3d(3,:))
wartosc4=mean(procentJ3d(4,:))
wartosciii=[wartosc1; wartosc2 ;wartosc3;wartosc4]