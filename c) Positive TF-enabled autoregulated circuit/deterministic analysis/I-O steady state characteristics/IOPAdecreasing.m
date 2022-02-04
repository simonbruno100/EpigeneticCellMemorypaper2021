function [xr1,xr2,xr12,xa,xx] = IOPAdecreasing(uuaa,m,xr10,xr20,xr120,xa0,xx0,ax)

% Parameter values

ka=6;       %tilde ua
ex=1;       %epsilon x

a = 0.1;     %alpha
ab = 0.1;    %bar alpha
ap = 0.1;    %alpha prime

b = 1;
bb = 1;      %beta

mu = 1;

e = 0.1;     %epsilon
ee = 1;      %epsilon prime


u0a = 0.1;
u01 = 0.1;
u02 = 0.1;




uu1 = uuaa;
uu2 = uuaa;
uua = 0;



N=1000; %Final time

%% build the simulation

% Variables: y1 = bar Dr1 + bar Dr12; y2 = bar Dr2 + bar Dr12; y3 = bar Dr12; y4 = bar Da; y4 = bar X


sys_dyn = @(t,y) [uu1*(1-y(1)-y(2)-y(4)+ y(3)) + (u01 + ap*y(2))*(1 - y(1) - y(4)) - (m*(e*bb + ee*y(4)))*y(1);...
                  uu2*(1-y(1)-y(2)-y(4)+ y(3)) + (u02 + a*y(2) + ab*y(1))*(1 - y(2) - y(4)) - (mu*(b*e + ee*y(4)))*y(2);...
                 (u01 + ap*y(2))*(y(2) - y(3)) + (u02 + a*y(2) + ab*y(1))*(y(1) - y(3)) - (mu*(b*e + ee*y(4)) + m*(e*bb + ee*y(4)))*y(3);...
                 (u0a + uua + ka*y(5) + y(4))*(1-y(1)-y(2)-y(4)+ y(3)) - (e + ee*(y(1) + y(2)))*y(4);...
                  ax*y(4)-ex*y(5)];
              

[T, Y] = ode45(sys_dyn, [0 N], [xr10 xr20 xr120 xa0 xx0]');
              
              
xr1=Y(end,1);           
  
xr2=Y(end,2);  

xr12=Y(end,3);           
  
xa=Y(end,4);            
         
xx=Y(end,5);  


end
