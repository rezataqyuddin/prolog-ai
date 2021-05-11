% Name : Reza Taqyuddin
% NIM : 207056007
% Nama File : 207056001_Tugas01_01.pl
% Description : Rule and Fact from given Family Tree

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

% Define parental fact -> X is a parentof of Y = parentof
parentof('Nurul','Silvia').
parentof('Hasan','Silvia').

parentof('Nurul','Haris').
parentof('Hasan','Haris').
parentof('Nurul','Dinda').
parentof('Hasan','Dinda').


parentof('Mustafa','Nadira').
parentof('Silvia','Nadira').
parentof('Ayu','Davina').
parentof('Haris','Davina').
parentof('Dinda','Fatih').
parentof('Faldi','Fatih').

% Questions answer :
% Rule X is sibling of Y
is_sibling(X,Y) :- parentof(Z,X), parentof(Z,Y), X\=Y.

% Rule X is the grandchild of Y
is_grandchild(X,Y) :- parentof(Z, X), parentof(Y, Z).

% Rule X is the cousin of Y
is_cousin(X, Y) :- parentof(A, X), parentof(B, Y), is_sibling(A, B), X\=Y.

% Rule X is the uncle of Y
is_uncle(X, Y) :- parentof(X, Z), is_cousin(Z,Y), male(X).

% Rule x is the aunt of Y
is_aunt(X, Y) :- parentof(X, Z), is_cousin(Z,Y), female(X).

% Rule x is the husband of Y
is_husband(X,Y) :- parentof(X,Z), parentof(Y,Z), male(X), female(Y), X\=Y.

% Rule x is the wife of Y
is_wife(X,Y) :- parentof(X,Z), parentof(Y,Z), female(X), male(Y), X\=Y.