% A = [4, 5];
% B = [4, 5, 6];
%
% diff_A = diff(A, 1);
% diff_B = diff(B, 1);
%
% disp(diff_A)
% disp(diff_B)
%
%
% C = [4 5];
% disp(diff(C,1)) %Outputs 5-4 = 1
%
% D = [4 5 6];
% disp(diff(D,1)); %[5-4, 6-5] = [1 1]
%
%Mat(1,:);  %Line
%Mat(:,1); %column
%---1---------------------------------------------
F_dontCareCube = [  3	3	3	3;3	1	2	3;
                    2	1	1	2;3	1	2	3];
Mat = F_dontCareCube;
A = Mat == 3;
B = all(Mat == 3, 2);
C = any(all(Mat == 3, 2));

%---2--------------------------------------------------
NOT_Mono = [3 3	3	2;
            2	1	1	2;
            3	2	3	3];
Mono = [3	3	3	2;
        2	1	1	2;
        3 1	3	3];
Mat = Mono

A = (Mat==1);
B = (Mat==2);
C = any(Mat==1);
D = any(Mat==2);
E = (any(Mat==1) .* any(Mat==2));
F = any(any(Mat==1) .* any(Mat==2));
IsMono = ~F


%-----3-------------------------------------------------
KO = [2 2	3	1
      3	3	2	3
      2	1	1	2
      3	1	1	3];

OK = [2	2	3	1
      3	3	2	3
      2	1	1	2
      3	3	1	3];

PK = [3	2	3	3
      2	3	3	3
      3	1	3	3
      1	3	3	3];

Mat = OK;
% Check if row is univariable
%  Check if two rows are complementary

 %How is it possible for this to work before declaration ???
OK1 = (OK==1); %not needed OKn filters for the value n
S = sum(OK1');   %sum rows
OK1_Indicator = S==1;
sgl_1_filter = OK1 .* OK1_Indicator';
sgl_2_filter = (OK==2) .* (sum((OK==2)')==1)';
A = any(sgl_1_filter) .* any(sgl_2_filter);
any(A);

Mat = OK;

%---Check if deux cubes sont complémentaires
    Mat1 = (Mat==1) ;       %indicator matrix for "1" (keep only 1's)
    S = sum(Mat1')  ;        %sum ROWS (first transpose Mat1, because default sums columns)
    Mat1_Indicator = (S==1);                              %keep only lines with zeroes and a single 1 (keep only 1's of vector)
    filter_single_ones = Mat1 .* (Mat1_Indicator)';        %keep only lines with zeroes and a single 1 (mult with transposed indicator)
    single_ones_line_indicator = any(filter_single_ones);   %vector indicating which line has a singleton of "1"
    single_twos_line_indicator = any( (Mat==2) .* (sum((Mat==2)')==1)'); %same as before but with "2" instead of "1".
                                                                           %(!! indicator for "2" is a matrix with 1's
                                                                            % representing the presence of 2's)
    res = any(single_ones_line_indicator .* single_twos_line_indicator);




%-------------------4---------------------------------------
%Calculer les cofacteurs
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


 % si dans la liste de cube, j'ai deux cubes d'une seule variable
  %  compléments l'un de l'autre, alors ma fonction est une tautologie.

%Choisir la variable la + biforme et balancée

%else
Mat = exo_sylla

mostBinate = sum(Mat==3)==min(sum(Mat==3))
              %A = (Mat==3); %indicator matrix for 3
              %B = sum(Mat==3); %Sum the lines into a vector, shows how many "3" there are in each column.
              %C = min(sum(Mat==3)); %takes the smallest number in the list (with the least amount of 3 => our most biform var).
              %mostBinate = (B==C); %vector indicating with 1 the variable(s) with the least of 3's.

mostBalanced = (abs(sum(Mat==1)-sum(Mat==2))+1)
              %A = sum(Mat==1); % how many "1"'s there are in each column.
              %B = sum(Mat==2);
              %abs(A-B);
              %mostBalanced =(abs(A-B) + 1); %create a vector with the number of apparition of the most represented var in each column.

if any(any(Mat==1)&any(Mat==2))  % if there is at least 1 column with both "1" and "2".
    x = mostBinate .* mostBalanced

else  %  if there are no columns with 1's and 2's.
    x = mostBinate*1
endif


x(x==0) = NaN; %replace zero's with Nan to get rid of the zero's and use min(x).
[minVal, index] = min(x) %exctract the smallest number and its index in the list (~:discard).

N = Mat;
    A = N(:,index) %extract the mostBinate column.
    B = (A==1)
    C = find(B) %find the indexes of non-zero values.
    N(C,:) = []  %extract the lines from those indexes.
    N(:,index) = 3
P = Mat;
    A = find(N(:,index)==2)
    P(A,:) = []
    P(:,index) = 3  %remove the chosen mostBinate column.













%-------------------5---------------------------------------------
etap5 = [ 1 3	1	1	2	2
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






