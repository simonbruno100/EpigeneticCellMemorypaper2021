
function [Xfin,Tfin] = runmeeasy(Dm1_initial,Dm2_initial);

%%   System reactions

% PLEASE NOTE: Dm1 = n_{DA}; Dm2 = n_{DR}

%   1. D                   --    kkw1         --> Dm1
%   2. D                   --    kkm1         --> Dm1
%   3. Dm1                 --    kke1         --> D
%   4. Dm1                 --    delta1       --> D
%   5. Dm1                 --    kkke1        --> D
%   6. D                   --    kkw1         --> Dm2
%   7. D                   --    kkm1         --> Dm2
%   8. Dm2                 --    kke1         --> D
%   9. Dm2                 --    delta1       --> D
%  10. Dm2                 --    kkke1        --> D

%% Parameter values


Dt = 50; % Dtot

p.V = 1; % Volume

p.kkw1=5; %kwA0 + kwA
p.kkw2=5; %kwR0 + kwR

p.delta1=5; %delta

p.kke1=5; %bar keA

p.km1=1; %kmA

p.ke1=0.2; %keA


%%%

p.km2=1; %kmR

p.delta2 = p.delta1; %delta

p.kke2=5; %bar keR

p.ke2=0.2; %keR


%% Initial conditions

D_initial = Dt - Dm1_initial - Dm2_initial;

IC = [D_initial, Dm1_initial, Dm2_initial];

%% Initial state
tinterval = [0, 30]; %hours --> this value multipled by Dt*p.kma will give the normalized time tau

x0    = IC;
x0    = round(x0);

%% Specify reaction network
pfun = @propensity_functions;

%species: D, Dm1, Dm2 3

stoich_matrix = [-1  1  0
                 -1  1  0
                  1 -1  0
                  1 -1  0
                  1 -1  0
                 -1  0  1
                 -1  0  1
                  1  0 -1
                  1  0 -1
                  1  0 -1];  
   

%% Run simulation:Direct method
[t,x] = directMethod2(stoich_matrix, pfun, tinterval, x0, p);

%% Save data

Xfin = [x];

Tfin =[t];

% save('Xfin')
% 
% save('Tfin')

%% 
function a = propensity_functions(x, p);

% Return reaction propensities given current state x
%specie: D, Dm1, Dm2   3


D          = x(1);
Dm1        = x(2);
Dm2        = x(3);


p.kkm1=p.km1*Dm1/p.V;
p.kkm2=p.km2*Dm2/p.V;

p.kkke1=p.ke1*Dm2/p.V;
p.kkke2=p.ke2*Dm1/p.V;

a = [p.kkw1*D;      
     p.kkm1*D 
     p.kke1*Dm1;
     p.delta1*Dm1;
     p.kkke1*Dm1;
     p.kkw2*D;      
     p.kkm2*D 
     p.kke2*Dm2;
     p.delta2*Dm2;
     p.kkke2*Dm2];
 
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