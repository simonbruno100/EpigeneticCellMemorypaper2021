%% Run this code to obtain the stationary distributions - set the proper parameter values in the "runmeeasyFINAL" code

% 1) Run the "runmeeasyFINAL" code multiple time for different initial conditions



[X00,T00] = runmeeasyFINAL(15,15,15,0,15,15,15,0);
save('reactions00','X00','T00');
[X010,T010] = runmeeasyFINAL(15,15,15,0,12,12,12,10);
save('reactions010','X010','T010');
[X020,T020] = runmeeasyFINAL(15,15,15,0,8,8,8,20);
save('reactions020','X020','T020');
[X030,T030] = runmeeasyFINAL(15,15,15,0,5,5,5,30);
save('reactions030','X030','T030');
[X040,T040] = runmeeasyFINAL(15,15,15,0,2,2,2,40);
save('reactions040','X040','T040');
[X050,T050] = runmeeasyFINAL(15,15,15,0,0,0,0,50);
save('reactions050','X050','T050');


[X100,T100] = runmeeasyFINAL(12,12,12,10,15,15,15,0);
save('reactions100','X100','T100');
[X1010,T1010] = runmeeasyFINAL(12,12,12,10,12,12,12,10);
save('reactions1010','X1010','T1010');
[X1020,T1020] = runmeeasyFINAL(12,12,12,10,8,8,8,20);
save('reactions1020','X1020','T1020');
[X1030,T1030] = runmeeasyFINAL(12,12,12,10,5,5,5,30);
save('reactions1030','X1030','T1030');
[X1040,T1040] = runmeeasyFINAL(12,12,12,10,2,2,2,40);
save('reactions1040','X1040','T1040');
[X1050,T1050] = runmeeasyFINAL(12,12,12,10,0,0,0,50);
save('reactions1050','X1050','T1050');



[X200,T200] = runmeeasyFINAL(8,8,8,20,15,15,15,0);
save('reactions200','X200','T200');
[X2010,T2010] = runmeeasyFINAL(8,8,8,20,12,12,12,10);
save('reactions2010','X2010','T2010');
[X2020,T2020] = runmeeasyFINAL(8,8,8,20,8,8,8,20);
save('reactions2020','X2020','T2020');
[X2030,T2030] = runmeeasyFINAL(8,8,8,20,5,5,5,30);
save('reactions2030','X2030','T2030');
[X2040,T2040] = runmeeasyFINAL(8,8,8,20,2,2,2,40);
save('reactions2040','X2040','T2040');
[X2050,T2050] = runmeeasyFINAL(8,8,8,20,0,0,0,50);
save('reactions2050','X2050','T2050');



[X300,T300] = runmeeasyFINAL(5,5,5,30,15,15,15,0);
save('reactions300','X300','T300');
[X3010,T3010] = runmeeasyFINAL(5,5,5,30,12,12,12,10);
save('reactions3010','X3010','T3010');
[X3020,T3020] = runmeeasyFINAL(5,5,5,30,8,8,8,20);
save('reactions3020','X3020','T3020');
[X3030,T3030] = runmeeasyFINAL(5,5,5,30,5,5,5,30);
save('reactions3030','X3030','T3030');
[X3040,T3040] = runmeeasyFINAL(5,5,5,30,2,2,2,40);
save('reactions3040','X3040','T3040');
[X3050,T3050] = runmeeasyFINAL(5,5,5,30,0,0,0,50);
save('reactions3050','X3050','T3050');




[X400,T400] = runmeeasyFINAL(2,2,2,40,15,15,15,0);
save('reactions400','X400','T400');
[X4010,T4010] = runmeeasyFINAL(2,2,2,40,12,12,12,10);
save('reactions4010','X4010','T4010');
[X4020,T4020] = runmeeasyFINAL(2,2,2,40,8,8,8,20);
save('reactions4020','X4020','T4020');
[X4030,T4030] = runmeeasyFINAL(2,2,2,40,5,5,5,30);
save('reactions4030','X4030','T4030');
[X4040,T4040] = runmeeasyFINAL(2,2,2,40,2,2,2,40);
save('reactions4040','X4040','T4040');
[X4050,T4050] = runmeeasyFINAL(2,2,2,40,0,0,0,50);
save('reactions4050','X4050','T4050');




[X500,T500] = runmeeasyFINAL(0,0,0,50,15,15,15,0);
save('reactions500','X500','T500');
[X5010,T5010] = runmeeasyFINAL(0,0,0,50,12,12,12,10);
save('reactions5010','X5010','T5010');
[X5020,T5020] = runmeeasyFINAL(0,0,0,50,8,8,8,20);
save('reactions5020','X5020','T5020');
[X5030,T5030] = runmeeasyFINAL(0,0,0,50,5,5,5,30);
save('reactions5030','X5030','T5030');
[X5040,T5040] = runmeeasyFINAL(0,0,0,50,2,2,2,40);
save('reactions5040','X5040','T5040');
[X5050,T5050] = runmeeasyFINAL(0,0,0,50,0,0,0,50);
save('reactions5050','X5050','T5050');


