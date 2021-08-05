% kryterium kombinowane 
function [J,OrderBest,u,sigma3]= kryt_kombOgolne(Markovski)
u=mean(Markovski ,1); 
sigma = std(Markovski,0,1);
sigma3=sigma*3;
J=u+3*sigma
[~,OrderBest]=min(J);
end
