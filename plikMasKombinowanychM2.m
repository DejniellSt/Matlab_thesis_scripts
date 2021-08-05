load('kryteriumKombinowaneMasa2.mat');

[M2Jbest12,BestOrderM12]=kryt_kombOgolne(M2S12);
[M2Jbest23,BestOrderM23]=kryt_kombOgolne(M2S23);
[M2Jbest13,BestOrderM13]=kryt_kombOgolne(M2S13);

%% masa 2 Pobierz dane
waga_statyczna=367.94; % masa 2 
nazwaPliku1='m2_s01b';
nazwaPliku2='m2_s02b';
nazwaPliku3='m2_s03b';

[x3,f3]=PobierzDane(nazwaPliku3,waga_statyczna);
[x2,f2]=PobierzDane(nazwaPliku2,waga_statyczna);
[x1,f1]=PobierzDane(nazwaPliku1,waga_statyczna);

%% walidacja krzyzowa
krzyzM2S3 = kryt_komb(BestOrderM12,x3,f3,waga_statyczna);
krzyzM2S1 = kryt_komb(BestOrderM23,x1,f1,waga_statyczna);
krzyzM2S2 = kryt_komb(BestOrderM13,x2,f2,waga_statyczna);
krzyzM2 = [krzyzM2S1 krzyzM2S2 krzyzM2S3];
orderM2 = [BestOrderM23 BestOrderM13 BestOrderM12];
mean(krzyzM2)
%% przed majówk¹
Markov2S1 = MacierzMarkovski(x1,f1,waga_statyczna,BestOrderM23);
Markov2S2 = MacierzMarkovski(x2,f2,waga_statyczna,BestOrderM13);
Markov2S3 = MacierzMarkovski(x3,f3,waga_statyczna,BestOrderM12);
Markov2 = [Markov2S1; Markov2S2; Markov2S3];
[J2,~,u2,sigma2]=kryt_kombOgolne(Markov2)