Masa1=[2.0063 2.2861 2.0121 2.0467]
Masa2=[1.1520 1.0776 1.1417 1.1728]
Masa3=[1.3686 1.4344 1.3666 1.3799]
Masa4=[1.1079 1.2295 1.1169  1.1079]
masa=[Masa1; Masa2 ;Masa3; Masa4];
bar(masa)
xlabel('Numery masy testowej')
ylabel('\Deltai')
title('Walidacja globalna')
legend('Masa 1 - zbiór ucz¹cy','Masa 2 - zbiór ucz¹cy','Masa 3 - zbiór ucz¹cy','Masa 4 - zbiór ucz¹cy')