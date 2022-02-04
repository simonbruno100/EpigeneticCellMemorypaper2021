
function [Xfin,Tfin] = runmeeasyFINAL(Da_initial,D1_initial,D2_initial,D12_initial);

%%   System reactions

% PLEASE NOTE: D = n_{D}, Da = n_{DA}; D1 = n_{DR1}; D2 = n_{DR2}; D12 = n_{DR12}

%   1. D                  --    kw10           --> D1
%   2. D                  --    kw1            --> D1
%   3. D                  --    kmprime        --> D1
%   4. D                  --    kmprime        --> D1
%   5. D1                 --    deltaprime     --> D
%   6. D1                 --    ktprime        --> D 
%   7. D1                 --    ktprimeact     --> D
%   8. D1                 --    kw20           --> D12
%   9. D1                 --    km             --> D12
%  10. D1                 --    km             --> D12
%  11. D1                 --    kmbar          --> D12
%  12. D1                 --    kmbar          --> D12
%  13. D12                --    delta          --> D1
%  14. D12                --    ke             --> D1
%  15. D12                --    keact          --> D1
%  16. D                  --    kw20           --> D2
%  17. D                  --    kw2            --> D2
%  18. D                  --    km             --> D2
%  19. D                  --    km             --> D2
%  20. D                  --    kmbar          --> D2
%  21. D                  --    kmbar          --> D2
%  22. D2                 --    delta          --> D
%  23. D2                 --    ke             --> D
%  24. D2                 --    keact          --> D
%  25. D2                 --    kw10           --> D12
%  26. D2                 --    kmprime        --> D12
%  27. D2                 --    kmprime        --> D12
%  28. D12                --    deltaprime     --> D2
%  29. D12                --    ktprime        --> D2
%  30. D12                --    ktprimeact     --> D2
%  31. D                  --    kwa0           --> Da
%  32. D                  --    kwa            --> Da
%  33. D                  --    kma            --> Da
%  34. Da                 --    delta          --> D
%  35. Da                 --    kea            --> D
%  36. Da                 --    keacta         --> D
%  37. Da                 --    keacta         --> D
%  38. Da                 --    keacta         --> D
%  39. Da                 --    keacta         --> D


%% Parameter values


Dt = 50; % Dtot

p.V = 1; % Volume


p.kkw10=3.5;       %kw10
p.kkw1=0;          %kw1
  
p.kkmprime=0.2;    %km prime

p.deltaprime=3;    %delta prime
p.ktprime=3;       %kt prime

p.kktprime=1;    %kt prime star



%%%


p.kkw20=3.5;    %kw20
p.kkw2=0;       %kw2

p.kkm=0.2;      %km
p.kkmbar=0.2;   %km bar

p.delta=3;      %delta  
p.ke=3;         %bar keR
p.kkeact=1;   %keR



%%%

p.kkwa0=3.5;     %kwA0
p.kkwa=0;        %kwA

p.kkma=1;        %kmA


p.kea=3;         %bar keA

p.kkeacta=1;   %keA



%% Initial conditions

% uncomment lines 105 - 108 when you want to study and visualize a single time trajectory. In particular, 
% 1) for the plots in Figure 4(c),(d), SI-Figure S.22 set    D1_initial = 15    D2_initial = 15      D12_initial = 15       Da_initial = 5      or      D1_initial = 0     D2_initial = 0       D12_initial = 5        Da_initial = 45;
% 2) for the plots in Figure 4(f), SI-Figure S.23 set    D1_initial = 0     D2_initial = 0       D12_initial = 45       Da_initial = 5;
% 3) for the plots in SI-Figure S.25 set    D1_initial = 0     D2_initial = 0      D12_initial = 50       Da_initial = 0;

% D1_initial = 0; 
% D2_initial = 0; 
% D12_initial = 45; 
% Da_initial = 5; 


D_initial = Dt - D1_initial - D2_initial - D12_initial - Da_initial;


IC = [D_initial, D1_initial, D2_initial, D12_initial, Da_initial];

%% Initial state
tinterval = [0, 40]; %hours --> this value multipled by Dt*p.kma will give the corresponding normalized time tau

x0    = IC;
x0    = round(x0);

%% Specify reaction network
pfun = @propensity_functions;

