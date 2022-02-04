

% Parameter values


p.u10=0.1;
p.u20=0.1;
p.ua0=0.1;

p.u1=0;
p.u2=0;
p.ua=0;


p.a=1;       %alpha
p.abar=1;    %alpha bar
p.aprime=1;  %alpha prime




p.b=1;
p.beta=1;    %beta

p.mu=1;
p.mup=0.1;    %muprime


p.eprime=1; %epsilon

p.ka=6;    %tilde ua


p.e=0.1;   % epsilon
px=0.4625; % bar px





% equilibrium point picked from the mathematica code
 
y1=0.990572;          %y1= x1 in the mathematica code
y2= 0.953326;         %y2= x2 in the mathematica code
x3=0.944359;          %x3= x3 in the mathematica code
x4=0.0000214879;      %x4= x4 in the mathematica code
x5=px*x4;




%Jacobian


A=[-p.u1-(p.u10+p.aprime*y2)-p.mup*(p.beta*p.e+p.eprime*x4), -p.u1+p.aprime*(1-y1-x4),...
    p.u1, -p.u1-(p.u10+p.aprime*y2)-p.mup*p.eprime*y1, 0;...
   -p.u2+p.abar*(1-y2-x4), -p.u2+p.a*(1-y2-x4)-(p.u20+p.a*y2+p.abar*y1)-p.mu*(p.b*p.e+p.eprime*x4),...
    p.u2, p.u2-(p.u20+p.a*y2+p.abar*y1)-p.mu*p.eprime*y2, 0;...
    (p.u20+p.a*y2+p.abar*y1)+p.abar*(y1-x3), p.aprime*(y2-x3)+(p.u10+p.aprime*y2)+p.a*(y1-x3),...
   -(p.u10+p.aprime*y2)-(p.u20+p.a*y2+p.abar*y1)-(p.mup*(p.beta*p.e+p.eprime*x4)+p.mu*(p.b*p.e+p.eprime*x4)), -(p.mup+p.mu)*p.eprime*x3, 0;...
    -(p.ua0+p.ka*x5+x4)-p.eprime*x4, -(p.ua0+p.ka*x5+x4)-p.eprime*x4,...
    (p.ua0+p.ka*x5+x4), -(p.ua0+p.ka*x5+x4)+(1-y1-y2-x4+x3)-(p.e+p.eprime*(y1+y2)), p.ka*(1-y1-y2-x4+x3);...
    0 0 0 px -1];
    

%eigenvalues

B=eig(A)