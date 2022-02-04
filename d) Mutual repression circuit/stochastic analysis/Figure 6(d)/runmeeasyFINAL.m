
function [Xfin,Tfin] = runmeeasyFINAL(D11_initial,D21_initial,D121_initial,Da1_initial,D12_initial,D22_initial,D122_initial,Da2_initial);

%%   System reactions

% PLEASE NOTE:
%a) D1 = n_{Dx}, Da1 = n_{DAx}; D11 = n_{DR1x}; D21 = n_{DR2x}; D121 = n_{DR12x}; P1 = n_{X}; Ca1 = n_{Cax}; Cr1 = n_{Crx}
%b) D2 = n_{Dz}, Da2 = n_{DAz}; D12 = n_{DR1z}; D22 = n_{DR2z}; D122 = n_{DR12z}; P2 = n_{Z}; Ca2 = n_{Caz}; Cr2 = n_{Crz}

%   1. D1       + P1        --    a           --> Ca1
%   2. Ca1                 --    d           --> D1 + P1
%   3. D1       + P2        --    a           --> Cr1
%   4. Cr1                 --    d           --> D1 + P2
%   5. D1                  --    kw10           --> D11
%   6. Ca1                  --    kw10           --> D11 + P1
%   7. Cr1                  --    kw10           --> D11 + P2
%   8. Cr1                  --    kw1            --> D11 + P2
%   9. D1                 --    kmprime        --> D11
%  10. D1                 --    kmprime        --> D11
%  11. Cr1                 --    kmprime        --> D11 + P2
%  12. Cr1                 --    kmprime        --> D11 + P2
%  13. Ca1                 --    kmprime        --> D11 + P1
%  14. Ca1                 --    kmprime        --> D11 + P1
%  15. D11                 --    deltaprime     --> D1
%  16. D11                 --    ktprime        --> D1 
%  17. D11                 --    ktprimeact     --> D1
%  18. D11                 --    kw20           --> D121
%  19. D11                 --    km             --> D121
%  20. D11                 --    km             --> D121
%  21. D11                 --    kmbar          --> D121
%  22. D11                 --    kmbar          --> D121
%  23. D121                --    delta          --> D11
%  24. D121                --    ke             --> D11
%  25. D121                --    keact          --> D11
%  26. D1                  --    kw20           --> D21
%  27. Ca1                  --    kw20           --> D21 + P1
%  28. Cr1                  --    kw20           --> D21 + P2
%  29. Cr1                  --    kw2            --> D21 + P2
%  30. D1                  --    km             --> D21
%  31. D1                  --    km             --> D21
%  32. Cr1                  --    km             --> D21 + P2
%  33. Cr1                  --    km             --> D21 + P2
%  34. Ca1                  --    km             --> D21 + P1
%  35. Ca1                  --    km             --> D21 + P1
%  36. D1                  --    kmbar          --> D21
%  37. D1                  --    kmbar          --> D21
%  38. Cr1                  --    kmbar          --> D21+ P2
%  39. Cr1                  --    kmbar          --> D21+ P2
%  40. Ca1                  --    kmbar          --> D21+ P1
%  41. Ca1                  --    kmbar          --> D21+ P1
%  42. D21                 --    delta          --> D1
%  43. D21                 --    ke             --> D1
%  44. D21                 --    keact          --> D1
%  45. D21                 --    kw10           --> D121
%  46. D21                 --    kmprime        --> D121
%  47. D21                 --    kmprime        --> D121
%  48. D121                --    deltaprime     --> D21
%  49. D121                --    ktprime        --> D21
%  50. D121                --    ktprimeact     --> D21
%  51. D1                  --    kwa0           --> Da1
%  52. Ca1                  --    kwa0           --> Da1 + P1
%  53. Cr1                  --    kwa0           --> Da1 + P2
%  54. Ca1                  --    kwa            --> Da1 + P1
%  55. D1                  --    kma            --> Da1
%  56. Ca1                  --    kma            --> Da1 + P1
%  57. Cr1                  --    kma            --> Da1 + P2
%  58. Da1                 --    delta          --> D1
%  59. Da1                 --    kea            --> D1
%  60. Da1                 --    keacta         --> D1
%  61. Da1                 --    keacta         --> D1
%  62. Da1                 --    keacta         --> D1
%  63. Da1                 --    keacta         --> D1
%  64. Da1                  --    b              --> Da1+ P1
%  65. P1                  --    g              --> 0
%  66. Ca1                  --    delta              --> D1+P1
%  67. Cr1                 --    delta              --> D1+P2
%  68. D2       + P2        --    a           --> Ca2
%  69. Ca2                 --    d           --> D2 + P2
%  70. D2       + P1        --    a           --> Cr2
%  71. Cr2                 --    d           --> D2 + P1
%  72. D2                  --    kw10           --> D12
%  73. Ca2                  --    kw10           --> D12 + P2
%  74. Cr2                  --    kw10           --> D12 + P1
%  75. Cr2                 --    kw1            --> D12 + P1
%  76. D2                  --    kmprime        --> D12
%  77. D2                  --    kmprime        --> D12
%  78. Cr2                 --    kmprime        --> D12 + P1
%  79. Cr2                 --    kmprime        --> D12 + P1
%  80. Ca2                 --    kmprime        --> D12 + P2
%  81. Ca2                 --    kmprime        --> D12 + P2
%  82. D12                 --    deltaprime     --> D2
%  83. D12                 --    ktprime        --> D2 
%  84. D12                --    ktprimeact     --> D2
%  85. D12                 --    kw20           --> D122
%  86. D12                 --    km             --> D122
%  87. D12                 --    km             --> D122
%  88. D12                 --    kmbar          --> D122
%  89. D12                 --    kmbar          --> D122
%  90. D122                --    delta          --> D12
%  91. D122                --    ke             --> D12
%  92. D122                --    keact          --> D12
%  93. D2                  --    kw20           --> D22
%  94. Ca2                  --    kw20           --> D22 + P2
%  95. Cr2                  --    kw20           --> D22 + P1
%  96. Cr2                  --    kw2            --> D22 + P1
%  97. D2                  --    km             --> D22
%  98. D2                  --    km             --> D22
%  99. Cr2                  --    km             --> D22 + P1
% 100. Cr2                  --    km             --> D22 + P1
% 101. Ca2                  --    km             --> D22 + P2
% 102. Ca2                  --    km             --> D22 + P2
% 103. D2                  --    kmbar          --> D22
% 104. D2                  --    kmbar          --> D22
% 105. Cr2                  --    kmbar          --> D22+ P1
% 106. Cr2                  --    kmbar          --> D22+ P1
% 107. Ca2                  --    kmbar          --> D22+ P2
% 108. Ca2                  --    kmbar          --> D22+ P2
% 109. D22                 --    delta          --> D2
% 110. D22                 --    ke             --> D2
% 111. D22                 --    keact          --> D2
% 112. D22                 --    kw10           --> D122
% 113. D22                 --    kmprime        --> D122
% 114. D22                 --    kmprime        --> D122
% 115. D122                --    deltaprime     --> D22
% 116. D122                --    ktprime        --> D22
% 117. D122                --    ktprimeact     --> D22
% 118. D2                  --    kwa0           --> Da2
% 119. Ca2                  --    kwa0           --> Da2 + P2
% 120. Cr2                  --    kwa0           --> Da2 + P1
% 121. Ca2                  --    kwa            --> Da2 + P2
% 122. D2                  --    kma            --> Da2
% 123. Ca2                  --    kma            --> Da2 + P2
% 124. Cr2                  --    kma            --> Da2 + P1
% 125. Da2                 --    delta          --> D2
% 126. Da2                 --    kea            --> D2
% 127. Da2                 --    keacta         --> D2
% 128. Da2                 --    keacta         --> D2
% 129. Da2                 --    keacta         --> D2
% 130. Da2                 --    keacta         --> D2
% 131. Da2                  --    b              --> Da2+ P2
% 132. P2                  --    g              --> 0
% 133. Ca2                  --    delta              --> D2 + P2
% 134. Cr2                  --    delta              --> D2 + P1


