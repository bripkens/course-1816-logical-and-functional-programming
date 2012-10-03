% Ein einzeiliger Kommentar
% christine, maria etc. werden als Atome oder auch Konstanten bezeichnet
female(christine).
female(maria).
female(monika).
female(angelika).
female(susanne).

/*
 * Mehrzeiliger Kommentar
 */
male(heinz).
male(fritz).
male(herbert).
male(hubert).
male(norbert).
male(andreas).

parents(christine, heinz, herbert).
parents(christine, heinz, angelika).
parents(maria, fritz, hubert).
parents(monika, herbert, susanne).
parents(monika, herbert, norbert).
parents(angelika, hubert, andreas).

% datum wird als Funktor bezeichnet
birthday(christine, datum(12, 7, 23)).

% Variablen fangen mit Großbuchstaben oder _ an.


% Praedikat member mit Stelligkeit 2
ue_member(E, [E|_]).
% Regeln: Regel wird so oft ausgefuehrt, bis das Praedikat true ergibt.
ue_member(E, [_|R]) :- member(E, R).

% Singleton variable warning: Jahr.
% Use _ instead as it means the same but is shorter.
holiday(datum(25, 12, Jahr)).

