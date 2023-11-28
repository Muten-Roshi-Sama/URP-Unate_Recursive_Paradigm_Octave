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
Mono = etape2OK;

etape2KO = [3 3	3	2;
            2	1	1	2;
            3	2	3	3];
NOT_Mono = etape2KO;

%---------------3-------------------------
etape3KO = [2 2	3	1
            3	3	2	3
            2	1	1	2
            3	1	1	3];
NOT_Compl = etape3KO;
etape3OK = [2	2	3	1
            3	3	2	3
            2	1	1	2
            3	3	1	3];
Compl = etape3OK;

%------------------4------------------------
Etap41_3 = [2	2	1	1
            3	1	2	3
            2	1	1	2
            3	1	2	3];

Etap42_2 = [2	2	3	1
            3	3	2	3
            2	1	1	2
            3	1	3	3];

exo_sylla = [3 1 3
             3 3 1
             3 2 2];

%===========================================

%source('isTautology.m');

%1. Don't care cube checkup
retval_dont_care = isTautology(F_dontCareCube);  %=1
%retval_etape1KO = isTautology(etape1KO);    %=0
%retval_etape1OK = isTautology(etape1OK);    %=1

%2. Unate checkup
retval_Mono_0 = isTautology(Mono);         %=0
retval_NOT_mono = isTautology(NOT_Mono);   %NOT =0
%retval_etape2KO = isTautology(etape2KO);  %NOT_Mono
%retval_etape2OK = isTautology(etape2OK);  %Mono

%3. Complementary cubes
retval_Compl_ = isTautology(Compl);        %=0
retval_NOT_Compl = isTautology(NOT_Compl); %NOT =0
%retval_etape3KO = isTautology(etape3KO);
%retval_etape3OK = isTautology(etape3OK);

#4. Cofactors
retval_exo_sylla = isTautology(exo_sylla); %=1 (see example syllabus page.13
retval_Etap41_3 = isTautology(Etap41_3)
retval_Etap42_2 = isTautology(Etap42_2);


%
