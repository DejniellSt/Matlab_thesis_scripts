% clear;clc;close all;
%% szablon wejsc:
%Wprowadzenie wagi statycznej 
% waga_statyczna=769.58; % masa 1 
% waga_statyczna=367.94; % masa 2 
% waga_statyczna=361.26; % masa 3 
waga_statyczna=361.25; % masa 4 
%Wprowadzenie oœci rzêdów 
Order=[1:100]; % z góry okreœlony rz¹d 

nazwaPliku1='m4_s01b';
nazwaPliku2='m4_s02b';
nazwaPliku3='m4_s03b';
[x3,f3]=PobierzDane(nazwaPliku3,waga_statyczna);
[x2,f2]=PobierzDane(nazwaPliku2,waga_statyczna);
[x1,f1]=PobierzDane(nazwaPliku1,waga_statyczna);

x=[x1 x2 x3]; f=[f1 f2 f3];
%% rozpoczecie pomiarow
Order = 1:100;
% markovskiM4s1s2s3 = MacierzMarkovski(x,f,waga_statyczna,Order);
%%
load('markovskiM4s1s2s3.mat');
[Jbest4,BestOrderM4]=kryt_kombOgolne(markovskiM4s1s2s3); % Jbest - dla 3 , uczacy
M4S1 = kryt_komb(BestOrderM4,x1,f1,waga_statyczna);
M4S2 = kryt_komb(BestOrderM4,x2,f2,waga_statyczna);
M4S3 = kryt_komb(BestOrderM4,x3,f3,waga_statyczna);
M4 = [M4S1 M4S2 M4S3 Jbest4];