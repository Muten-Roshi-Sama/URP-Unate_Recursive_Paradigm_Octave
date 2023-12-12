%filename : IsTautology.m
%LURP (Unate Recursive Paradigm) est une méthode d'analyse de fonction booléenne
%permettant par exemple, de vérifier une tautologie, de calculer le complément dune
%fonction ou encore de déterminer les impliquants premiers.
%Son principe est d'utiliser les cofacteurs pour décomposer la fonction et de profiter des
%caractéristiques des fonctions et variables monoformes pour l'analyse et la décomposi-
%tion de la fonction.



function retval = IsTautology(Mat)

%3. ---Check if deux cubes sont complémentaires
    Mat3 = (Mat == 3);  % Create a logical matrix indicating lines with len-1 "3"s
    S = sum(Mat3, 2);    % Sum along each row
    complRows = find(S == size(Mat, 2) - 1); % Find the lines with len-1 "3"s
    complMat = Mat(complRows, :);             % Keep only the lines indicated by in the Mat matrix

    contains1 = any(complMat == 1);         % Check if any row has value 1
    contains2 = any(complMat == 2);          % Check if any row has value 2
    res_compl = any(contains1 .* contains2)  % Check if there is any row that contains both 1 and 2
    %-----------------------------------------------------------------------------------------------


% 1. ---Check if deux cubes sont complémentaires
    if any(all(Mat == 3, 2))
      disp("---cube don't care")
      retval = 1; %'Tautology : Matrix has a dont care cube'




% 2. ----check if NOT biform = Check if monoform => not(find at least one column with 1's and 2's)
    %Not a tauto if (monoform) and (no don't care cube)
    elseif ~any(any(Mat==1) .* any(Mat==2))
      %We create 2 Indicator matrices for 1 and 2.
      % we reduce them to an indicator Vector
      %  we multiply those vector element by element
      %   if any product is 1, then there is a 1 and 2 in this column
            disp("---isMonoform.")
            retval= 0; %Not a Tautology : Matrix is Unate


% 3. -----------
    elseif res_compl
       %if there is a line with a singleton "1" and another line with a singleton "2" at the same index return 1
       disp('---compl')
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

      x(x==0) = NaN; %replace zero's with Nan to get rid of the zero's and be able to use min(x).
      [minVal, index] = min(x) %exctract the smallest number and its index in the list (~:discard).
      Chosen_cof_var_index = index
      Cof1 = Mat;
          A = Cof1(:,index); %extract the mostBinate column.
          B = (A==1);
          C = find(B); %find the indexes of non-zero values.
          Cof1(C,:) = [];  %extract the lines from those indexes.
          Cof1(:,index) = 3;
      Cof2 = Mat;
          A = find(Cof2(:,index)==2);
          Cof2(A,:) = [];
          Cof2(:,index) = 3;  %remove the chosen mostBinate column.
          IsTautCof1 = IsTautology(Cof1)
          IsTautCof2 = IsTautology(Cof2)
      retval = IsTautCof1 & IsTautCof2;

    end
endfunction