%% Parameter values


Dt = 50; % Dtot

p.V = 1; % Volume



p.a=10;
p.d=10;




p.kkw10=3.5;       %kw10
p.kkw1=300;        %kw1

p.kkmprime=0.2;    %km prime

p.deltaprime=10.5;    %delta prime
p.ktprime=10.5;       %kt prime 
p.kktprime=0.6;      %kt prime star



%%%


p.kkw20=3.5;  %kw20
p.kkw2=300;   %kw2

p.kkm=0.2;    %km
p.kkmbar=0.2; %km bar

p.delta=17.5;    %delta
p.ke=17.5;       %bar keR
p.kkeact=1;   %keR


%%%


p.kkwa0=3.5;       %kwA0
p.kkwa=300;        %kwA

p.kkma=1;        %kmA


p.kea=17.5;         %bar keA

p.kkeacta=1;     %keA



p.bbx=0.15;      %alpha x
p.bbz=0.15;      %alpha z
p.gg=1;          %gamma x, gamma z





%% Initial conditions

Ca1_initial = 0;
Cr1_initial = 0;
P1_initial = 7.5;

Ca2_initial = 0;
Cr2_initial = 0;
P2_initial = 0;

D1_initial = Dt - D11_initial - D21_initial - D121_initial - Da1_initial - Ca1_initial - Cr1_initial;

