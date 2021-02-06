man(james).
man(arthur).
man(harry).
man(ron).
man(fred).
man(george).
man(persy).
man(charlie).
man(bill).
man(albus).
man(hugo).
man(fred2).
man(louis).
man(james2).

woman(lily).
woman(molly).
woman(ginny).
woman(hermione).
woman(angelina).
woman(audrey).
woman(fleur).
woman(lily2).
woman(rose).
woman(roxanne).
woman(molly2).
woman(lucy).
woman(dominique).
woman(victoire).

parent(james,harry).
parent(lily,harry).

parent(arthur,ginny).
parent(arthur,ron).
parent(arthur,fred).
parent(arthur,george).
parent(arthur,percy).
parent(arthur,charlie).
parent(arthur,bill).

parent(molly,ginny).
parent(molly,ron).
parent(molly,fred).
parent(molly,george).
parent(molly,percy).
parent(molly,charlie).
parent(molly,bill).

parent(harry,albus).
parent(harry,james2).
parent(harry,lily2).

parent(ginny,albus).
parent(ginny,james2).
parent(ginny,lily2).

parent(ron,rose).
parent(ron,hugo).

parent(hermione,rose).
parent(hermione,hugo).

parent(george,fred2).
parent(george,roxanne).

parent(angelina,fred2).
parent(angelina,roxanne).

parent(percy,molly2).
parent(percy,lucy).

parent(audrey,molly2).
parent(audrey,lucy).

parent(bill,dominique).
parent(bill,victoire).
parent(bill,louis).

parent(fleur,dominique).
parent(fleur,victoire).
parent(fleur,louis).

men():-man(X),write(X),nl,fail.
women():-woman(X),write(X),nl,fail.
children(X):-parent(X,Y),write(Y),nl,fail.

mother(X,Y):-parent(X,Y),woman(X).
mother(X):-mother(Y,X),write(Y).

daughter(X,Y):-parent(Y,X),woman(X).
daughter(X):-daughter(Y,X),write(Y),nl,fail.

brother(X,Y):-mother(Z,X),mother(Z,Y),man(X),X\=Y.
brothers(X):-brother(Y,X),write(Y),nl,fail.

husband(X,Y):-parent(X,Z),parent(Y,Z),man(X),woman(Y).
husband(X):-husband(Y,X),write(Y).
