clear;clc;close all;

%% szablon wejsc:
%Wprowadzenie wagi statycznej 
% waga_statyczna=769.58; % masa 1 
% waga_statyczna=367.94; % masa 2 
% waga_statyczna=361.26; % masa 3 
% waga_statyczna=361.25; % masa 4 
%Wprowadzenie oœci rzêdów 

Order=[1:100]; % z góry okreœlony rz¹d 
%% masa 1
waga_statyczna=769.58; % masa 1 
nazwaPliku1='m1_s01b';
nazwaPliku2='m1_s02b';
nazwaPliku3='m1_s03b';

[x3,f3]=PobierzDane(nazwaPliku3,waga_statyczna);
[x2,f2]=PobierzDane(nazwaPliku2,waga_statyczna);
[x1,f1]=PobierzDane(nazwaPliku1,waga_statyczna);

% x=[x1 x2 x3]; f=[f1 f2 f3];

M1S12 = MacierzMarkovski([x1 x2],[f1 f2], waga_statyczna,Order);
M1S23 = MacierzMarkovski([x2 x3],[f2 f3], waga_statyczna,Order);
M1S13 = MacierzMarkovski([x1 x3],[f1 f3], waga_statyczna,Order);
%% masa 2
waga_statyczna=367.94; % masa 2 

nazwaPliku1='m2_s01b';
nazwaPliku2='m2_s02b';
nazwaPliku3='m2_s03b';

[x3,f3]=PobierzDane(nazwaPliku3,waga_statyczna);
[x2,f2]=PobierzDane(nazwaPliku2,waga_statyczna);
[x1,f1]=PobierzDane(nazwaPliku1,waga_statyczna);

M2S12 = MacierzMarkovski([x1 x2],[f1 f2], waga_statyczna,Order);
M2S23 = MacierzMarkovski([x2 x3],[f2 f3], waga_statyczna,Order);
M2S13 = MacierzMarkovski([x1 x3],[f1 f3], waga_statyczna,Order);

%% masa 3
waga_statyczna=361.26; % masa 3 

nazwaPliku1='m3_s01b';
nazwaPliku2='m3_s02b';
nazwaPliku3='m3_s03b';

[x3,f3]=PobierzDane(nazwaPliku3,waga_statyczna);
[x2,f2]=PobierzDane(nazwaPliku2,waga_statyczna);
[x1,f1]=PobierzDane(nazwaPliku1,waga_statyczna);

M3S12 = MacierzMarkovski([x1 x2],[f1 f2], waga_statyczna,Order);
M3S23 = MacierzMarkovski([x2 x3],[f2 f3], waga_statyczna,Order);
M3S13 = MacierzMarkovski([x1 x3],[f1 f3], waga_statyczna,Order);

%% masa 4
waga_statyczna=361.25; % masa 4 

[x3,f3]=PobierzDane(nazwaPliku3,waga_statyczna);
[x2,f2]=PobierzDane(nazwaPliku2,waga_statyczna);
[x1,f1]=PobierzDane(nazwaPliku1,waga_statyczna);


nazwaPliku1='m4_s01b';
nazwaPliku2='m4_s02b';
nazwaPliku3='m4_s03b';

M4S12 = MacierzMarkovski([x1 x2],[f1 f2], waga_statyczna,Order);
M4S23 = MacierzMarkovski([x2 x3],[f2 f3], waga_statyczna,Order);
M4S13 = MacierzMarkovski([x1 x3],[f1 f3], waga_statyczna,Order);
