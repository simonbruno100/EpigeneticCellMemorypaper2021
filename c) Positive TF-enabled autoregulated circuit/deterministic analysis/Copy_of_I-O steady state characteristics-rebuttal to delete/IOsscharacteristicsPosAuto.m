%% I/O steady state characteristics for the Positive autoregulation motif



m=0.6; %mu prime

N=8; % highest value of the input

n=0.1; %increment of the input

T=N/n; %total number of input values considered

ax=0.5;  %px


%% Increasing input


q=0;

Xa=zeros(1,T+1);
Xr12=zeros(1,T+1);
Xr1=zeros(1,T+1);
Xr2=zeros(1,T+1);
Xx=zeros(1,T+1);



for j=0:n:N;
  
    [xr1,xr2,xr12,xa,xx] = IOPAincreasing(j,m,ax);
    
    q=q+1;
    Xa(q)=xa;         %bar Da
    Xr12(q)=xr12;     %bar Dr12
    Xr1(q)=xr1;       %bar Dr1 + bar Dr12
    Xr2(q)=xr2;       %bar Dr2 + bar Dr12
    Xx(q)=xx;         %bar X
    
end


Xr=Xr1+Xr2-Xr12;     %bar Dr = bar Dr1 + bar Dr2 + bar Dr12

j=0:n:N;
figure(1)
hold on
% plot(j, Xa,'LineWidth',3, 'Color', [0.5 1 0]);
% plot(j, Xa,'LineWidth',3, 'Color', [0.25 0.7 0]);
plot(j, Xa,'LineWidth',3, 'Color', [0 0.5 0]);
set(gca, 'FontName', 'Times New Roman')
ylabel('bar D_A')
% axis([0 N 0 1]);
grid on

figure(2)
hold on
% plot(j, Xr,'LineWidth',3, 'Color', [1 35/40 0]);
% plot(j, Xr,'LineWidth',3, 'Color', [1 0.5 0]);
plot(j, Xr,'LineWidth',3, 'Color', [1 0 0]);
set(gca, 'FontName', 'Times New Roman')
ylabel('bar D_R')
% axis([0 N 0 1]);
grid on

%% decreasing input



xa0=Xa(end);
xr120=Xr12(end);
xr20=Xr2(end);
xr10=Xr1(end);
xx0=Xx(end);


q=0;

Xa=zeros(1,T+1);
Xr12=zeros(1,T+1);
Xr1=zeros(1,T+1);
Xr2=zeros(1,T+1);
Xx=zeros(1,T+1);

for j=0:n:N;
  
    [xr1,xr2,xr12,xa,xx] = IOPAdecreasing(j,m,xr10,xr20,xr120,xa0,xx0,ax);
    
    q=q+1;
    Xa(q)=xa;         %bar Da
    Xr1(q)=xr1;       %bar Dr1 + bar Dr12
    Xr2(q)=xr2;       %bar Dr2 + bar Dr12
    Xr12(q)=xr12;     %bar Dr12
    Xx(q)=xx;         %bar X
    
end

Xr=Xr1+Xr2-Xr12;      %bar Dr = bar Dr1 + bar Dr2 + bar Dr12

j=0:n:N;
figure(1)
hold on
% plot(j, Xa,'LineWidth',3, 'Color', [0.5 1 0]);
% plot(j, Xa,'LineWidth',3, 'Color', [0.25 0.7 0]);
plot(j, Xa,'LineWidth',3, 'Color', [0 0.5 0]);
set(gca, 'FontName', 'Times New Roman')
ylabel('bar D_A')
axis([0 N 0 1]);
grid on

figure(2)
hold on
% plot(j, Xr,'LineWidth',3, 'Color', [1 35/40 0]);
% plot(j, Xr,'LineWidth',3, 'Color', [1 0.5 0]);
plot(j, Xr,'LineWidth',3, 'Color', [1 0 0]);
set(gca, 'FontName', 'Times New Roman')
ylabel('bar D_R')
axis([0 N 0 1]);
grid on

