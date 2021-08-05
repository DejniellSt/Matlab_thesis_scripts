% clear;clc;close all;
%% szablon wejsc:
%Wprowadzenie wagi statycznej 
% waga_statyczna=769.58; % masa 1 
% waga_statyczna=367.94; % masa 2 
waga_statyczna=361.26; % masa 3 
% waga_statyczna=361.25; % masa 4 
%Wprowadzenie oœci rzêdów 
Order=[1:100]; % z góry okreœlony rz¹d 

nazwaPliku1='m3_s01b';
nazwaPliku2='m3_s02b';
nazwaPliku3='m3_s03b';
[x3,f3]=PobierzDane(nazwaPliku3,waga_statyczna);
[x2,f2]=PobierzDane(nazwaPliku2,waga_statyczna);
[x1,f1]=PobierzDane(nazwaPliku1,waga_statyczna);

x=[x1 x2 x3]; f=[f1 f2 f3];
%% rozpoczecie pomiarow
Order = 1:100;
% markovskiM3s1s2s3 = MacierzMarkovski(x,f,waga_statyczna,Order);
%%
load('markovskiM3s1s2s3.mat');
[Jbest3,BestOrderM3]=kryt_kombOgolne(markovskiM3s1s2s3); % Jbest - dla 3 , uczacy
M3S1 = kryt_komb(BestOrderM3,x1,f1,waga_statyczna);
M3S2 = kryt_komb(BestOrderM3,x2,f2,waga_statyczna);
M3S3 = kryt_komb(BestOrderM3,x3,f3,waga_statyczna);
M3 = [M3S1 M3S2 M3S3 Jbest3];