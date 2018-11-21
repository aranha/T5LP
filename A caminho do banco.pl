% 1. A pessoa de sobrenome Calado é recepcionista. Ela precisa de um minuto
% a mais para chegar ao trabalho que a pessoa na função de analista, que não é André.
% 
% 2. O gerente gasta mais tempo para chegar ao trabalho que Bianca e menos que a pessoa
% cujo sobrenome é Novaes.
%
% 3. Rute precisa de menos tempo que todos os outros. Seu sobrenome não é Wander.
% A pessoa cujo sobrenome é Wander trabalha como atendente de caixa de banco.
% 
% 4. A pessoa cujo sobrenome é Sapiro precisa de mais tempo para chegar ao trabalho
%  que pelo menos um outro funcionário.
%  
% 5. José precisa de menos tempo para chegar ao trabalho que Kátia, porém mais tempo 
% que André.
% 
% Variáveis
%  
% Nome: André[1], Bianca[2], José[5], Kátia[5], Rute[3]
% Sobrenome: Sapiro[4], Wander[3], Novaes[2], Calado[1], Hondura[X]
% Função: Gerente[2], Atendente de Caixa[3], Analista[1], Recepcionista[1], Segurança[X]
% Tempo: 23[X], 22[X], 28[X], 29[X], 17[X]
% 
:- use_rendering(table,
		 [header(w('Nome', 'Sobrenome', 'Funcao', 'Tempo'))]).
workers(Ws) :-
    length(Ws, 5),
    Ws = [w(_,_,_,23), w(_,_,_,22), w(_,_,_,28), w(_,_,_,29), w(_,_,_,17)],
	member(w(_,calado,recepcionista,T1), Ws),
    member(w(N1,_,analista,T2), Ws),
    T1 is T2+1,
    member(w(andre,_,_,_), Ws),
    member(w(bianca,_,_,_), Ws),
    member(w(katia,_,_,_), Ws),
    member(w(jose,_,_,_), Ws),
    member(w(rute,_,_,_), Ws),
    N1 \= andre,
    member(w(_,_,gerente,T3), Ws),
    member(w(bianca,_,_,T4), Ws),
    member(w(_,novaes,_,T5), Ws),
    T3 > T4,
    T3 < T5,
    member(w(rute,_,_,T6), Ws),
    T6 is 17,
    member(w(_,wander,_,_), Ws),
    member(w(_,calado,_,_), Ws),
    member(w(_,hondura,_,_), Ws),
    member(w(_,novaes,_,_), Ws),
    member(w(_,sapiro,_,_), Ws),
    member(w(rute,S1,_,_), Ws),
    S1 \= wander,
    member(w(_,wander,atendente,_), Ws),
    member(w(_,sapiro,_,T7), Ws),
    T7 > T6,
    member(w(jose,_,_,T8), Ws),
    member(w(katia,_,_,T9), Ws),
    member(w(andre,_,_,T10), Ws),
    T8 < T9,
    T8 > T10,
    member(w(_,_,seguranca,_), Ws).