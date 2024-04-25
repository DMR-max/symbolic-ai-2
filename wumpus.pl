:-retractall(robot(_)).
:-dynamic robot/1.

%The location of robot and goal
robot(1).
goal(5).

%The links as predicates
link(1,2).
link(2,3).
link(3,4).
link(3,6).
link(6,5).
link(6,7).

%The link of question 18
%link(3,1).

adjacent(L):- robot(A), link(A,L).
move(L):- adjacent(L), retract(robot(_)), assertz(robot(L)).

%Old suggest of question 13
%suggest(L):- goal(L), adjacent(L). 

path:-robot(X), goal(Y), hulp(X,Y).

hulp(X,Y):-link(X,Y).
hulp(X,Y):-
    link(X,A),
    hulp(A,Y).

append([],X,X).
append([X | Y], Z, [X | W]):- append(Y, Z, W). 

path(P):-robot(X), goal(Y), link(X, A), hulp(A,Y,P).

hulp(X,X,[X]):-!.
hulp(X,Y,[X|List]):-
    link(X,A),
    hulp(A,Y,List).

suggest(L):-robot(X), goal(Y), link(X, A), hulp(A,Y,[L|P]).

