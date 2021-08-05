load('kryteriumKombinowaneMasa4.mat');

[M4Jbest12,BestOrderM12]=kryt_kombOgolne(M4S12);
[M4Jbest23,BestOrderM23]=kryt_kombOgolne(M4S23);
[M4Jbest13,BestOrderM13]=kryt_kombOgolne(M4S13);

%% masa 3 Pobierz dane
waga_statyczna=361.25; % masa 4 
nazwaPliku1='m4_s01b';
nazwaPliku2='m4_s02b';
nazwaPliku3='m4_s03b';

[x3,f3]=PobierzDane(nazwaPliku3,waga_statyczna);
[x2,f2]=PobierzDane(nazwaPliku2,waga_statyczna);
[x1,f1]=PobierzDane(nazwaPliku1,waga_statyczna);

%% walidacja krzyzowa
krzyzM4S3 = kryt_komb(BestOrderM12,x3,f3,waga_statyczna);
krzyzM4S1 = kryt_komb(BestOrderM23,x1,f1,waga_statyczna);
krzyzM4S2 = kryt_komb(BestOrderM13,x2,f2,waga_statyczna);
krzyzM4 = [krzyzM4S1 krzyzM4S2 krzyzM4S3];
orderM4 = [BestOrderM23 BestOrderM13 BestOrderM12];
mean(krzyzM4)
%% przed majówk¹
Markov4S1 = MacierzMarkovski(x1,f1,waga_statyczna,BestOrderM23);
Markov4S2 = MacierzMarkovski(x2,f2,waga_statyczna,BestOrderM13);
Markov4S3 = MacierzMarkovski(x3,f3,waga_statyczna,BestOrderM12);
Markov4 =   [Markov4S1; Markov4S2; Markov4S3];
[J4,~,u4,sigma4]=kryt_kombOgolne(Markov4)