load('kryteriumKombinowaneMasa1.mat');

[M1Jbest12,BestOrderM12]=kryt_kombOgolne(M1S12);
[M1Jbest23,BestOrderM23]=kryt_kombOgolne(M1S23);
[M1Jbest13,BestOrderM13]=kryt_kombOgolne(M1S13);

%% masa 1 Pobierz dane
waga_statyczna=769.58; % masa 1 
nazwaPliku1='m1_s01b';
nazwaPliku2='m1_s02b';
nazwaPliku3='m1_s03b';

[x3,f3]=PobierzDane(nazwaPliku3,waga_statyczna);
[x2,f2]=PobierzDane(nazwaPliku2,waga_statyczna);
[x1,f1]=PobierzDane(nazwaPliku1,waga_statyczna);

%% walidacja krzyzowa
krzyzM1S3 = kryt_komb(BestOrderM12,x3,f3,waga_statyczna);
krzyzM1S1 = kryt_komb(BestOrderM23,x1,f1,waga_statyczna);
krzyzM1S2 = kryt_komb(BestOrderM13,x2,f2,waga_statyczna);
krzyzM1 = [krzyzM1S1 krzyzM1S2 krzyzM1S3];
orderM1 = [BestOrderM23 BestOrderM13 BestOrderM12];
mean([krzyzM1S3 krzyzM1S1 krzyzM1S2])
%% przed majówk¹
Markov1S1 = MacierzMarkovski(x1,f1,waga_statyczna,BestOrderM23);
Markov1S2 = MacierzMarkovski(x2,f2,waga_statyczna,BestOrderM13);
Markov1S3 = MacierzMarkovski(x3,f3,waga_statyczna,BestOrderM12);
Markov1 = [Markov1S1; Markov1S2; Markov1S3];
[J1,~,u1,sigma1]=kryt_kombOgolne(Markov1)
