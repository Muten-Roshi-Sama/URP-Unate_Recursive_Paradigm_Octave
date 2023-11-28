%LURP (Unate Recursive Paradigm) est une méthode d'analyse de fonction booléenne
%permettant par exemple, de vérifier une tautologie, de calculer le complément dune
%fonction ou encore de déterminer les impliquants premiers.
%Son principe est d'utiliser les cofacteurs pour décomposer la fonction et de profiter des
%caractéristiques des fonctions et variables monoformes pour l'analyse et la décomposi-
%tion de la fonction.

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

function retval = isTautology(Mat)

    % check if cube of "don' t care"
    if any(all(Mat == 3, 2))
      retval = 1; %'Tautology : Matrix has a dont care cube'

    % Check if not monoform => find at least one column with 1's and 2's
    %Not a tauto if (monoform) and (no don't care cube)
    elseif ~any(any(Mat==1) .* any(Mat==2)) % check if NOT binoform
      %We create 2 Indicator matrices for 1 and 2.
      % we reduce them to an indicator Vector
      %  we multiply those vector element by element
      %   any(if mult = 1, then there is a 1 and 2 in this column)
            retval= 0; %Not a Tautology : Matrix is Unate




    %---Check if deux cubes sont complémentaires
    #Mat1 = (Mat==1);        %indicator matrix for "1" (keep only 1's)
    #S = sum(Mat1');          %sum rows (first transpose Mat1, because default sums columns)
    #Mat1_Indicator = (S==1);                              %keep only lines with zeroes and a single 1 (keep only 1's of vector)
    #filter_single_ones = Mat1 .* (Mat1_Indicator)';        %keep only lines with zeroes and a single 1 (mult with transposed indicator)
    #single_ones_line_indicator = any(filter_single_ones);   %vector indicating which line has a singleton of "1"
    #single_twos_line_indicator = any( (Mat==2) .* (sum((Mat==2)')==1)'); %same as before but with "2" instead of "1".
                                                                           %(!! indicator for "2" is a matrix with 1's
                                                                            % representing the presence of 2's)
    #res = any(single_ones_line_indicator .* single_twos_line_indicator)
    %res = [0  0  1  0];
    elseif any( any((Mat==1).*(sum((Mat==1)')==1)') .* any((Mat==2).*(sum((Mat==2)')==1)') )
       %if there is a line with a singleton "1" and another line with a singleton "2" at the same index return 1
       retval = 1; %'Matrix has 2 complementary cubes'




    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else
      mostBinate = sum(Mat==3)==min(sum(Mat==3));
                    %A = (Mat==3); %indicator matrix for 3
                    %B = sum(Mat==3); %Sum the lines into a vector, shows how many "3" there are in each column.
                    %C = min(sum(Mat==3)); %takes the smallest number in the list (with the least amount of 3 => our most biform var).
                    %mostBinate = (B==C); %vector indicating with 1 the variable(s) with the least of 3's.

      mostBalanced = (abs(sum(Mat==1)-sum(Mat==2))+1);
                    %A = sum(Mat==1); % how many "1"'s there are in each column.
                    %B = sum(Mat==2);
                    %abs(A-B);
                    %mostBalanced =(abs(A-B) + 1); %create a vector with the number of apparition of the most represented var in each column.

      if any(any(Mat==1)&any(Mat==2))  % if there is at least 1 column with both "1" and "2".
          x = mostBinate .* mostBalanced;
      else  %  if there are no columns with 1's and 2's.
          x = mostBinate*1;
      endif

      x(x==0) = NaN; %replace zero's with Nan to get rid of the zero's and use min(x).
      [minVal, index] = min(x) %exctract the smallest number and its index in the list (~:discard).

      Cof1 = Mat;
          A = Cof1(:,index) %extract the mostBinate column.
          B = (A==1)
          C = find(B) %find the indexes of non-zero values.
          Cof1(C,:) = []  %extract the lines from those indexes.
          Cof1(:,index) = 3
      Cof2 = Mat;
          A = find(Cof2(:,index)==2)
          Cof2(A,:) = []
          Cof2(:,index) = 3  %remove the chosen mostBinate column.
      retval = isTautology(Cof1) & isTautology(Cof2)
    end
endfunction



%1. Don't care cube checkup
retval_dont_care = isTautology(F_dontCareCube);

%2. Unate checkup
%retval_Mono_0 = isTautology(Mono);
%retval_NOT_mono = isTautology(NOT_Mono);

%3. Complementary cubes
%retval_Compl_ = isTautology(Compl);
%retval_NOT_Compl = isTautology(NOT_Compl);


%retval_etape1KO = isTautology(etape1KO);
%retval_etape1OK = isTautology(etape1OK);

%retval_etape2KO = isTautology(etape2KO);  %NOT_Mono
%retval_etape2OK = isTautology(etape2OK);  %Mono

%retval_etape3KO = isTautology(etape3KO);
%retval_etape3OK = isTautology(etape3OK);

%retval_exo_sylla = isTautology(exo_sylla)
%retval_Etap41_3 = isTautology(Etap41_3)
%retval_Etap42_2 = isTautology(Etap42_2)


%
