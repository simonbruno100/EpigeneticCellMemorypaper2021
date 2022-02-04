
function [Xfin,Tfin] = runmeeasyBIS(Da_initial,D1_initial,D2_initial,D12_initial,P_initial,Ca_initial,T0,nreset);

%%   System reactions

% PLEASE NOTE: D = n_{D}, Da = n_{DA}; D1 = n_{DR1}; D2 = n_{DR2}; D12 = n_{DR12}; P = n_{X}; Ca = n_{Ca}


%   1. D       + P        --    a           --> Ca
%   2. Ca                 --    d           --> D + P
%   3. D                  --    kw10           --> D1
%   4. Ca                 --    kw10           --> D1 + P
%   5. D                  --    kw1            --> D1
%   6. D                  --    kmprime        --> D1
%   7. D                  --    kmprime        --> D1
%   8. Ca                 --    kmprime        --> D1 + P
%   9. Ca                 --    kmprime        --> D1 + P
%  10. D1                 --    deltaprime     --> D
%  11. D1                 --    ktprime        --> D 
%  12. D1                 --    ktprimeact     --> D
%  13. D1                 --    kw20           --> D12
%  14. D1                 --    km             --> D12
%  15. D1                 --    km             --> D12
%  16. D1                 --    kmbar          --> D12
%  17. D1                 --    kmbar          --> D12
%  18. D12                --    delta          --> D1
%  19. D12                --    ke             --> D1
%  20. D12                --    keact          --> D1
%  21. D                  --    kw20           --> D2
%  22. Ca                 --    kw20           --> D2 +P
%  23. D                  --    kw2            --> D2
%  24. D                  --    km             --> D2
%  25. D                  --    km             --> D2
%  26. Ca                  --    km             --> D2 + P
%  27. Ca                  --    km             --> D2 + P
%  28. D                  --    kmbar          --> D2
%  29. D                  --    kmbar          --> D2
%  30. Ca                 --    kmbar          --> D2 + P
%  31. Ca                 --    kmbar          --> D2 + P
%  32. D2                 --    delta          --> D
%  33. D2                 --    ke             --> D
%  34. D2                 --    keact          --> D
%  35. D2                 --    kw10           --> D12
%  36. D2                 --    kmprime        --> D12
%  37. D2                 --    kmprime        --> D12
%  38. D12                --    deltaprime     --> D2
%  39. D12                --    ktprime        --> D2
%  40. D12                --    ktprimeact     --> D2
%  41. D                  --    kwa0           --> Da
%  42. Ca                  --    kwa0           --> Da + P
%  43. Ca                 --    kwa            --> Da + P
%  44. D                  --    kma            --> Da
%  45. Ca                 --    kma            --> Da + P
%  46. Da                 --    delta          --> D
%  47. Da                 --    kea            --> D
%  48. Da                 --    keacta         --> D
%  49. Da                 --    keacta         --> D
%  50. Da                 --    keacta         --> D
%  51. Da                 --    keacta         --> D
%  52. Da                 --    b              --> P
%  53. P                  --    g              --> 0
%  54. Ca                 --    delta             --> D + P


%% Parameter values


Dt = 50; % Dtot

p.V = 1; % Volume

p.a=10;
p.d=10;


p.kkw10=5;       %kw10
p.kkw1=0;          %kw1
  
p.kkmprime=0.2;    %km prime

p.deltaprime=1;    %delta prime
p.ktprime=1;       %kt prime

p.kktprime=0.1;    %kt prime star



%%%


p.kkw20=5;    %kw20
p.kkw2=0;       %kw2

p.kkm=0.2;      %km
p.kkmbar=0.2;   %km bar

p.delta=10;      %delta  
p.ke=10;         %bar keR
p.kkeact=1;   %keR



%%%

p.kkwa0=5;     %kwA0
p.kkwa=300;        %kwA

p.kkma=1;        %kmA


p.kea=10;         %bar keA

p.kkeacta=1;     % keA

p.bb=1;  %alpha x
p.gg=1;   %gamma x


%% Initial conditions



D_initial = Dt - D1_initial - D2_initial - D12_initial - Da_initial - Ca_initial;


IC = [D_initial, D1_initial, D2_initial, D12_initial, Da_initial, P_initial, Ca_initial];

%% Initial state
tinterval = [0, 12]; %hours --> this value multipled by Dt*p.kma will give the corresponding normalized time tau

x0    = IC;
x0    = round(x0);

%% Specify reaction network
pfun = @propensity_functions;

%species: D, D1, D2, D12, Da, X, Ca 7

