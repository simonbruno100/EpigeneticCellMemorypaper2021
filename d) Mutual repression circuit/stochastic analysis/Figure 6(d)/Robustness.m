%% Code for the plots in Figure 6(d) 

% IC selected are (n_{DR1x},n_{DR2x},n_{DR12x},n_{DAx},n_{DR1z},n_{DR2z},n_{DR12z},n_{DAz})=(0,0,0,45,5,5,35,0)

[X010,T010] = runmeeasyFINAL(0,0,0,50,0,0,50,0);
[X010,T010] = runmeeasyFINALBIS(X010(end,2),X010(end,3),X010(end,4),X010(end,5),0,X010(end,8),X010(end,9),X010(end,10),X010(end,11),0,X010(end,13),X010(end,14),X010(end,15),X010(end,16),T010(end),1);
[X010,T010] = runmeeasyFINALBIS(X010(end,2),X010(end,3),X010(end,4),X010(end,5),0,X010(end,8),X010(end,9),X010(end,10),X010(end,11),0,X010(end,13),X010(end,14),X010(end,15),X010(end,16),T010(end),2);
[X010,T010] = runmeeasyFINALBIS(X010(end,2),X010(end,3),X010(end,4),X010(end,5),0,X010(end,8),X010(end,9),X010(end,10),X010(end,11),0,X010(end,13),X010(end,14),X010(end,15),X010(end,16),T010(end),3);
[X010,T010] = runmeeasyFINALBIS(X010(end,2),X010(end,3),X010(end,4),X010(end,5),0,X010(end,8),X010(end,9),X010(end,10),X010(end,11),0,X010(end,13),X010(end,14),X010(end,15),X010(end,16),T010(end),4);
[X010,T010] = runmeeasyFINALBIS(X010(end,2),X010(end,3),X010(end,4),X010(end,5),0,X010(end,8),X010(end,9),X010(end,10),X010(end,11),0,X010(end,13),X010(end,14),X010(end,15),X010(end,16),T010(end),5);



