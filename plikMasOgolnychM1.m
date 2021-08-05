% clear;clc;close all;
%% szablon wejsc:
%Wprowadzenie wagi statycznej 
waga_statyczna=769.58; % masa 1 
% waga_statyczna=367.94; % masa 2 
% waga_statyczna=361.26; % masa 3 
% waga_statyczna=361.25; % masa 4 
%Wprowadzenie oœci rzêdów 
Order=[1:100]; % z góry okreœlony rz¹d 

nazwaPliku1='m1_s01b';
nazwaPliku2='m1_s02b';
nazwaPliku3='m1_s03b';
[x3,f3]=PobierzDane(nazwaPliku3,waga_statyczna);
[x2,f2]=PobierzDane(nazwaPliku2,waga_statyczna);
[x1,f1]=PobierzDane(nazwaPliku1,waga_statyczna);

x=[x1 x2 x3]; f=[f1 f2 f3];
%% rozpoczecie pomiarow
Order = 1:100;
% Markowski1 = bestOrder(x,f,waga_statyczna,Order);
% MarkowskiJakis = MacierzMarkovski(x,f,waga_statyczna);
load('markovskiM1s1s2s3.mat');
[Jbest1,BestOrderM1]=kryt_kombOgolne(markovskiM1s1s2s3);
M1S1 = kryt_komb(BestOrderM1,x1,f1,waga_statyczna); % to jest J a nie macierz Markovskiego!!
M1S2 = kryt_komb(BestOrderM1,x2,f2,waga_statyczna);
M1S3 = kryt_komb(BestOrderM1,x3,f3,waga_statyczna);
M1 = [M1S1 M1S2 M1S3 Jbest1];