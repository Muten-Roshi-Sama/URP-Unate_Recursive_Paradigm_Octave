%filename : main.m
%---------------------1------------------
F_dontCareCube = [3 3	3	3;
                  3	1	2	3;
                  2	1	1	2;
                  3	1	2	3];

etape1KO = [3	3	3	2
            2	1	1	2
            3	1	3	3];
etape1OK = [3	3	3	2
            2	1	1	2
            3	3	3	3];

%-------------------2----------------
etape2OK = [3 3	3	2;
            2	1	1	2;
            3 1	3	3];

etape2KO = [3 3	3	2;
            2	1	1	2;
            3	2	3	3];

%---------------3-------------------------
etape3KO = [2 2	3	1;
            3	3	2	3;
            2	1	1	2;
            3	1	1	3];
etape3OK = [2	2	3	1;
            3	3	2	3;
            2	1	1	2;
            3	3	1	3];

A = [1 2 3 2;
     2 1 3 2;
     1 2 3 3;
     1 2 3 1];



%------------------4------------------------
Etap41_3 = [2	2	1	1
            3	1	2	3
            2	1	1	2
            3	1	2	3];

Etap42_2 = [2	2	3	1
            3	3	2	3
            2	1	1	2
            3	1	3	3];

exo_sylla = [1 1 3
             1 3 1
             1 2 2
             2 3 3];


%----------5-------------------------------
Etap5 = [ 1	3	1	1	2	2
          1	1	2	3	2	2
          1	1	2	1	1	1
          2	3	1	1	3	3
          3	3	3	2	2	1
          2	2	1	1	1	2
          3	1	3	2	2	3
          2	3	1	3	1	2
          2	2	2	3	3	3
          2	1	1	2	3	3
          3	1	3	3	1	3
          2	2	2	2	1	1
          2	3	2	2	2	1
          2	2	2	1	1	1];

etape5_est_une_tauto = [
1	3	3	3	2	2
1	1	2	3	2	2
1	1	2	1	3	1
2	3	1	1	3	3
3	3	3	2	2	1
3	2	1	1	1	3
3	3	3	2	2	3
3	3	1	3	1	2
2	3	2	3	3	3
2	1	1	2	3	3
3	1	3	3	3	3
2	2	2	2	1	3
3	3	2	3	2	3
3	2	3	3	1	3
3	3	3	1	1	3
2	3	2	3	3	1
3	1	3	3	2	1
1	2	3	3	3	3
];

etape5_PAS_une_tauto = [
1	3	1	1	2	2
1	1	2	3	2	2
1	1	2	1	1	1
2	3	1	1	3	3
3	3	3	2	2	1
2	2	1	1	1	2
3	1	3	2	2	3
2	3	1	3	1	2
2	2	2	3	3	3
2	1	1	2	3	3
3	1	3	3	1	3
2	2	2	2	1	1
2	3	2	2	2	1
2	2	2	1	1	1
];

%===========================================
%source('IsTautology.m');

tic;


%1. Don't care cube checkup
    %retval_etape1KO = IsTautology(etape1KO)       %=0     0.001
    %retval_etape1OK = IsTautology(etape1OK)        %=1    0.001
    %retval_dont_care = IsTautology(F_dontCareCube)  %=1   0.001


%2. Unate checkup
    %retval_etape2KO = IsTautology(etape2KO)  %=0  NOT_Mono    0.002
    %retval_etape2OK = IsTautology(etape2OK)    %retval = 0    0.001


%3. Complementary cubes
    %retval_etape3KO = IsTautology(etape3KO)  %=0   0.003
    retval_etape3OK = IsTautology(etape3OK) %=1    0.001

    %retval_etape3A = IsTautology(A)   % error: max_recursion_depth exceeded

#4. Cofactors
    %retval_Etap41_3 = IsTautology(Etap41_3)  %index=3 (first).      0.005
    %retval_Etap42_2 = IsTautology(Etap42_2)    %index = 2 (first).  0.003

    %retval_exo_sylla = IsTautology(exo_sylla) %index=1 (see example syllabus page.13    0.04

%5. Recusivity
    retval_etape5_est_une_tauto = IsTautology(etape5_est_une_tauto)  %=1   0.006
    %retval_etape5_PAS_une_tauto = IsTautology(etape5_PAS_une_tauto)   %=0   0.01


toc;






