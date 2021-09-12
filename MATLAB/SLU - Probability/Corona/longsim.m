clear all; close all; clc;

Np     = 49250;   % total population size
Pt     = 0.03;   % P(catching coronavirus/single contact with infected person)
Nsick0 = 10;   % initial number of people infected
di     = 14;   % # days incubate (have illness with no symptoms)
dr     = 35;   % total days ill before recovery (no chance of reinfection)

Ndays = 200;   % maximum number of days to process the simulation

Nsim = 100;      %4000 is 15 min,   % number of simulations
tau = 100;        % smoothening parameter to create the overall recovered pdf

prtflg = 0;   % 0 = nothing, 1 = runme, 2 = corona_virus some, 3 = corona_virus more

totalQuar = [];

for kk = 1:Nsim
  fprintf('============= simulation %d / %d ==============\n',kk,Nsim);

  [dV,QV,IV,RV] = corona_sim(Np,Pt,Nsick0,di,dr,Ndays,prtflg-1);
  
  totalQuar = [totalQuar sum(QV)];
  
  end
  
  %----------------
  % calculate statistics for the total sick by day
%   fz = QV/sum(QV);
%   mz = sum(dV.*fz);
%   vz = sum((dV-mz).*(dV-mz).*fz);
%   
%   Trecovered = sum(RV);
%   Tinfected = sum(IV);
% 
%  
%   
%   Srecovered(kk) = Trecovered;
% end

%--------------------
% generate the recovered pdf and plot it
if Nsim > 1
  totalQuar = totalQuar./(dr-di);
  [q,fq] = make_pdf(totalQuar,tau);
  mq = sum(q.*fq);
  vq = sum((q-mq).*(q-mq).*fq);
  fprintf('Mean Q: %.5f\n Var Q: %.5f\n',mq,vq);
  figure(6); set(gcf,'name','pdf_quarantined');
  plot(q,fq);
  xlabel('number quarantined');
  ylabel('f_Q(q)');
  title('quarantined pdf');
end

