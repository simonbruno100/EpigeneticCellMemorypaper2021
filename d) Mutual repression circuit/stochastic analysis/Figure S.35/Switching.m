%% Code for the plots in Figure S.34

%% 1) Run line 5. IC selected are (n_{DR1x},n_{DR2x},n_{DR12x},n_{DAx},n_{DR1z},n_{DR2z},n_{DR12z},n_{DAz})=(0,0,0,45,5,5,35,0)

[X010,T010] = runmeeasyFINALoverexpression(0,0,0,50,0,0,50,0);


%% 2) Run line 10

[X010,T010] = runmeeasyFINALBISoverexpression(X010(end,2),X010(end,3),X010(end,4),X010(end,5),X010(end,6),X010(end,8),X010(end,9),X010(end,10),X010(end,11),X010(end,12),X010(end,13),X010(end,14),X010(end,15),X010(end,16),T010(end),1);


%% 3) Set p.kwaa2 = 5 or 10 (depending on th plot in Fig. S.34 you want to obtain) in runmeeasyFINALBISoverexpression.m and run line 15

[X010,T010] = runmeeasyFINALBISoverexpression(X010(end,2),X010(end,3),X010(end,4),X010(end,5),X010(end,6),X010(end,8),X010(end,9),X010(end,10),X010(end,11),X010(end,12),X010(end,13),X010(end,14),X010(end,15),X010(end,16),T010(end),2);


%% 4) Set p.kwaa2 = 0 in runmeeasyFINALBISoverexpression.m and run line 20

[X010,T010] = runmeeasyFINALBISoverexpression(X010(end,2),X010(end,3),X010(end,4),X010(end,5),X010(end,6),X010(end,8),X010(end,9),X010(end,10),X010(end,11),X010(end,12),X010(end,13),X010(end,14),X010(end,15),X010(end,16),T010(end),3);


%% 5) Set p.kwaa1 = 5 or 10 (depending on th plot in Fig. S.34 you want to obtain) in runmeeasyFINALBISoverexpression.m and run line 25

[X010,T010] = runmeeasyFINALBISoverexpression(X010(end,2),X010(end,3),X010(end,4),X010(end,5),X010(end,6),X010(end,8),X010(end,9),X010(end,10),X010(end,11),X010(end,12),X010(end,13),X010(end,14),X010(end,15),X010(end,16),T010(end),4);


%% 6) Set p.kwaa1 = 0 in runmeeasyFINALBISoverexpression.m and run line 30

[X010,T010] = runmeeasyFINALBISoverexpression(X010(end,2),X010(end,3),X010(end,4),X010(end,5),X010(end,6),X010(end,8),X010(end,9),X010(end,10),X010(end,11),X010(end,12),X010(end,13),X010(end,14),X010(end,15),X010(end,16),T010(end),5);