D2_initial = Dt - D12_initial - D22_initial - D122_initial - Da2_initial - Ca2_initial - Cr2_initial;



IC = [D1_initial, D11_initial, D21_initial, D121_initial, Da1_initial,  P1_initial, ...
      D2_initial, D12_initial, D22_initial, D122_initial, Da2_initial, P2_initial,...
      Ca1_initial, Cr1_initial, Ca2_initial, Cr2_initial];

%% Initial state
tinterval = [0, 12]; %hours --> this value multipled by Dt*p.kma will give the corresponding normalized time tau

x0    = IC;
x0    = round(x0);

%% Specify reaction network
pfun = @propensity_functions;

%specie: D1, D11, D21, D121, Da1, X1,    D2, D12, D22, D122, Da2, X2, ca1, cr1, ca2, cr2  16

stoich_matrix = [-1  0  0  0  0 -1  0  0  0  0  0  0  1  0  0  0
                  1  0  0  0  0  1  0  0  0  0  0  0 -1  0  0  0
                 -1  0  0  0  0  0  0  0  0  0  0 -1  0  1  0  0
                  1  0  0  0  0  0  0  0  0  0  0  1  0 -1  0  0                 
                 -1  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0                
                  0  1  0  0  0  1  0  0  0  0  0  0 -1  0  0  0                
                  0  1  0  0  0  0  0  0  0  0  0  1  0 -1  0  0               
                  0  1  0  0  0  0  0  0  0  0  0  1  0 -1  0  0
                 -1  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0
                 -1  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0                 
                  0  1  0  0  0  0  0  0  0  0  0  1  0 -1  0  0
                  0  1  0  0  0  0  0  0  0  0  0  1  0 -1  0  0                  
                  0  1  0  0  0  1  0  0  0  0  0  0 -1  0  0  0
                  0  1  0  0  0  1  0  0  0  0  0  0 -1  0  0  0                  
                  1 -1  0  0  0  0  0  0  0  0  0  0  0  0  0  0
                  1 -1  0  0  0  0  0  0  0  0  0  0  0  0  0  0
                  1 -1  0  0  0  0  0  0  0  0  0  0  0  0  0  0
                  0 -1  0  1  0  0  0  0  0  0  0  0  0  0  0  0
                  0 -1  0  1  0  0  0  0  0  0  0  0  0  0  0  0
                  0 -1  0  1  0  0  0  0  0  0  0  0  0  0  0  0                  
                  0 -1  0  1  0  0  0  0  0  0  0  0  0  0  0  0
                  0 -1  0  1  0  0  0  0  0  0  0  0  0  0  0  0                  
                  0  1  0 -1  0  0  0  0  0  0  0  0  0  0  0  0
                  0  1  0 -1  0  0  0  0  0  0  0  0  0  0  0  0
                  0  1  0 -1  0  0  0  0  0  0  0  0  0  0  0  0                  
                 -1  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0
                  0  0  1  0  0  1  0  0  0  0  0  0 -1  0  0  0
                  0  0  1  0  0  0  0  0  0  0  0  1  0 -1  0  0
                  0  0  1  0  0  0  0  0  0  0  0  1  0 -1  0  0                 
                 -1  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0               
                 -1  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0                  
                  0  0  1  0  0  0  0  0  0  0  0  1  0 -1  0  0
                  0  0  1  0  0  0  0  0  0  0  0  1  0 -1  0  0                  
                  0  0  1  0  0  1  0  0  0  0  0  0 -1  0  0  0
                  0  0  1  0  0  1  0  0  0  0  0  0 -1  0  0  0                 
                 -1  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0
                 -1  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0                 
                  0  0  1  0  0  0  0  0  0  0  0  1  0 -1  0  0 
                  0  0  1  0  0  0  0  0  0  0  0  1  0 -1  0  0                  
                  0  0  1  0  0  1  0  0  0  0  0  0 -1  0  0  0
                  0  0  1  0  0  1  0  0  0  0  0  0 -1  0  0  0                  
                  1  0 -1  0  0  0  0  0  0  0  0  0  0  0  0  0
                  1  0 -1  0  0  0  0  0  0  0  0  0  0  0  0  0
                  1  0 -1  0  0  0  0  0  0  0  0  0  0  0  0  0                  
                  0  0 -1  1  0  0  0  0  0  0  0  0  0  0  0  0
                  0  0 -1  1  0  0  0  0  0  0  0  0  0  0  0  0 
                  0  0 -1  1  0  0  0  0  0  0  0  0  0  0  0  0                    
                  0  0  1 -1  0  0  0  0  0  0  0  0  0  0  0  0
                  0  0  1 -1  0  0  0  0  0  0  0  0  0  0  0  0
                  0  0  1 -1  0  0  0  0  0  0  0  0  0  0  0  0                  
                 -1  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0
                  0  0  0  0  1  1  0  0  0  0  0  0 -1  0  0  0
                  0  0  0  0  1  0  0  0  0  0  0  1  0 -1  0  0
                  0  0  0  0  1  1  0  0  0  0  0  0 -1  0  0  0
                 -1  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0
                  0  0  0  0  1  1  0  0  0  0  0  0 -1  0  0  0
                  0  0  0  0  1  0  0  0  0  0  0  1  0 -1  0  0
                  1  0  0  0 -1  0  0  0  0  0  0  0  0  0  0  0
                  1  0  0  0 -1  0  0  0  0  0  0  0  0  0  0  0
                  1  0  0  0 -1  0  0  0  0  0  0  0  0  0  0  0
                  1  0  0  0 -1  0  0  0  0  0  0  0  0  0  0  0                  
                  1  0  0  0 -1  0  0  0  0  0  0  0  0  0  0  0
                  1  0  0  0 -1  0  0  0  0  0  0  0  0  0  0  0                  
                  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0
                  0  0  0  0  0 -1  0  0  0  0  0  0  0  0  0  0
                  1  0  0  0  0  1  0  0  0  0  0  0 -1  0  0  0
                  1  0  0  0  0  0  0  0  0  0  0  1  0 -1  0  0     
                  0  0  0  0  0  0 -1  0  0  0  0 -1  0  0  1  0
                  0  0  0  0  0  0  1  0  0  0  0  1  0  0 -1  0
                  0  0  0  0  0 -1 -1  0  0  0  0  0  0  0  0  1
                  0  0  0  0  0  1  1  0  0  0  0  0  0  0  0 -1                  
                  0  0  0  0  0  0 -1  1  0  0  0  0  0  0  0  0                 
                  0  0  0  0  0  0  0  1  0  0  0  1  0  0 -1  0                
                  0  0  0  0  0  1  0  1  0  0  0  0  0  0  0 -1
                  0  0  0  0  0  1  0  1  0  0  0  0  0  0  0 -1
                  0  0  0  0  0  0 -1  1  0  0  0  0  0  0  0  0
                  0  0  0  0  0  0 -1  1  0  0  0  0  0  0  0  0                  
                  0  0  0  0  0  1  0  1  0  0  0  0  0  0  0 -1
                  0  0  0  0  0  1  0  1  0  0  0  0  0  0  0 -1                  
                  0  0  0  0  0  0  0  1  0  0  0  1  0  0 -1  0
                  0  0  0  0  0  0  0  1  0  0  0  1  0  0 -1  0                  
                  0  0  0  0  0  0  1 -1  0  0  0  0  0  0  0  0
                  0  0  0  0  0  0  1 -1  0  0  0  0  0  0  0  0
                  0  0  0  0  0  0  1 -1  0  0  0  0  0  0  0  0                  
                  0  0  0  0  0  0  0 -1  0  1  0  0  0  0  0  0
                  0  0  0  0  0  0  0 -1  0  1  0  0  0  0  0  0
                  0  0  0  0  0  0  0 -1  0  1  0  0  0  0  0  0                 
                  0  0  0  0  0  0  0 -1  0  1  0  0  0  0  0  0 
                  0  0  0  0  0  0  0 -1  0  1  0  0  0  0  0  0   
                  0  0  0  0  0  0  0  1  0 -1  0  0  0  0  0  0
                  0  0  0  0  0  0  0  1  0 -1  0  0  0  0  0  0
                  0  0  0  0  0  0  0  1  0 -1  0  0  0  0  0  0                  
                  0  0  0  0  0  0 -1  0  1  0  0  0  0  0  0  0                
                  0  0  0  0  0  0  0  0  1  0  0  1  0  0 -1  0                
                  0  0  0  0  0  1  0  0  1  0  0  0  0  0  0 -1
                  0  0  0  0  0  1  0  0  1  0  0  0  0  0  0 -1                  
                  0  0  0  0  0  0 -1  0  1  0  0  0  0  0  0  0                
                  0  0  0  0  0  0 -1  0  1  0  0  0  0  0  0  0                  
                  0  0  0  0  0  1  0  0  1  0  0  0  0  0  0 -1 
                  0  0  0  0  0  1  0  0  1  0  0  0  0  0  0 -1                  
                  0  0  0  0  0  0  0  0  1  0  0  1  0  0 -1  0
                  0  0  0  0  0  0  0  0  1  0  0  1  0  0 -1  0                   
                  0  0  0  0  0  0 -1  0  1  0  0  0  0  0  0  0
                  0  0  0  0  0  0 -1  0  1  0  0  0  0  0  0  0                  
                  0  0  0  0  0  1  0  0  1  0  0  0  0  0  0 -1
                  0  0  0  0  0  1  0  0  1  0  0  0  0  0  0 -1                  
                  0  0  0  0  0  0  0  0  1  0  0  1  0  0 -1  0 
                  0  0  0  0  0  0  0  0  1  0  0  1  0  0 -1  0                  
                  0  0  0  0  0  0  1  0 -1  0  0  0  0  0  0  0
                  0  0  0  0  0  0  1  0 -1  0  0  0  0  0  0  0
                  0  0  0  0  0  0  1  0 -1  0  0  0  0  0  0  0                  
                  0  0  0  0  0  0  0  0 -1  1  0  0  0  0  0  0
                  0  0  0  0  0  0  0  0 -1  1  0  0  0  0  0  0  
                  0  0  0  0  0  0  0  0 -1  1  0  0  0  0  0  0 
                  0  0  0  0  0  0  0  0  1 -1  0  0  0  0  0  0
                  0  0  0  0  0  0  0  0  1 -1  0  0  0  0  0  0
                  0  0  0  0  0  0  0  0  1 -1  0  0  0  0  0  0                  
                  0  0  0  0  0  0 -1  0  0  0  1  0  0  0  0  0               
                  0  0  0  0  0  0  0  0  0  0  1  1  0  0 -1  0                
                  0  0  0  0  0  1  0  0  0  0  1  0  0  0  0 -1
                  0  0  0  0  0  0  0  0  0  0  1  1  0  0 -1  0
                  0  0  0  0  0  0 -1  0  0  0  1  0  0  0  0  0
                  0  0  0  0  0  0  0  0  0  0  1  1  0  0 -1  0
                  0  0  0  0  0  1  0  0  0  0  1  0  0  0  0 -1
                  0  0  0  0  0  0  1  0  0  0 -1  0  0  0  0  0
                  0  0  0  0  0  0  1  0  0  0 -1  0  0  0  0  0
                  0  0  0  0  0  0  1  0  0  0 -1  0  0  0  0  0
                  0  0  0  0  0  0  1  0  0  0 -1  0  0  0  0  0                 
                  0  0  0  0  0  0  1  0  0  0 -1  0  0  0  0  0  
                  0  0  0  0  0  0  1  0  0  0 -1  0  0  0  0  0 
                  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0
                  0  0  0  0  0  0  0  0  0  0  0 -1  0  0  0  0
                  0  0  0  0  0  0  1  0  0  0  0  1  0  0 -1  0
                  0  0  0  0  0  1  1  0  0  0  0  0  0  0  0 -1];   
    