stoich_matrix = [-1  0  0  0  0 -1  1
                  1  0  0  0  0  1 -1    
                 -1  1  0  0  0  0  0 
                  0  1  0  0  0  1 -1
                 -1  1  0  0  0  0  0
                 -1  1  0  0  0  0  0
                 -1  1  0  0  0  0  0                 
                  0  1  0  0  0  1 -1
                  0  1  0  0  0  1 -1                  
                  1 -1  0  0  0  0  0
                  1 -1  0  0  0  0  0
                  1 -1  0  0  0  0  0
                  0 -1  0  1  0  0  0
                  0 -1  0  1  0  0  0
                  0 -1  0  1  0  0  0                  
                  0 -1  0  1  0  0  0
                  0 -1  0  1  0  0  0                  
                  0  1  0 -1  0  0  0
                  0  1  0 -1  0  0  0
                  0  1  0 -1  0  0  0
                 -1  0  1  0  0  0  0
                  0  0  1  0  0  1 -1
                 -1  0  1  0  0  0  0
                 -1  0  1  0  0  0  0
                 -1  0  1  0  0  0  0                 
                  0  0  1  0  0  1 -1
                  0  0  1  0  0  1 -1                  
                 -1  0  1  0  0  0  0
                 -1  0  1  0  0  0  0                 
                  0  0  1  0  0  1 -1
                  0  0  1  0  0  1 -1                  
                  1  0 -1  0  0  0  0
                  1  0 -1  0  0  0  0
                  1  0 -1  0  0  0  0
                  0  0 -1  1  0  0  0
                  0  0 -1  1  0  0  0
                  0  0 -1  1  0  0  0                  
                  0  0  1 -1  0  0  0
                  0  0  1 -1  0  0  0
                  0  0  1 -1  0  0  0
                 -1  0  0  0  1  0  0
                  0  0  0  0  1  1 -1 
                  0  0  0  0  1  1 -1
                 -1  0  0  0  1  0  0
                  0  0  0  0  1  1 -1
                  1  0  0  0 -1  0  0
                  1  0  0  0 -1  0  0
                  1  0  0  0 -1  0  0
                  1  0  0  0 -1  0  0
                  1  0  0  0 -1  0  0
                  1  0  0  0 -1  0  0
                  0  0  0  0  0  1  0
                  0  0  0  0  0 -1  0
                  1  0  0  0  0  1 -1]; 
   

%% Run simulation:Direct method
[t,x] = directMethod2(stoich_matrix, pfun, tinterval, x0, p);

%% Save data

Xfin = [x];

Tfin =[t];

save('Xfin')

save('Tfin')


%% Plot time course 
 

 A =movingmean(Xfin(:,5),1,1);   % use movingmean to visualize a smoother plot
 
figure(1);
hold on;
% plot(nreset*T0*p.kkma*Dt+Tfin*p.kkma*Dt,A,'b','LineWidth',1.6);
plot(nreset*T0*p.kkma*Dt+Tfin*p.kkma*Dt,A,'r','LineWidth',1.6);
set(gca, 'FontName', 'Times New Roman')
grid on
grid minor
xlabel('time tau');
ylabel('n_{D^A}');



%% 
function a = propensity_functions(x, p);

% Return reaction propensities given current state x
%specie: D, D1, D2, D12, Da, X, Ca 7
D          = x(1);
D1         = x(2);
D2         = x(3);
D12        = x(4);
Da         = x(5);
P          = x(6);
Ca          = x(7);


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
p.kw1=p.kkw10*0;

p.kw20=p.kkw20;
p.kw2=p.kkw20*(0);

p.kwa0=p.kkwa0;
p.kwa=p.kkwa;


p.b=(p.bb);


a = [p.a*D*P/p.V;
     p.d*Ca;
     p.kw10*D;
     p.kw10*Ca;
     p.kw1*D;
     p.kmprime2*D;
     p.kmprime12*D;     
     p.kmprime2*Ca;   
     p.kmprime12*Ca;
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
     p.kw20*Ca;
     p.kw2*D;
     p.km2*D;
     p.km12*D;     
     p.km2*Ca;
     p.km12*Ca;     
     p.kmbar1*D;    
     p.kmbar12*D;     
     p.kmbar1*Ca;    
     p.kmbar12*Ca;    
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
     p.kwa0*Ca;
     p.kwa*Ca;
     p.kma*D;
     p.kma*Ca;
     p.delta*Da;
     p.kea*Da;
     p.keacta11*Da;
     p.keacta112*Da;
     p.keacta22*Da;
     p.keacta212*Da;
     p.b*Da;
     p.gg*P;
     p.delta*Ca];
 
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