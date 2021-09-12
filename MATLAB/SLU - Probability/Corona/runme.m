%--------------------------------------------------------------------------
% purpose:  This simulation attempts to create a model of how the
%   coronavirus spreads in the human population.
% 
% model:
%  1. assume that each sick person each day is distributed across the
%     contacts/day pdf. 
%  2. consider each sick person, map them through the contact day pdf, then
%     use the number of contacts in a binomial distribution to determine
%     how many new infections occur.
%  3. For each day, clock the incubation for each group and add the newly
%     infected people to those who are incubating for 1 day.  Once a person
%     is done incubating and showing symptoms, they are quaranteened so
%     they are no longer in the general population.  The number that are
%     quarantenned each day are taken out of the general population through
%     a simple subtraction.  
%  4. The transfer probability is fixed according to the virus and does not
%     change with peopulation-related parameters.
% 
%--------------------------------------------------------------------------
clear all; clc; 

Np     = 49250;   % total population size
Pt     = 0.03;   % P(catching coronavirus/single contact with infected person)
Nsick0 = 10;   % initial number of people infected
di     = 14;   % # days incubate (have illness with no symptoms)
dr     = 35;   % total days ill before recovery (no chance of reinfection)

Ndays = 200;   % maximum number of days to process the simulation

Nsim = 15;      %4000 is 15 min,   % number of simulations
tau = 100;        % smoothening parameter to create the overall recovered pdf

prtflg = 1;   % 0 = nothing, 1 = runme, 2 = corona_virus some, 3 = corona_virus more

%==========================================================================
%================ DON'T CHANGE ANYTHING BELOW THIS LINE ===================
%==========================================================================
diary('results.txt');

%----------------
Srecovered = zeros(1,Nsim);
disp('============================== SIMULATION ===============================')

% display input parameters
if prtflg > 0
  fprintf('    Np: %d   total population size\n',Np);
  fprintf('    Pt: %4.2f     probability of transfering corona from human to human\n',Pt);
  fprintf('Nsick0: %d        initial number that are sick\n',Nsick0);
  fprintf('    di: %d        not showing symptoms but contagious\n',di);
  fprintf('    dr: %d       total days sick before recovery\n',dr);
  fprintf(' Ndays: %d      maximum days to process simulation\n',Ndays);
  disp(' ');
end

%----------------
for kk = 1:Nsim
  fprintf('============= simulation %d / %d ==============\n',kk,Nsim);

  [dV,QV,IV,RV] = corona_sim(Np,Pt,Nsick0,di,dr,Ndays,prtflg-1);

  if prtflg > 1
    figure(3);  set(gcf,'name','quaranteened');
    stem(dV,QV,'.');
    xlabel('day');
    ylabel('quarantenned');
    title('quarantenned by day');

    figure(4);  set(gcf,'name','new_infections');
    stem(dV,IV,'.');
    xlabel('day');
    ylabel('new infections');
    title('new infections by day');

    figure(5);  set(gcf,'name','recovered');
    stem(dV,RV,'.');
    xlabel('day');
    ylabel('recovered');
    title('recovered by day');
  end
  
  %----------------
  % calculate statistics for the total sick by day
  fz = QV/sum(QV);
  mz = sum(dV.*fz);
  vz = sum((dV-mz).*(dV-mz).*fz);
  RV
  IV
  Trecovered = sum(RV);
  Tinfected = sum(IV);

  if prtflg > 0
    disp(' ');
    out = sprintf('total sick distribution, mean(%5.2f) stdv(%5.2f)',mz,sqrt(vz));
    disp(out);
    out = sprintf('total recovered(%d)    total infected(%d)',Trecovered,Tinfected);
    disp(out);
  end
  
  Srecovered(kk) = Trecovered;
end

%--------------------
% generate the recovered pdf and plot it
if Nsim > 1
  [r,fr] = make_pdf(Srecovered,tau);

  figure(6); set(gcf,'name','pdf_recovered');
  plot(r,fr);
  xlabel('number recovered');
  ylabel('f_R(r)');
  title('recovered pdf');
end

diary off;

if prtflg;  figpos('setfigs');  end

disp(' ');
prt_figs('png','results');