%species: D, Dr1, Dr2, Dr12, Da 5

stoich_matrix = [-1  1  0  0  0
                 -1  1  0  0  0
                 -1  1  0  0  0
                 -1  1  0  0  0                 
                  1 -1  0  0  0
                  1 -1  0  0  0
                  1 -1  0  0  0
                  0 -1  0  1  0
                  0 -1  0  1  0
                  0 -1  0  1  0                  
                  0 -1  0  1  0
                  0 -1  0  1  0                  
                  0  1  0 -1  0
                  0  1  0 -1  0
                  0  1  0 -1  0
                 -1  0  1  0  0
                 -1  0  1  0  0
                 -1  0  1  0  0
                 -1  0  1  0  0                 
                 -1  0  1  0  0
                 -1  0  1  0  0                 
                  1  0 -1  0  0
                  1  0 -1  0  0
                  1  0 -1  0  0
                  0  0 -1  1  0
                  0  0 -1  1  0
                  0  0 -1  1  0                  
                  0  0  1 -1  0
                  0  0  1 -1  0
                  0  0  1 -1  0
                 -1  0  0  0  1
                 -1  0  0  0  1
                 -1  0  0  0  1
                  1  0  0  0 -1
                  1  0  0  0 -1
                  1  0  0  0 -1
                  1  0  0  0 -1
                  1  0  0  0 -1
                  1  0  0  0 -1];  
   

%% Run simulation:Direct method
[t,x] = directMethod2(stoich_matrix, pfun, tinterval, x0, p);

%% Save data

Xfin = [x];

Tfin =[t];

save('Xfin')

save('Tfin') 


%% Plot time course - uncomment only to visualize the time trajectories
 

%  A =movingmean(Xfin(:,5),1,1);   % use movingmean to visualize a smoother plot
% 
%  
% figure(1);
% hold on;
% plot(Tfin*p.kkma*50,A,'LineWidth',2);
% set(gca, 'FontName', 'Times New Roman')
% grid on
% grid minor
% xlabel('time tau');
% ylabel('n_{D^A}');
% 
% 
%  B =movingmean(Xfin(:,2),1,1);    % use movingmean to visualize a smoother plot
% 
% DD =movingmean(Xfin(:,3),1,1);    % use movingmean to visualize a smoother plot
% 
%  C =movingmean(Xfin(:,4),1,1);    % use movingmean to visualize a smoother plot
% 
% 
%  
% figure(2);
% hold on;
% plot(Tfin*p.kkma*50,B+DD +C,'LineWidth',2);
% set(gca, 'FontName', 'Times New Roman')
% grid on
% grid minor
% xlabel('time tau');
% ylabel('n_{D^R} = n_{D^R_{1}}+n_{D^R_{2}}+n_{D^R_{12}}');

%% 
function a = propensity_functions(x, p);

% Return reaction propensities given current state x
%species: D, Dr1, Dr2, Dr12, Da 5

D          = x(1);
D1         = x(2);
D2         = x(3);
D12        = x(4);
Da         = x(5);


p.kmprime2=(p.kkmprime*(D2))/p.V;
p.kmprime12=(p.kkmprime*(D12))/p.V;

p.km2=(p.kkm*(D2))/p.V;
p.km12=(p.kkm*(D12))/p.V;

p.kmbar1=(p.kkmbar*(D1))/p.V;
p.kmbar12=(p.kkmbar*(D12))/p.V;

p.kma=(p.kkma*(Da))/p.V;



p.ktprimeact=(p.kktprime*Da)/p.V;

p.keact=(p.kkeact*Da)/p.V;

p.keacta11=(p.kkeacta*(D1))/p.V;
p.keacta112=(p.kkeacta*(D12))/p.V;

p.keacta22=(p.kkeacta*(D2))/p.V;
p.keacta212=(p.kkeacta*(D12))/p.V;


p.kw10=p.kkw10;
p.kw1=p.kkw1;

p.kw20=p.kkw20;
p.kw2=p.kkw2;

p.kwa0=p.kkwa0;
p.kwa=p.kkwa;


