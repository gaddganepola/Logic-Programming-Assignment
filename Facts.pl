son_of(saman,ravi,manori).
son_of(kasun,ravi,manori).
son_of(amara,saman,amali).
son_of(sumith,kasun,sumana).
son_of(palitha,kasun,sumana).
son_of(sugath,shanaka,shalini).
son_of(jeewaka,shanaka,shalini).
son_of(prabath,lal,neela).
son_of(sahan,amara,nalini).
son_of(jeevan,kamal,ruwanili).
son_of(mahesh,sumith,geetha).
son_of(sajith,sumith,geetha).
son_of(gihan,palitha,champa).
son_of(panduka,nihal,chandani).
daughter_of(shalini,ravi,manori).
daughter_of(neela,saman,amali).
daughter_of(praba,amara,nalini).
daughter_of(ruwani,kasun,sumana).
daughter_of(chandani,shanaka,shalini).
daughter_of(dilani,nihal,chandani).
daughter_of(nilushi,jeewaka,priyani).

father_of(X,Y):-son_of(Y,X,_);daughter_of(Y,X,_).
mother_of(X,Y):-son_of(Y,_,X);daughter_of(Y,_,X).
parent_of(X,Y):-father_of(X,Y);mother_of(X,Y).
brother_of(X,Y):-son_of(X,Z,_),parent_of(Z,Y),different(X,Y).
different(X,Y):-X\=Y.
sister_of(X,Y):-daughter_of(X,Z,_),parent_of(Z,Y),different(X,Y).
grandparent_of(X,Y):-parent_of(X,Z),parent_of(Z,Y).
grandgrandfather_of(X,Y):-father_of(X,Z),grandparent_of(Z,Y).
husband_of(X,Y):- son_of(_,X,Y);daughter_of(_,X,Y).
married_to(X,Y):-son_of(A,X,Y);son_of(A,Y,X);daughter_of(A,X,Y);daughter_of(A,Y,X).
married1_to(X,Y):-parent_of(X,A),parent_of(Y,A),different(X,Y).
married2_to(X,Y):-husband_of(X,Y);husband_of(Y,X).
cousin_of(X,Y):-parent_of(A,X),parent_of(B,Y),(brother_of(A,B);sister_of(A,B)).
uncle_of(X,Y):-mother_of(A,Y),brother_of(X,A).
father_in_law(X,Y):-married_to(Y,A),father_of(X,A).
brother_in_law(X,Y):-married_to(Y,A),brother_of(X,A).
uncle1_of(X,Y):-parent_of(Z,Y),brother_of(X,Z).
son_in_law(X,Y):-married_to(X,A),(daughter_of(A,Y,_);daughter_of(A,_,Y)).