%% Run simulation:Direct method
[t,x] = directMethod2(stoich_matrix, pfun, tinterval, x0, p);

%% Save data

Xfin = [x];

Tfin =[t];

save('Xfin')

save('Tfin')


%% Plot time course
%  

 A1 =movingmean(Xfin(:,5),10,1);   % use movingmean to visualize a smoother plot


 A2 =movingmean(Xfin(:,11),10,1);   % use movingmean to visualize a smoother plot


figure(1);
hold on;
plot(Tfin*p.kkma*Dt,A1,'b','LineWidth',1.6);
hold on;
plot(Tfin*p.kkma*Dt,A2,'r','LineWidth',1.6);
set(gca, 'FontName', 'Times New Roman')
grid on
grid minor
xlabel('time tau');
ylabel('n_{D^Ax},n_{D^Az}');


%% 
function a = propensity_functions(x, p);

% Return reaction propensities given current state x

D1a         = x(1);
D11         = x(2);
D21         = x(3);
D121        = x(4);
Da1         = x(5);
P1          = x(6);
D2b         = x(7);
D12         = x(8);
D22         = x(9);
D122        = x(10);
Da2         = x(11);
P2          = x(12);
Ca1         = x(13);
Cr1         = x(14);
Ca2         = x(15);
Cr2         = x(16);