a = [p.kw10*D;
     p.kw1*D;
     p.kmprime2*D;
     p.kmprime12*D;
     p.deltaprime*D1;
     p.ktprime*D1;
     p.ktprimeact*D1;
     p.kw20*D1;
     p.km2*D1;
     p.km12*D1;
     p.kmbar1*(D1-1);
     p.kmbar12*D1;
     p.delta*D12;
     p.ke*D12;
     p.keact*D12;
     p.kw20*D;
     p.kw2*D;
     p.km2*D;
     p.km12*D;
     p.kmbar1*D;
     p.kmbar12*D;
     p.delta*D2;
     p.ke*D2;
     p.keact*D2;
     p.kw10*D2;
     p.kmprime2*(D2-1);
     p.kmprime12*D2;
     p.deltaprime*D12;
     p.ktprime*D12;
     p.ktprimeact*D12;
     p.kwa0*D;
     p.kwa*D;
     p.kma*D;
     p.delta*Da;
     p.kea*Da;
     p.keacta11*Da;
     p.keacta112*Da;
     p.keacta22*Da;
     p.keacta212*Da];
 
end

function [ t, x ] = directMethod2( stoich_matrix, pfun, tinterval, x0,...
                                  p)
    %% Initialization

max_out_length=1000000;
num_rxns = size(stoich_matrix, 1);
num_species = size(stoich_matrix, 2);
T = zeros(max_out_length, 1);
X = zeros(max_out_length, num_species);
T(1)     = tinterval(1);
X(1,:)   = x0;
rxn_count = 1;

%% MAIN LOOP
while T(rxn_count) < tinterval(2);
    
 % Uncomment lines 330-365 for the time trajectories in Figure 4(c),(d), SI-Figure S.22 and for evaluation of the latency (SI-Figure S.25)
 % Uncomment line 325  for the time trajectories to study the time to memory loss of the active state
 % Uncomment line 326  for the time trajectories to study the time to memory loss of the repressed state
 % Uncomment line 327  for evaluation of the latency 
 
%     if X(rxn_count,5)<6;
%     if X(rxn_count,2)+X(rxn_count,3)+X(rxn_count,4)<6;
%     if X(rxn_count,5)>40; 


%     % Calculate reaction propensities
%     a = pfun(X(rxn_count,:), p);
%     
%     % Sample earliest time-to-fire (tau)
%     a0 = sum(a);
%     r = rand(1,1);
%     
%     % Sample identity of earliest reaction channel to fire (mu)
%     j=1; s=a(1); r0=r*a0;
%     while s < r0
%       j = j + 1;
%       s = s + a(j);
%     end
%     
%     % Sample earliest time-to-fire (tau)
%     
%     s2= s -a(j);
% 
%     r2 = (r0 - s2)/a(j);
%     
%     tau = -log(r2)/a0; %(1/a0)*log(1/r2);
%     
% 
%     % Update time and carry out reaction mu
%     T(rxn_count+1)   = T(rxn_count)   + tau;
%     X(rxn_count+1,:) = X(rxn_count,:) + stoich_matrix(j,:);    
%     rxn_count = rxn_count + 1;
%     
%     
%         
%     display('-------------------------------------');
%         disp(T(rxn_count));
%     display('-------------------------------------');
%    
% break
% end  

    
    % Calculate reaction propensities
    a = pfun(X(rxn_count,:), p);
    
    % Sample earliest time-to-fire (tau)
    a0 = sum(a);
    r = rand(1,1);
    
    % Sample identity of earliest reaction channel to fire (mu)
    j=1; s=a(1); r0=r*a0;
    while s < r0
      j = j + 1;
      s = s + a(j);
    end
    
    % Sample earliest time-to-fire (tau)
    
    s2= s -a(j);

    r2 = (r0 - s2)/a(j);
    
    tau = -log(r2)/a0; %(1/a0)*log(1/r2);
    

    % Update time and carry out reaction mu
    T(rxn_count+1)   = T(rxn_count)   + tau;
    X(rxn_count+1,:) = X(rxn_count,:) + stoich_matrix(j,:);    
    rxn_count = rxn_count + 1;
    
 
    
        
    display('-------------------------------------');
        disp(T(rxn_count));
    display('-------------------------------------');
   
end  

% Return simulation time course
t = T(1:rxn_count);
x = X(1:rxn_count,:);
if t(end) > tinterval(2)
    t(end) = tinterval(2);
    x(end,:) = X(rxn_count-1,:);
end    

end
end