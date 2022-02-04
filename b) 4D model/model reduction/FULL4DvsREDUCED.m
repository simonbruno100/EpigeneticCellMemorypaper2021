%% Trajectories of the full and the recuded systems

%% Parameter values

p.u10=0.1;
p.u20=0.1;
p.ua0=0.1;

p.u1=0;
p.u2=0;
p.ua=0;


p.a=1;        %alpha
p.abar=1;     %alpha bar
p.aprime=1;   %alpha prime





p.b=1;
p.beta=1;

p.mu=1;
p.mup=1;   %mu prime

p.c=1;

p.eprime=0.01;   %epsilon prime



NNN=6; %Final time

%% build the simulation - reduced system

sys_dyn = @(t,y) [(((p.c+2*y(1))*((p.u10+p.u1+p.a*(y(1))+p.abar*(y(1)))+(p.u20+p.u2+p.aprime*(y(1)))))*y(2)...
                 -(p.mu*(p.b*p.c+y(2))*p.eprime*p.mup*(p.beta*p.c+y(2))*((1/((p.u10+p.aprime*(y(1)))))+(1/((p.u20+p.a*(y(1))+p.abar*(y(1))))))*(p.ua0+p.ua+p.qq*y(2))*y(1)))...
                 /(p.ua0+p.ua+p.qq*y(2)+p.u10+p.u1+p.a*(y(1))+p.abar*(y(1))+p.u20+p.u2+p.aprime*(y(1)));...
                 -(((p.c+2*y(1))*((p.u10+p.u1+p.a*(y(1))+p.abar*(y(1)))+(p.u20+p.u2+p.aprime*(y(1)))))*y(2)...
                 -(p.mu*(p.b*p.c+y(2))*p.eprime*p.mup*(p.beta*p.c+y(2))*((1/((p.u10+p.aprime*(y(1)))))+(1/((p.u20+p.a*(y(1))+p.abar*(y(1))))))*(p.ua0+p.ua+p.qq*y(2))*y(1)))...
                 /(p.ua0+p.ua+p.qq*y(2)+p.u10+p.u1+p.a*(y(1))+p.abar*(y(1))+p.u20+p.u2+p.aprime*(y(1)))];


     
[T, Y] = ode45(sys_dyn, [0 NNN], [0.7 0.3]');


figure(1)
% clf()
hold on
% plot(T, Y(:,1),'-.','LineWidth',2, 'Color', [1/8 7/8 1]); %light blue
% plot(T, Y(:,1),'-.','LineWidth',2, 'Color', [3/8 5/8 1]); %blue 
plot(T, Y(:,1),'-.','LineWidth',2, 'Color', [0 0 1]);       %dark blue
set(gca, 'FontName', 'Times New Roman')
ylabel('D_R')
grid on
%

figure(2)
% clf()
hold on
% plot(T, Y(:,2),'-.','LineWidth',2, 'Color', [1/8 7/8 1]); %light blue
% plot(T, Y(:,2),'-.','LineWidth',2, 'Color', [3/8 5/8 1]); %blue 
plot(T, Y(:,2),'-.','LineWidth',2, 'Color', [0 0 1]);       %dark blue
set(gca, 'FontName', 'Times New Roman')
ylabel('D_A')
grid on



%% build the simulation - full system  

sys_dyn = @(t,y) [(p.u1+p.u10+p.aprime*(y(2)+y(3)))*y(4)*(1/p.eprime)+p.mu*(p.b*p.c+y(5))*y(3)-((p.u20+p.a*(y(2)+y(3))+p.abar*(y(1)+y(3)))*(1/p.eprime)+p.mup*(p.beta*p.c+y(5)))*y(1);...
                  (p.u2+p.u20+p.a*(y(2)+y(3))+p.abar*(y(1)+y(3)))*y(4)*(1/p.eprime)+p.mup*(p.beta*p.c+y(5))*y(3)-((p.u10+p.aprime*(y(2)+y(3)))*(1/p.eprime)+p.mu*(p.b*p.c+y(5)))*y(2);...
                  (p.u20+p.a*(y(2)+y(3))+p.abar*(y(1)+y(3)))*y(1)*(1/p.eprime)+(p.u10+p.aprime*(y(2)+y(3)))*y(2)*(1/p.eprime)-(p.mup*(p.beta*p.c+y(5))+p.mu*(p.b*p.c+y(5)))*y(3);...
                  (p.mup*(p.beta*p.c+y(5))*y(1)+p.mu*(p.b*p.c+y(5))*y(2)+(p.c+y(1)+y(2)+y(3)+y(3))*y(5))-(1/p.eprime)*((p.u2+p.u20+p.a*(y(2)+y(3))+p.abar*(y(1)+y(3)))+(p.u1+p.u10+p.aprime*(y(2)+y(3)))+p.ua+p.ua0+p.qq*y(5))*y(4);...
                  (p.ua+p.ua0+p.qq*y(5))*y(4)*(1/p.eprime)-(p.c+y(1)+y(2)+y(3)+y(3))*y(5)];
 
              
 [T, Y] = ode45(sys_dyn, [0 NNN], [0 0 0.7 0 0.3]');  
 
 figure(1)
hold on
% plot(T, Y(:,3),'LineWidth',2, 'Color', [1/8 7/8 1]); %light blue
% plot(T, Y(:,3),'LineWidth',2, 'Color', [3/8 5/8 1]); %blue 
plot(T, Y(:,3),'LineWidth',2, 'Color', [0 0 1]);       %dark blue
set(gca, 'FontName', 'Times New Roman')
ylabel('D_R')
% axis([0 NNN 0 0.2]);
grid on
legend('reduced','original')


figure(2)
hold on
% plot(T, Y(:,5),'LineWidth',2, 'Color', [1/8 7/8 1]); %light blue
% plot(T, Y(:,5),'LineWidth',2, 'Color', [3/8 5/8 1]); %blue 
plot(T, Y(:,5),'LineWidth',2, 'Color', [0 0 1]);       %dark blue
set(gca, 'FontName', 'Times New Roman')
ylabel('D_A')
% axis([0 NNN 0.7 1]);
grid on
legend('reduced','original')
 