p.kmprime21=(p.kkmprime*(D21))/p.V;
p.kmprime121=(p.kkmprime*(D121))/p.V;

p.km21=(p.kkm*(D21))/p.V;
p.km121=(p.kkm*(D121))/p.V;

p.kmbar11=(p.kkmbar*(D11))/p.V;
p.kmbar121=(p.kkmbar*(D121))/p.V;

p.kma1=(p.kkma*(Da1))/p.V;



p.ktprimeact1=(p.kktprime*Da1)/p.V;

p.keact1=(p.kkeact*Da1)/p.V;

p.keacta111=(p.kkeacta*(D11))/p.V;
p.keacta1121=(p.kkeacta*(D121))/p.V;

p.keacta221=(p.kkeacta*(D21))/p.V;
p.keacta2121=(p.kkeacta*(D121))/p.V;


p.kw101=p.kkw10;
p.kw11=p.kkw1;

p.kw201=p.kkw20;
p.kw21=p.kkw2;

p.kwa01=p.kkwa0;
p.kwa1=p.kkwa;
p.b1=(p.bbx)/p.V;








p.kmprime22=(p.kkmprime*(D22))/p.V;
p.kmprime122=(p.kkmprime*(D122))/p.V;

p.km22=(p.kkm*(D22))/p.V;
p.km122=(p.kkm*(D122))/p.V;

