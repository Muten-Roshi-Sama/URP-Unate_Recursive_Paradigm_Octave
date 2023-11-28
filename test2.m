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