a = 1;

xf = [X00(end-a:end,1:12)/p.V;...
     X010(end-a:end,1:12)/p.V;...
     X020(end-a:end,1:12)/p.V;...
     X030(end-a:end,1:12)/p.V;...
     X040(end-a:end,1:12)/p.V;...
     X050(end-a:end,1:12)/p.V;...
     X100(end-a:end,1:12)/p.V;...
     X1010(end-a:end,1:12)/p.V;...
     X1020(end-a:end,1:12)/p.V;...
     X1030(end-a:end,1:12)/p.V;...
     X1040(end-a:end,1:12)/p.V;...
     X1050(end-a:end,1:12)/p.V;...
     X200(end-a:end,1:12)/p.V;...
     X2010(end-a:end,1:12)/p.V;...
     X2020(end-a:end,1:12)/p.V;...
     X2030(end-a:end,1:12)/p.V;...
     X2040(end-a:end,1:12)/p.V;...
     X2050(end-a:end,1:12)/p.V;...     
     X300(end-a:end,1:12)/p.V;...
     X3010(end-a:end,1:12)/p.V;...
     X3020(end-a:end,1:12)/p.V;...
     X3030(end-a:end,1:12)/p.V;...
     X3040(end-a:end,1:12)/p.V;...
     X3050(end-a:end,1:12)/p.V;...     
     X400(end-a:end,1:12)/p.V;...
     X4010(end-a:end,1:12)/p.V;...
     X4020(end-a:end,1:12)/p.V;...
     X4030(end-a:end,1:12)/p.V;...
     X4040(end-a:end,1:12)/p.V;...
     X4050(end-a:end,1:12)/p.V;...     
     X500(end-a:end,1:12)/p.V;...
     X5010(end-a:end,1:12)/p.V;...
     X5020(end-a:end,1:12)/p.V;...
     X5030(end-a:end,1:12)/p.V;...
     X5040(end-a:end,1:12)/p.V;...
     X5050(end-a:end,1:12)/p.V;...
     0 0 0 50  0 0 0 0 0  0  0 0;...
     0 0 0 50  0 0 0 0 0  0 50 0;...
     0 0 0  0 50 0 0 0 0 50  0 0 ...
     ];
 
 

% increase the maximum i in order to have more data points
 for i=1:1:100;
     
     [X00,T00] = runmeeasyFINAL(15,15,15,0,15,15,15,0);
save('reactions00','X00','T00');
[X010,T010] = runmeeasyFINAL(15,15,15,0,12,12,12,10);
save('reactions010','X010','T010');
[X020,T020] = runmeeasyFINAL(15,15,15,0,8,8,8,20);
save('reactions020','X020','T020');
[X030,T030] = runmeeasyFINAL(15,15,15,0,5,5,5,30);
save('reactions030','X030','T030');
[X040,T040] = runmeeasyFINAL(15,15,15,0,2,2,2,40);
save('reactions040','X040','T040');
[X050,T050] = runmeeasyFINAL(15,15,15,0,0,0,0,50);
save('reactions050','X050','T050');


[X100,T100] = runmeeasyFINAL(12,12,12,10,15,15,15,0);
save('reactions100','X100','T100');
[X1010,T1010] = runmeeasyFINAL(12,12,12,10,12,12,12,10);
save('reactions1010','X1010','T1010');
[X1020,T1020] = runmeeasyFINAL(12,12,12,10,8,8,8,20);
save('reactions1020','X1020','T1020');
[X1030,T1030] = runmeeasyFINAL(12,12,12,10,5,5,5,30);
save('reactions1030','X1030','T1030');
[X1040,T1040] = runmeeasyFINAL(12,12,12,10,2,2,2,40);
save('reactions1040','X1040','T1040');
[X1050,T1050] = runmeeasyFINAL(12,12,12,10,0,0,0,50);
save('reactions1050','X1050','T1050');



[X200,T200] = runmeeasyFINAL(8,8,8,20,15,15,15,0);
save('reactions200','X200','T200');
[X2010,T2010] = runmeeasyFINAL(8,8,8,20,12,12,12,10);
save('reactions2010','X2010','T2010');
[X2020,T2020] = runmeeasyFINAL(8,8,8,20,8,8,8,20);
save('reactions2020','X2020','T2020');
[X2030,T2030] = runmeeasyFINAL(8,8,8,20,5,5,5,30);
save('reactions2030','X2030','T2030');
[X2040,T2040] = runmeeasyFINAL(8,8,8,20,2,2,2,40);
save('reactions2040','X2040','T2040');
[X2050,T2050] = runmeeasyFINAL(8,8,8,20,0,0,0,50);
save('reactions2050','X2050','T2050');



