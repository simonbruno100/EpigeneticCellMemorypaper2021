%% Code to evaluate Latency 

N=40; % Total trajectories considered
G=40; % Maximum simulation time (hours) considered

T=zeros(1,N);

for i=1:1:N
    
runmeeasyFINAL;
load('Tfin');
if Tfin(end-1)>G
    T(i)=G;
else
T(i)=Tfin(end-1); 
end
    

    display('-------------------------------------');
        disp(i);
    display('-------------------------------------');

end

% Evaluation of % of time trajectories that reach nDA > 40

T=sort(T);

R=G;
S=zeros(1,R);

SS=zeros(1,R);



for h=1:1:R
  for j=1:1:N
    if T(j)<(h) && T(j)>=((h-1))
        
        S(h)=S(h)+1;
    end
  end
    
end

S0=0;

for h=1:1:R-1
 
  SS(h)=S0+S(h);
    S0=SS(h);
    
end


SS(R)=SS(R-1);

for h= 1:1:R;

SS(h) = SS(h)/N;

end


SSS=[0,SS];

h=0:1:R;
figure(10)
hold on;
plot(h/24,SSS,'LineWidth',2.5);
set(gca, 'FontName', 'Times New Roman')
% set(gcf, 'Color', 'None')
xlabel('time (days)');
ylabel('% of trajectories with n_{DA}>40');
% axis([0 80 0 1]);
axis([0 G/24 0 1]);