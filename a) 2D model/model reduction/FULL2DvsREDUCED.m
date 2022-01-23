%% Trajectories of the full and the recuded systems

%% Parameter values

p.ua0=0.1;
p.ua=0;

p.ur=0;
p.ur0=0.1;

p.a=1;  %alpha

p.c=1;

p.mu=1;
p.b=1;


p.e=1; %epsilon prime


N = 30; %Final time

%% build the simulation - reduced system

sys_dyn = @(t,y) [(p.ua0+p.ua+y(1))*(((p.c+y(2))*y(1)+p.mu*(p.b*p.c+y(1))*y(2))/((p.ua0+p.ua+y(1))+(p.ur0+p.ur+p.a*y(2))))-(p.c+y(2))*y(1);...
                  (p.ur0+p.ur+p.a*y(2))*(((p.c+y(2))*y(1)+p.mu*(p.b*p.c+y(1))*y(2))/((p.ua0+p.ua+y(1))+(p.ur0+p.ur+p.a*y(2))))-p.mu*(p.b*p.c+y(1))*y(2)]


              
[T, Y] = ode45(sys_dyn, [0 N], [0.7 0.3]');
figure(1)
% clf()
hold on
% plot(T, Y(:,1),'-.','LineWidth',2, 'Color', [1/8 7/8 1]); %light blue
% plot(T, Y(:,1),'-.','LineWidth',2, 'Color', [3/8 5/8 1]); %blue
plot(T, Y(:,1),'-.','LineWidth',2, 'Color', [0 0 1]);       %dark blue
set(gca, 'FontName', 'Times New Roman')
ylabel('bar D_A')
axis([0 N 0 1]);
grid on
% legend('reduced','original')
% %
figure(2)
% clf()
hold on
% plot(T, Y(:,2),'-.','LineWidth',2, 'Color', [1/8 7/8 1]); %light blue
% plot(T, Y(:,2),'-.','LineWidth',2, 'Color', [3/8 5/8 1]); %blue
plot(T, Y(:,2),'-.','LineWidth',2, 'Color', [0 0 1]);       %dark blue
set(gca, 'FontName', 'Times New Roman')
ylabel('bar D_R')
axis([0 N 0 1]);
grid on




%% build the simulation - full system

sys_dyn = @(t,y) [(1/p.e)*(p.ua0+p.ua+y(1))*y(3)-(p.c+y(2))*y(1);...
                  (1/p.e)*(p.ur0+p.ur+p.a*y(2))*y(3)-p.mu*(p.b*p.c+y(1))*y(2);...
                  (p.c+y(2))*y(1)+p.mu*(p.b*p.c+y(1))*y(2)-(1/p.e)*((p.ua0+p.ua+y(1))*y(3)+(p.ur0+p.ur+p.a*y(2))*y(3))]


              
[T, Y] = ode45(sys_dyn, [0 N], [0.7 0.3 0]');
figure(1)
% clf()
hold on
% plot(T, Y(:,1),'LineWidth',2, 'Color', [1/8 7/8 1]); %light blue
% plot(T, Y(:,1),'LineWidth',2, 'Color', [3/8 5/8 1]); %blue
plot(T, Y(:,1),'LineWidth',2, 'Color', [0 0 1]);       %dark blue
set(gca, 'FontName', 'Times New Roman')
ylabel('D_A')
axis([0 N 0 1]);
grid on
legend('reduced','original')
% %
figure(2)
% clf()
hold on
% plot(T, Y(:,2),'LineWidth',2, 'Color', [1/8 7/8 1]); %light blue
% plot(T, Y(:,2),'LineWidth',2, 'Color', [3/8 5/8 1]); %blue
plot(T, Y(:,2),'LineWidth',2, 'Color', [0 0 1]);       %dark blue
set(gca, 'FontName', 'Times New Roman')
ylabel('D_R')
axis([0 N 0 1]);
grid on
legend('reduced','original')

