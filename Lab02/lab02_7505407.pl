aseries(1,3).
aseries(N,Y) :- N > 1,
                0 is mod(N,2),
                NN is N -1,
                aseries(NN, Y1),
                Y is 5*Y1. 
aseries(N,Y) :- N > 1,
                1 is mod(N,2),
                NN is N -1,
                aseries(NN, Y1),
                Y is -5*Y1. 