function [xr1,xr2,xr12,xa] = IO4Ddecreasing(uu,m,xr10,xr20,xr120,xa0)





a = 1;     %alpha
ab = 1;    %bar alpha
ap = 1;    %alpha prime


b = 1;
bb = 1;      %beta

mu =10;      

e = 0.1;     %epsilon
ee = 0.2;      %epsilon prime

u0a = 0.1;
u01 = 0.1;
u02 = 0.1;

% Parameter values for the input

% use the first three if the input is ur=u1=u2; use the second three if the input is ua


uu1 = uu;
uu2 = uu;
uua = 0;


% uu1 = 0;
% uu2 = 0;
% uua = uu;


N=500;  %Final time

%% build the simulation

% Variables: y1 = bar Dr1 + bar Dr12; y2 = bar Dr2 + bar Dr12; y3 = bar Dr12; y4 = bar Da

sys_dyn = @(t,y) [uu1*(1-y(1)-y(2)-y(4)+ y(3)) + (u01 + ap*y(2))*(1 - y(1) - y(4)) - (m*(e*bb + ee*y(4)))*y(1);...
                  uu2*(1-y(1)-y(2)-y(4)+ y(3)) + (u02 + a*y(2) + ab*y(1))*(1 - y(2) - y(4)) - (mu*(b*e + ee*y(4)))*y(2);...
                 (u01 + ap*y(2))*(y(2) - y(3)) + (u02 + a*y(2) + ab*y(1))*(y(1) - y(3)) - (mu*(b*e + ee*y(4)) + m*(e*bb + ee*y(4)))*y(3);...
                 (u0a + uua + y(4))*(1-y(1)-y(2)-y(4)+ y(3)) - (e + ee*(y(1) + y(2)))*y(4)];



             
[T, Y] = ode45(sys_dyn, [0 N], [xr10 xr20 xr120 xa0]');
              
              
xr1=Y(end,1);           
  
xr2=Y(end,2);  

xr12=Y(end,3);           
  
xa=Y(end,4);            
         

end
