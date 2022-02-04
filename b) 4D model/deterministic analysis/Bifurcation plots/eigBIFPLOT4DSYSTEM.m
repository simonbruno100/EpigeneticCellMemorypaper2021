

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

p.mu=10;    
p.mup=10;    %muprime


p.e=0.1;     %epsilon
p.eprime=1;  %epsilon prime


% equilibrium point picked from the mathematica code

y1 = 1;         %y1= x1 in the mathematica code
y2 = 1;         %y2 = x2 in the mathematica code
x3 = 1;         %x3 = x3 in the mathematica code
x4 = 0;         %x4 = x4 in the mathematica code




%Jacobian

A=[-p.u1-(p.u10+p.aprime*y2)-p.mup*(p.beta*p.e+p.eprime*x4), -p.u1+p.aprime*(1-y1-x4),...
    p.u1, -p.u1-(p.u10+p.aprime*y2)-p.mup*p.eprime*y1;...
   -p.u2+p.abar*(1-y2-x4), -p.u2+p.a*(1-y2-x4)-(p.u20+p.a*y2+p.abar*y1)-p.mu*(p.b*p.e+p.eprime*x4),...
    p.u2, p.u2-(p.u20+p.a*y2+p.abar*y1)-p.mu*p.eprime*y2;...
    (p.u20+p.a*y2+p.abar*y1)+p.abar*(y1-x3), p.aprime*(y2-x3)+(p.u10+p.aprime*y2)+p.a*(y1-x3),...
   -(p.u10+p.aprime*y2)-(p.u20+p.a*y2+p.abar*y1)-(p.mup*(p.beta*p.e+p.eprime*x4)+p.mu*(p.b*p.e+p.eprime*x4)), -(p.mup+p.mu)*p.eprime*x3;...
    -(p.ua0+p.ua+x4)-p.eprime*x4, -(p.ua0+p.ua+x4)-p.eprime*x4,...
    (p.ua0+p.ua+x4), -(p.ua0+p.ua+x4)+(1-y1-y2-x4+x3)-(p.e+p.eprime*(y1+y2))];
    

%eigenvalues

B=eig(A)