p.kmbar12=(p.kkmbar*(D12))/p.V;
p.kmbar122=(p.kkmbar*(D122))/p.V;

p.kma2=(p.kkma*(Da2))/p.V;



p.ktprimeact2=(p.kktprime*Da2)/p.V;

p.keact2=(p.kkeact*Da2)/p.V;

p.keacta112=(p.kkeacta*(D12))/p.V;
p.keacta1122=(p.kkeacta*(D122))/p.V;

p.keacta222=(p.kkeacta*(D22))/p.V;
p.keacta2122=(p.kkeacta*(D122))/p.V;



p.kw102=p.kkw10;
p.kw12=p.kkw1;

p.kw202=p.kkw20;
p.kw22=p.kkw2;

p.kwa02=p.kkwa0;
p.kwa2=p.kkwa;

p.b2=(p.bbz)/p.V;









a = [p.a*D1a*P1/p.V;
     p.d*Ca1;
     p.a*D1a*P2/p.V;
     p.d*Cr1;
     p.kw101*D1a;     
     p.kw101*Ca1;     
     p.kw101*Cr1;     
     p.kw11*Cr1;
     p.kmprime21*D1a;
     p.kmprime121*D1a;     
     p.kmprime21*Cr1;
     p.kmprime121*Cr1;     
     p.kmprime21*Ca1; 
     p.kmprime121*Ca1;      
     p.deltaprime*D11;
     p.ktprime*D11;
     p.ktprimeact1*D11;
     p.kw201*D11;
     p.km21*D11;
     p.km121*D11;     
     p.kmbar11*D11;
     p.kmbar121*D11;     
     p.delta*D121;
     p.ke*D121;
     p.keact1*D121;
     p.kw201*D1a;
     p.kw201*Ca1;
     p.kw201*Cr1;     
     p.kw21*Cr1;
     p.km21*D1a;
     p.km121*D1a;     
     p.km21*Cr1;
     p.km121*Cr1;     
     p.km21*Ca1;
     p.km121*Ca1;         
     p.kmbar11*D1a;
     p.kmbar121*D1a;     
     p.kmbar11*Cr1;
     p.kmbar121*Cr1;     
     p.kmbar11*Ca1; 
     p.kmbar121*Ca1;      
     p.delta*D21;
     p.ke*D21;
     p.keact1*D21;
     p.kw101*D21;
     p.kmprime21*D21;
     p.kmprime121*D21;     
     p.deltaprime*D121;
     p.ktprime*D121;
     p.ktprimeact1*D121;
     p.kwa01*D1a;
     p.kwa01*Ca1;
     p.kwa01*Cr1;     
     p.kwa1*Ca1;
     p.kma1*D1a;
     p.kma1*Ca1;
     p.kma1*Cr1;     
     p.delta*Da1;
     p.kea*Da1;
     p.keacta111*Da1;
     p.keacta1121*Da1;     
     p.keacta221*Da1;
     p.keacta2121*Da1;     
     p.b1*Da1;
     p.gg*P1; 
     p.delta*Ca1;
     p.delta*Cr1;       
     p.a*D2b*P2/p.V;
     p.d*Ca2;
     p.a*D2b*P1/p.V;
     p.d*Cr2;     
     p.kw102*D2b;
     p.kw102*Ca2;
     p.kw102*Cr2;     
     p.kw12*Cr2;
     p.kmprime22*D2b;
     p.kmprime122*D2b;     
     p.kmprime22*Cr2;
     p.kmprime122*Cr2;     
     p.kmprime22*Ca2;
     p.kmprime122*Ca2;     
     p.deltaprime*D12;
     p.ktprime*D12;
     p.ktprimeact2*D12;
     p.kw202*D12;
     p.km22*D12;
     p.km122*D12;     
     p.kmbar12*D12;
     p.kmbar122*D12;     
     p.delta*D122;
     p.ke*D122;
     p.keact2*D122;
     p.kw202*D2b;
     p.kw202*Ca2;
     p.kw202*Cr2;     
     p.kw22*Cr2;
     p.km22*D2b;
     p.km122*D2b;     
     p.km22*Cr2;
     p.km122*Cr2;     
     p.km22*Ca2; 
     p.km122*Ca2;      
     p.kmbar12*D2b;
     p.kmbar122*D2b;     
     p.kmbar12*Cr2;
     p.kmbar122*Cr2;     
     p.kmbar12*Ca2; 
     p.kmbar122*Ca2;      
     p.delta*D22;
     p.ke*D22;
     p.keact2*D22;
     p.kw102*D22;
     p.kmprime22*D22;
     p.kmprime122*D22;     
     p.deltaprime*D122;
     p.ktprime*D122;
     p.ktprimeact2*D122;
     p.kwa02*D2b;
     p.kwa02*Ca2;
     p.kwa02*Cr2;     
     p.kwa2*Ca2;
     p.kma2*D2b;     
     p.kma2*Ca2;     
     p.kma2*Cr2;     
     p.delta*Da2;
     p.kea*Da2;
     p.keacta112*Da2;
     p.keacta1122*Da2;     
     p.keacta222*Da2;
     p.keacta2122*Da2;     
     p.b2*Da2;
     p.gg*P2;
     p.delta*Ca2;
     p.delta*Cr2];
 
