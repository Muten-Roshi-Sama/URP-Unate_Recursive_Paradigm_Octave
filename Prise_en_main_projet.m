%cr�er une matrice

A = [ 1 2 3; 3 3 2; 2 1 3] ;

%utiliser les tests

B = A==3;
B = A>2;

%modifier un �l�ment de la matrice

B(2,3)=1;

%utiliser les conditions

C = all(B);
C = all(B,2);
D = any(C);

%r�aliser des op�rations

E = sum(A);

%rechercher un �l�ment

F = find(A==3);
G = [4 6 7];
H = find(G==max(G));

%ajouter un retirer un �lement d'une matrice

I = [];
J = [1 2 3];
K = [I;J];

%tester si une ligne est pr�sente dans une matrice

L = A == J;
M = all(L,2);

