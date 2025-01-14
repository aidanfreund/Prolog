%program 4 for 327
% Aidan Freund & Alex Uchtorff

%count_multiples/3 
%count_multiples(NumberList, Factor,Count)

count_multiples([], _, 0).
%if head is divisible by factor, move on and increment
count_multiples([Head|Tail], Factor, Count):-
    Head mod Factor =:= 0,
    count_multiples(Tail, Factor, Count2),
    Count is Count2+1.
%when head is not a multiple, move on
count_multiples([_|Tail], Factor, Count):-
    count_multiples(Tail, Factor, Count).


%count_multiples_tr/4 
%count_multiples_tr([Head|Tail], Factor, Count).
%count_multiples_tr_help(List, Factor, )

count_multiples_tr(List, Factor, FinalCount):-
    count_multiples_tr(List, Factor, 0, FinalCount).

count_multiples_tr([], _Factor, FinalCount, FinalCount).             %Base case
count_multiples_tr([Head|Tail], Factor, Count1, FinalCount):-    %Where head is factor
    (Head mod Factor) =:= 0,
    Count2 is 1 + Count1,
    count_multiples_tr(Tail, Factor, Count2, FinalCount).
count_multiples_tr([_|Tail], Factor, Count, FinalCount):-       %where head is not factor
    count_multiples_tr(Tail, Factor, Count, FinalCount).


%maxlist(List, Max) -- List will have at least one value in it. -- hint, you may need an additional predicate.

maxlist([Max], Max).
maxlist([Head|Tail], Max):-      
    maxlist(Tail, TailMax),
    TailMax < Head,
    Max is Head.
maxlist([Head|Tail], Max):-
    maxlist(Tail, TailMax),
    TailMax >= Head,
    Max is TailMax.


%ordered(List)

ordered([]).
ordered([_]).
ordered([Head,Tail]):-
    Head >=Tail.
ordered([Head1, Head2|Tail]):-
    Head1 >= Head2,
    ordered([Head2|Tail]).

%Broke
%subsetsum(List,Sum,Subset)
subsetsum([Sum], Sum, Sum).     %base case
subsetsum([Head, Tail], Sum, Subset):- 
    Sum =:= Head + Tail,
    Subset is [Head|Tail].
subsetsum([_Head1, Head2|Tail], Sum, Subset):-
    subsetsum([Head2|Tail],Sum, Subset2),
    %Sum =:= Head1+Head2,
    Subset is ([Sum|Subset2]).
%if head+tail > sum stop backtrack!.
subsetsum([_|Tail], Sum, Subset):-
    subsetsum(Tail, Sum, Subset).


%#############################################################
%Logic puzzle
%add predicates for the logic puzzle

% location(Locations),member(Loc1,Locations)   will force Loc1 to be one of the values from the list in the locations fact.
locations([alaska, canada, new_england, oregon, yellowstone]).
modes([backpacking, camping, cruise, pickup_camper, van]).

%force the answer to correct form of argument
answer_form([[aldrich, _, _], [harrison, _, _],[johnson, _, _],[jones, _, _],[wilson, _, _]]).

force_memberships([[_, A2, A3], [_, B2, B3], [_, C2, C3], [_, D2, D3], [_, E2, E3]]) :-
    locations(Locations),
    modes(Modes),
    member(A2, Locations),
    member(B2, Locations),
    member(C2, Locations),
    member(D2, Locations),
    member(E2, Locations),
    member(A3, Modes),
    member(B3, Modes),
    member(C3, Modes),
    member(D3, Modes),
    member(E3, Modes).

force_differences([[_, A2, A3], [_, B2, B3], [_, C2, C3], [_, D2, D3], [_, E2, E3]]) :-
    A2\=B2,
    A2\=C2,
    A2\=D2,
    A2\=E2,
    B2\=C2,
    B2\=D2,
    B2\=E2,
    C2\=D2,
    C2\=E2,
    D2\=E2,
    A3\=B3,
    A3\=C3,
    A3\=D3,
    A3\=E3,
    B3\=C3,
    B3\=D3,
    B3\=E3,
    C3\=D3,
    C3\=E3,
    D3\=E3.


