load('kryteriumKombinowaneMasa3.mat');

[M3Jbest12,BestOrderM12]=kryt_kombOgolne(M3S12);
[M3Jbest23,BestOrderM23]=kryt_kombOgolne(M3S23);
[M3Jbest13,BestOrderM13]=kryt_kombOgolne(M3S13);

%% masa 3 Pobierz dane
waga_statyczna=361.26; % masa 3 
nazwaPliku1='m3_s01b';
nazwaPliku2='m3_s02b';
nazwaPliku3='m3_s03b';

[x3,f3]=PobierzDane(nazwaPliku3,waga_statyczna);
[x2,f2]=PobierzDane(nazwaPliku2,waga_statyczna);
[x1,f1]=PobierzDane(nazwaPliku1,waga_statyczna);

%% walidacja krzyzowa
krzyzM3S3 = kryt_komb(BestOrderM12,x3,f3,waga_statyczna);
krzyzM3S1 = kryt_komb(BestOrderM23,x1,f1,waga_statyczna);
krzyzM3S2 = kryt_komb(BestOrderM13,x2,f2,waga_statyczna);
krzyzM3 = [krzyzM3S1 krzyzM3S2 krzyzM3S3];
orderM3 = [BestOrderM23 BestOrderM13 BestOrderM12];
mean(krzyzM3)
%% przed majówk¹
Markov3S1 = MacierzMarkovski(x1,f1,waga_statyczna,BestOrderM23);
Markov3S2 = MacierzMarkovski(x2,f2,waga_statyczna,BestOrderM13);
Markov3S3 = MacierzMarkovski(x3,f3,waga_statyczna,BestOrderM12);
Markov3 = [Markov3S1; Markov3S2; Markov3S3];
[J3,~,u3,sigma3]=kryt_kombOgolne(Markov3)