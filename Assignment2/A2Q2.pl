treeA(X):-X = t(73, t(31, t(5,nil,nil), nil), t(101, t(83, nil,
t(97,nil,nil)), t(2016,nil,nil))).

lca(K1,K2,X):- findKey(K1,X,P),findKey(K2,X,R),compareList1(P,R,W),printTree(W,X).

findKey(K,t(K,_,_),[]).
findKey(K,t(Root,Left,_),[Root|T]):- findKey(K,Left,T).
findKey(K,t(Root,_,Right),[Root|T]):- findKey(K,Right,T).

compareList1([H1],[H2],W):- W is H1.
compareList1([H1|[HT1]],[H2|[HT2|T2]],W):- HT1 =:= HT2,W is HT1.
compareList1([H1|[HT1|T1]],[H2|[HT2]],W):- W is HT1.
compareList1([H1|[HT1]],[H2|[HT2]],W):- W is HT1.
compareList1([H1|[HT1|T1]],[H2|[HT2|T2]],W):- H1=:=H2,HT1=:=HT2, compareList1(T1,T2,W).


printTree(X,t(X,R,_)):- write('t('),write(X),write(','), write(R).
printTree(X,t(Root,Left,_)):- printTree(X,Left).
printTree(X,t(Root,_,Right)):- printTree(X,Right).