%HINTS:  
% \= always fails if either argument is not yet bound to a value
% =:= requires that both sides be bound to values
% location(Locations),member(Loc1,Locations)   will force Loc1 to be one of the values from the list in the locations fact.


    % Clue 1
    % jones did not go to alaska, and did not use van or pickup_camper
    % also whoever went to yellowstone did not use van or pickup_camper
hint1(AnswerList):-
    locations(Locations),
    modes(Modes),
    member([_, yellowstone, Md], AnswerList),
    member(Md, Modes),
    Md\=van,
    Md\=pickup_camper,
    member([jones, Jones_Loc, Jones_Mode], AnswerList),
    member(Jones_Loc, Locations),
    member(Jones_Mode, Modes),
    Jones_Loc\=alaska,
    Jones_Mode\=van,
    Jones_Mode\=pickup_camper.


    % clue 2
    % van nor pickup camper visited alaska
hint2(AnswerList):-
    modes(Modes),
    member([_, alaska, Md], AnswerList),
    member(Md, Modes),
    Md\=van,
    Md\=pickup_camper.

    % clue 3.
    % aldrichs werent in oregon, and did not travel in a pickup_camper
hint3(AnswerList):-    
    locations(Locations),
    modes(Modes),
    member([aldrich, Loc, Md], AnswerList),
    member(Loc, Locations),
    member(Md, Modes),
    Loc\=oregon,
    Md\=pickup_camper.

    % clue 4
    % van did not go to new_england
hint4(AnswerList):-
    locations(Locations),
    member([_, Loc, van], AnswerList),
    member(Loc, Locations),
    Loc\=new_england.

    % clue 5
    % pickup_camper did not go to new_england
hint5(AnswerList):-
    locations(Locations),
    modes(Modes),
    member([_, new_england, Md], AnswerList),
    member(Md, Modes),
    Md\=pickup_camper,
    member([_, Loc, pickup_camper], AnswerList),
    member(Loc, Locations),
    Loc\=new_england.


    % clue 6
    % Johnsons did not go backpacking, did not use van or camper and did not go to alaska
hint6(AnswerList):-
    locations(Locations),
    modes(Modes),
    member([johnson, Loc, Md], AnswerList),
    member(Loc, Locations),
    member(Md, Modes),
    Md\=van,
    Md\=camper,
    Loc\=alaska.

    % clue 7
    % wilsons did not use van or pickup_camper
hint7(AnswerList):-
    modes(Modes),
    member([wilson, _, Md], AnswerList),
    member(Md, Modes),
    Md\=pickup_camper,
    Md\=van.

    % clue 8
    % neither oregon or yellowstone map with cruise
hint8(AnswerList):-
    locations(Locations),
 %   modes(Modes),
    member([_, Loc, cruise], AnswerList),
    member(Loc, Locations),
    Loc\=oregon,
    Loc\=yellowstone.
%    member([_, yellowstone, Md], AnswerList),
%    member([_, oregon, Md], AnswerList),
%    member(Md, Modes),
%    Md\=cruise.


    % clue 9
    % backpacking does not map with yellowstone
hint9(AnswerList):-
    locations(Locations),
  %  modes(Modes),
    member([_, Loc, backpacking], AnswerList),
    member(Loc, Locations),
    Loc\=yellowstone.
%    member([_, yellowstone, Md], AnswerList),
%    member(Md, Modes),
%    Md\=backpacking.



%solve_puzzle(AnswerList)
solve_puzzle(AnswerList) :-
    answer_form(AnswerList),
    hint1(AnswerList),
    hint2(AnswerList),
    hint3(AnswerList),
    hint4(AnswerList),
    hint5(AnswerList),
    hint6(AnswerList),
    hint7(AnswerList),
    hint8(AnswerList),
    hint9(AnswerList),
    force_memberships(AnswerList),
    force_differences(AnswerList).
    
    %add your code after the call to answer_form (and before the period)
