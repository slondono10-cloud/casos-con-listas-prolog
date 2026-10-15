grafo([
    arista(vancouver, edmonton, 16),
    arista(vancouver, calgary,  13),
    arista(calgary,   edmonton,  4),
    arista(edmonton,  saskatoon, 12),
    arista(saskatoon, winnipeg,  20),
    arista(calgary,   regina,    14),
    arista(regina,    winnipeg,   4),
    arista(regina,    saskatoon,  7),
    arista(saskatoon, calgary,    9)
]).


%Un nodo tiene aristas?
tiene_aristas(X) :-
    grafo(G),
    existe_arista(X, G).

existe_arista(X, [arista(X,_,_)|_]).                    %base
existe_arista(X, [_|Cola]) :- existe_arista(X, Cola).   %recursivo

%Camino de un X a un Z: devuelve la ruta (lista de nodos) y el costo
camino(X, Z, Ruta, Costo) :-
    grafo(G),
    ruta(X, Z, G, [X], Ruta, Costo).

%Paso base: una arista directa de un X a un Z
ruta(X, Z, G, Visitados, [X,Z], C) :-
    member(arista(X,Z,C), G),
    \+ member(Z, Visitados).

%Avanzar a un Y y seguir buscando hasta un Z (recursividad)
ruta(X, Z, G, Visitados, [X|Ruta], C) :-
    member(arista(X,Y,C1), G),
    \+ member(Y, Visitados),
    ruta(Y, Z, G, [Y|Visitados], Ruta, C2),
    C is C1 + C2.

%Costo de ir de un X a un Z
costo(X, Z, C) :-
    camino(X, Z, _, C).

%Se puede viajar de un X a un Z?
se_puede_viajar(X, Z) :-
    camino(X, Z, _, _).

%Costo de ir de un X a un Z pasando por un Y
costo_viaje(X, Y, Z, C) :-
    camino(X, Z, Ruta, C),
    member(Y, Ruta).
