canalOpen( saturday ).
canalOpen( monday ).
canalOpen( tuesday ).

raining(saturday).

melting( saturday ).
melting( sunday ).
melting( monday ).


winterlude(X) :- canalOpen(X), neg(raining(X), melting(X)).

neg(raining(X), melting(X)) :- (raining(X) ; melting(X)), !, fail.
neg(raining(X), melting(X)).