end

function [ t, x ] = directMethod2( stoich_matrix, pfun, tinterval, x0,...
                                  p)
    %% Initialization

max_out_length=1000000;
num_rxns = size(stoich_matrix, 1);
num_species = size(stoich_matrix, 2);
T = zeros(max_out_length, 1);
X = zeros(max_out_length, num_species);
T(1)     = tinterval(1);
X(1,:)   = x0;
rxn_count = 1;

%% MAIN LOOP

while T(rxn_count) < tinterval(2);
    
    % Calculate reaction propensities
    a = pfun(X(rxn_count,:), p);
    
    % Sample earliest time-to-fire (tau)
    a0 = sum(a);
    r = rand(1,1);
    
    % Sample identity of earliest reaction channel to fire (mu)
    j=1; s=a(1); r0=r*a0;
    while s < r0
      j = j + 1;
      s = s + a(j);
    end
    
    % Sample earliest time-to-fire (tau)
    
    s2= s -a(j);

    r2 = (r0 - s2)/a(j);
    
    tau = -log(r2)/a0; %(1/a0)*log(1/r2);
    

    % Update time and carry out reaction mu
    T(rxn_count+1)   = T(rxn_count)   + tau;
    X(rxn_count+1,:) = X(rxn_count,:) + stoich_matrix(j,:);    
    rxn_count = rxn_count + 1;
    
%     
%         
    display('-------------------------------------');
        disp(T(rxn_count));
    display('-------------------------------------');
%    
end  

% Return simulation time course
t = T(1:rxn_count);
x = X(1:rxn_count,:);
if t(end) > tinterval(2)
    t(end) = tinterval(2);
    x(end,:) = X(rxn_count-1,:);
end    

end
end