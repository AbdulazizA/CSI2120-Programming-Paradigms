name(jules).
name(gilles).
name(jean).
name(joe).
name(ghislain).
occ(mason).
occ(plasterer).
occ(carpenter).
occ(tinsmith).
occ(roofer).

constraintRoofer(player(N,O,S)) :- 
                                   70 is S,
                                   N \= ghislain.
constraintMason(player(N,O,S)) :- 
                                  70 is S,
                                  N \= gilles.
constraintTinsmith(player(N,O,S)) :- player(joe, O1, S1),
                                     O1 \= tinsmith,
                                     S+4 is S1.
constraintCarpenter(player(N,O,S)) :- player(jules, O1, S1),
                                     O1 \= carpenter,
                                     S+8 is S1.
constraintWin(player(N,O,S)) :- 
                                player(joe, _, S2),
                                S is S2+4,
                                O == tinsmith,
                                N \= jules.

score(S) :-  between(64,84,S), 0 is mod(S,2).

player(N,O,S) :- name(N), occ(O), score(S),
                     constraintWin(player(N,O,S)) ; constraintCarpenter(player(N,O,S));
                    constraintTinsmith(player(N,O,S)) ; constraintCarpenter(player(N,O,S)) ;
                    constraintRoofer(player(N,O,S)).   


scores(player(jules,M1,P1), player(jean,M2,P2),
player(gilles,M3,P3), player(joe,M4,P4), player(ghislain,M5,P5)) :-

score(P1), score(P2), score(P3), score(P4), score(P5),
occ(M1), occ(M2), occ(M3), occ(M4), occ(M5),
M1 \= M2, M1 \= M3, M1 \= M4, M1 \= M5, M2 \= M3, M2 \= M4, M2 \= M5,
M3 \= M4, M3 \= M5, M4 \= M5, 
player(jules,M1,P1), player(jean,M2,P2), player(gilles,M3,P3),
player(joe,M4,P4), player(ghislain,M5,P5).