[X300,T300] = runmeeasyFINAL(5,5,5,30,15,15,15,0);
save('reactions300','X300','T300');
[X3010,T3010] = runmeeasyFINAL(5,5,5,30,12,12,12,10);
save('reactions3010','X3010','T3010');
[X3020,T3020] = runmeeasyFINAL(5,5,5,30,8,8,8,20);
save('reactions3020','X3020','T3020');
[X3030,T3030] = runmeeasyFINAL(5,5,5,30,5,5,5,30);
save('reactions3030','X3030','T3030');
[X3040,T3040] = runmeeasyFINAL(5,5,5,30,2,2,2,40);
save('reactions3040','X3040','T3040');
[X3050,T3050] = runmeeasyFINAL(5,5,5,30,0,0,0,50);
save('reactions3050','X3050','T3050');




[X400,T400] = runmeeasyFINAL(2,2,2,40,15,15,15,0);
save('reactions400','X400','T400');
[X4010,T4010] = runmeeasyFINAL(2,2,2,40,12,12,12,10);
save('reactions4010','X4010','T4010');
[X4020,T4020] = runmeeasyFINAL(2,2,2,40,8,8,8,20);
save('reactions4020','X4020','T4020');
[X4030,T4030] = runmeeasyFINAL(2,2,2,40,5,5,5,30);
save('reactions4030','X4030','T4030');
[X4040,T4040] = runmeeasyFINAL(2,2,2,40,2,2,2,40);
save('reactions4040','X4040','T4040');
[X4050,T4050] = runmeeasyFINAL(2,2,2,40,0,0,0,50);
save('reactions4050','X4050','T4050');




[X500,T500] = runmeeasyFINAL(0,0,0,50,15,15,15,0);
save('reactions500','X500','T500');
[X5010,T5010] = runmeeasyFINAL(0,0,0,50,12,12,12,10);
save('reactions5010','X5010','T5010');
[X5020,T5020] = runmeeasyFINAL(0,0,0,50,8,8,8,20);
save('reactions5020','X5020','T5020');
[X5030,T5030] = runmeeasyFINAL(0,0,0,50,5,5,5,30);
save('reactions5030','X5030','T5030');
[X5040,T5040] = runmeeasyFINAL(0,0,0,50,2,2,2,40);
save('reactions5040','X5040','T5040');
[X5050,T5050] = runmeeasyFINAL(0,0,0,50,0,0,0,50);
save('reactions5050','X5050','T5050');
     

a=1;

xf = [xf;...
     X00(end-a:end,1:12)/p.V;...
     X010(end-a:end,1:12)/p.V;...
     X020(end-a:end,1:12)/p.V;...
     X030(end-a:end,1:12)/p.V;...
     X040(end-a:end,1:12)/p.V;...
     X050(end-a:end,1:12)/p.V;...
     X100(end-a:end,1:12)/p.V;...
     X1010(end-a:end,1:12)/p.V;...
     X1020(end-a:end,1:12)/p.V;...
     X1030(end-a:end,1:12)/p.V;...
     X1040(end-a:end,1:12)/p.V;...
     X1050(end-a:end,1:12)/p.V;...
     X200(end-a:end,1:12)/p.V;...
     X2010(end-a:end,1:12)/p.V;...
     X2020(end-a:end,1:12)/p.V;...
     X2030(end-a:end,1:12)/p.V;...
     X2040(end-a:end,1:12)/p.V;...
     X2050(end-a:end,1:12)/p.V;...     
     X300(end-a:end,1:12)/p.V;...
     X3010(end-a:end,1:12)/p.V;...
     X3020(end-a:end,1:12)/p.V;...
     X3030(end-a:end,1:12)/p.V;...
     X3040(end-a:end,1:12)/p.V;...
     X3050(end-a:end,1:12)/p.V;...     
     X400(end-a:end,1:12)/p.V;...
     X4010(end-a:end,1:12)/p.V;...
     X4020(end-a:end,1:12)/p.V;...
     X4030(end-a:end,1:12)/p.V;...
     X4040(end-a:end,1:12)/p.V;...
     X4050(end-a:end,1:12)/p.V;...     
     X500(end-a:end,1:12)/p.V;...
     X5010(end-a:end,1:12)/p.V;...
     X5020(end-a:end,1:12)/p.V;...
     X5030(end-a:end,1:12)/p.V;...
     X5040(end-a:end,1:12)/p.V;...
     X5050(end-a:end,1:12)/p.V;...
     ];     
     
     
 end
 
 
 x=xf;
 
x1=x(:,5);
x2=x(:,11);
     
     

figure(1)
histogram2(x1,x2,[50 50],'Normalization','probability');
set(gca, 'FontName', 'Times New Roman','FontSize',18)
grid on
grid minor
xlabel('n_{D^A_x}');
ylabel('n_{D^A_z}');
% axis ([0 51 0 51 0 0.1]);
% set(get(gca,'child'),'FaceColor','interp','CDataMode','auto');
 
 