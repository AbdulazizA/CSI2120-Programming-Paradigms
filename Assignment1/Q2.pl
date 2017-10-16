showAllRestSum(X,Y) :- between(X,Y,Z),
                        restSum(Z,S),
                        0 is mod(S,3),
                        write(Z),write(' rest '),writeln(S).

restSum(B,S) :- findall(S, restSumList(B,S), Ds),
                sumlist(Ds, S).

restSumList(B,S) :-   numGen(B,X),
                  findall(R, cubeLess(X,B,R), Rs),
                  sumlist(Rs, S).

numGen(L, X) :-
              Limit is floor(exp(log(L) / 3)),
              between(1, Limit, X).

cubeLess(X,B,R) :- 
                   X1 is X*X*X,
                   X1 =< B,
                   R is B-X1.  

smallerCube(X,B) :- numGen(B,X),                   
                    cubeLess(X,B,R),
                    write(X), write(' rest '), writeln(R).

          




