tent('Dreamer',2,4.5,199).
tent('Hermite',1,2,159).
tent('Family',5,5,349).
tent('Expedition',8,8.5,699).

sbag('Mountain',-15,mummy,1.5,350).
sbag('Cabin',5,double-bag,5,250).
sbag('Square',-3,rectangular,2.5,150).

spad('Rock',2,0.2,100).
spad('Pfft',3,0.8,10).
spad('Heaven',10,0.4,80).
spad('Moon',5,0.4,50).

backpack('Trapper',20,250).
backpack('Prospector',25,220).
backpack('Air',10,150).
backpack('Comfort',15,200).


paul(W,X,Y,Z,P):- tent(W,_,_,WP),
                  sbag(X,X1,_,_,XP), X1 =< 0, 
                  spad(Y,Y1,_,YP), Y1 >= 5,
                  backpack(Z,_,ZP),
                  P is WP+XP+YP+ZP.


tripFor4(X,mary(MB,MP),sean(SB,SP), paula(PTB,PP),thomas(PTB,TP), tents( T1, T2), backpacks(B1,B2)) :- 

mary(MB,MP), sean(SB,SP), paula(PTB,PP),thomas(PTB,TP), tents( T1, T2), backpacks(B1,B2),
MB \= PTB, SB \= PTB, sbag(MB,_, _, MBW,_), spad(MP,_,MPW,_), sbag(SB,_,_,SBW,_), spad(SP,_,SPW,_),
sbag(PTB, _,double-bag,PTBW,_),spad(PP,_,PPW,_),spad(TP,_,TPW,_),tent(T1,_,T1W,_),tent(T2,_,T2W,_),
backpack(B1, B1W, _), backpack(B2, B2W, _),
TW is (X*4) +  MBW + MPW + SBW + SPW + PTBW + PPW + TPW + T1W + T2W,
BPW is B1W+B2W,
BPW >= TW.                           

mary(MB,MP) :- sbag(MB,_, _, _,_),
               spad(MP,_,_,_).
sean(SB,SP) :- sbag(SB,_,_,_,_),
               spad(SP,_,_,_).
paula(PTB,PP) :- sbag(PTB, _,double-bag,_,_),
               spad(PP,_,_,_).
thomas(PTB,TP) :- sbag(PTB,_,double-bag,_,_),
               spad(TP,_,_,_).
tents(T1,T2) :- tent(T1,T1S,_,_),
                tent(T2,T2S,_,_),
                T1S + T2S >= 4.
backpacks(B1,B2):- backpack(B1, _, _),
                   backpack(B2,_,_),
                   B1 \= B2. 

comfort(5,guide(GB,GP),backpack(GBP),N) :- guide(GB,GP),gbackpack(GBP),
                                           sbag(GB,_,_,GBW,_), spad(GP,_,GPW,_),backpack(GBP,W,_),
                                           N1 is (0.4 * N) + 5 + GBW + GPW,                                        
                                           W >= N1.
guide(GB,GP) :- sbag(GB,_,_,_,_),
                spad(GP,_,_,_).
gbackpack(GBP) :- backpack(GBP,_,_).


basicFor2('Dreamer','Cabin','Pfft','Pfft','Trapper',600).
extra('Hermite','Mountain','Rock','Air',650).


equipment2(X,jill(JB,JP),kyle(KB,KP),tent(dreamer), backpack(BP),Y) :-

( basicFor2(A,B,C,D,E,F), tent('Dreamer',_,TW2,_), sbag(B,_,_,BW2,_), spad(C,_,CW2,_), spad(D,_,CW3,_), backpack(E,EW2,_),
  TWW is (X*2) + TW2 + BW2 + CW2 + CW3,
  F =< Y,
  TWW =< EW2 ) ;

( extra(A,B,C,D,E), A=='Dreamer', tent('Dreamer',_,TW2,_) , sbag(B,_,_,BW2,_), spad(C,_,CW2,_), backpack(D,DW2,_),
  TWW is (X*2) + TW2 + BW2 + CW2,
  E =<Y,
  TWW =<DW2 ) ;

backpack(BP,BPW,BPP), tent('Dreamer',_,TW,TP), sbag(JB,_,_,JBW,JBP), sbag(KB,_,_,KBW,KBP), spad(JP,_,JPW,JPP), spad(KP,_,KPW,KPP),

TWW is (X*2) + TW + JBW + KBW + JPW + KPW,
TWW =< BPW,
TP2 is BPP+TP+JBP+KBP+JPP+KPP,
TP2 =< Y.





   