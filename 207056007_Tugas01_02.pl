% Name : Reza Taqyuddin
% NIM : 207056007
% Nama File : 207056001_Tugas01_02.pl
% Description : Rule and Fact from given Family Tree with user define operator

% Fact for Male
male('Hasan').
male('Mustafa').
male('Haris').
male('Faldi').

% Fact for female
female('Nurul').
female('Silvia').
female('Ayu').
female('Nadira').
female('Davina').
female('Fatih').

% Defining the Operator
:- op(500, xfx, 'parentof').
:- op(500, xfx, 'siblingof').
:- op(500, xfx, 'grandchildof').
:- op(500, xfx, 'cousinof').
:- op(500, xfx, 'auntof').
:- op(500, xfx, 'uncleof').
:- op(500, xfx, 'wifeof').
:- op(500, xfx, 'husbandof').


% Define parental fact using new operator
'Nurul' parentof 'Silvia'.
'Hasan' parentof 'Silvia'.
'Nurul' parentof 'Haris'.
'Hasan' parentof 'Haris'.
'Nurul' parentof 'Dinda'.
'Hasan' parentof 'Dinda'.


'Mustafa' parentof 'Nadira'.
'Silvia' parentof 'Nadira'.
'Ayu' parentof 'Davina'.
'Haris' parentof 'Davina'.
'Dinda' parentof 'Fatih'.
'Faldi' parentof 'Fatih'.

% Questions answer :
% Rule X is sibling of Y
X siblingof Y :- Z parentof X , Z parentof Y, X\==Y.

% Rule X is the grandchild of Y
X grandchildof Y :- Z parentof X, Y parentof Z.

% Rule X is the cousin of Y
X cousinof Y :- A parentof X, B parentof Y, A siblingof B, X\==Y.

% Rule X is the uncle of Y
X uncleof Y :- X parentof Z, Z cousinof Y, male(X).

% Rule x is the aunt of Y
X auntof Y :- X parentof Z, Z cousinof Y, female(X).

% Rule x is the husband of Y
X husbandof Y :- X parentof Z, Y parentof Z, male(X), female(Y), X\==Y.

% Rule x is the wife of Y
X wifeof Y :- X parentof Z, Y parentof Z, female(X), male(Y), X\==Y.