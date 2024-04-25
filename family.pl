%A typical family database.
male(joost).
male(sacha).
male(leon).
male(merlijn).
male(peter).

female(sofie).
female(sandrine).
female(fien).



parent(joost,sacha).
parent(joost,leon).

parent(sandrine,sacha).
parent(sandrine,leon).

parent(fien,sofie).
parent(fien,merlijn).

parent(peter,fien).
parent(peter,joost).




isChild(X):-parent(Y,X).

brother(X, Y):-male(X), dif(X,Y), parent(Z,X), parent(Z,Y).
sister(X, Y):-female(X), dif(X,Y), parent(Z,X), parent(Z,Y).

cousin(X, Y):-parent(A, Y), parent(B, X), ( sister(A, B) ; brother(A, B) ).



sibling(X, Y):-dif(X,Y), parent(Z,X), parent(Z,Y).

family(X, Y):-ancestor(X, Y) ; ancestor(Y,X) ;  sibling(X, Y); (ancestor(Z,X), ancestor(Z, Y)), dif(X,Y).

ancestor(Z, X):-parent(Z, X).
ancestor(Z, X):-parent(Z, A), ancestor(A, X).