
%% Code for the plots in Figure 5(f) 

% IC selected are (n_{DA},n_{DR1},n_{DR2},n_{DR12})=(45,0,0,0) 

[X010,T010] = runmeeasy(45,0,0,0);
[X010,T010] = runmeeasyBIS(X010(end,5),X010(end,2),X010(end,3),X010(end,4),0,X010(end,7),T010(end),1);
[X010,T010] = runmeeasyBIS(X010(end,5),X010(end,2),X010(end,3),X010(end,4),0,X010(end,7),T010(end),2);
[X010,T010] = runmeeasyBIS(X010(end,5),X010(end,2),X010(end,3),X010(end,4),0,X010(end,7),T010(end),3);