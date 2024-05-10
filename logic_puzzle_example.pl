%program 4 for 327
% add your name here
first_names([george, harry, jeff, lester, martin]).
models([hydra, kratos, nike, pegasus, sibyl]).
years([1947, 1949, 1951, 1953, 1955]).

%force the answer into the correct order and number of arguments and such -- feel free to add to this in appropriate ways
answer_form([[anderson, _, _, _], [brooks, _, _, _], [corwin, _, _, _], [dent, _, _, _], [easton, _, _, _]]).

force_memberships([[_, A2, A3, A4], [_, B2, B3, B4], [_, C2, C3, C4], [_, D2, D3, D4], [_, E2, E3, E4]]) :-
    first_names(FirstNames),
    models(Models),
    years(Years),
    member(A2, FirstNames),
    member(B2, FirstNames),
    member(C2, FirstNames),
    member(D2, FirstNames),
    member(E2, FirstNames),
    member(A3, Models),
    member(B3, Models),
    member(C3, Models),
    member(D3, Models),
    member(E3, Models),
    member(A4, Years),
    member(B4, Years),
    member(C4, Years),
    member(D4, Years),
    member(E4, Years).

force_differences([[_, A2, A3, A4], [_, B2, B3, B4], [_, C2, C3, C4], [_, D2, D3, D4], [_, E2, E3, E4]]) :-
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
    D3\=E3,
    A4\=B4,
    A4\=C4,
    A4\=D4,
    A4\=E4,
    B4\=C4,
    B4\=D4,
    B4\=E4,
    C4\=D4,
    C4\=E4,
    D4\=E4.


hint1(AnswerList) :-
    years(Years),
    first_names(FirstNames),
    member([GeorgeLName, george, _, GeorgeYear], AnswerList),
    member(GeorgeYear, Years),
    GeorgeYear<1952,
    member([brooks, BrooksFName, _, BrooksYear], AnswerList),
    member(BrooksYear, Years),
    BrooksYear<1952,
    member([JeffLName, jeff, _, JeffYear], AnswerList),
    member(JeffYear, Years),
    JeffYear<1952,
    brooks\=GeorgeLName,
    member(BrooksFName, FirstNames),
    george\=BrooksFName,
    jeff\=BrooksFName,
    brooks\=JeffLName.

hint2(AnswerList) :-
    years(Years),  
    first_names(FirstNames),
    models(Models),
    member([_, NikeFName, nike, NikeYear], AnswerList),
    member([_, martin, MartinModel, MartinYear], AnswerList),
    member(NikeYear, Years),
    member(MartinYear, Years),
    NikeYear<MartinYear,
    member(MartinModel, Models),
    MartinModel\=nike,
    member(NikeFName, FirstNames),
    NikeFName\=martin.

hint3(AnswerList) :-
    years(Years),
    models(Models),
    member([corwin, _, CorwinModel, CorwinYear], AnswerList),
    member([KratosLName, _, kratos, KratosYear], AnswerList),
    member(CorwinYear, Years),
    member(KratosYear, Years),
    CorwinYear<KratosYear,
    corwin\=KratosLName,
    member(CorwinModel, Models),
    kratos\=CorwinModel.

hint4(AnswerList) :-
    years(Years),
    first_names(FirstNames),
    models(Models),
    member([_, harry, HarryModel, HarryYear], AnswerList),
    member([_, PegasusFName, pegasus, PegasusYear], AnswerList),
    member(HarryYear, Years),
    member(PegasusYear, Years),
    HarryYear+2=:=PegasusYear,
    member(HarryModel, Models),
    HarryModel\=pegasus,
    member(PegasusFName, FirstNames),
    harry\=PegasusFName.

hint5(AnswerList) :-
    years(Years),
    models(Models),
    member([anderson, _, AndersonModel, AndersonYear], AnswerList),
    member([SibylLName, _, sibyl, SibylYear], AnswerList),
    member([dent, _, DentModel, DentYear], AnswerList),
    member(AndersonYear, Years),
    member(SibylYear, Years),
    member(DentYear, Years),
    AndersonYear<SibylYear,
    AndersonYear<DentYear,
    member(AndersonModel, Models),
    AndersonModel\=sibyl,
    member(DentModel, Models),
    DentModel\=sibyl,
    AndersonModel\=DentModel,
    SibylLName\=anderson,
    SibylLName\=dent.

hint6(AnswerList) :-
    years(Years),
    first_names(FirstNames),
    models(Models),
    member([_, KratosFName, kratos, KratosYear], AnswerList),
    member([_, george, GeorgeModel, GeorgeYear], AnswerList),
    member([_, NikeFName, nike, NikeYear], AnswerList),
    member(KratosYear, Years),
    member(GeorgeYear, Years),
    KratosYear+2=:=GeorgeYear,
    KratosYear+4=:=NikeYear,
    member(KratosFName, FirstNames),
    KratosFName\=george,
    member(NikeFName, FirstNames),
    NikeFName\=george,
    KratosFName\=NikeFName,
    member(GeorgeModel, Models),
    GeorgeModel\=kratos,
    GeorgeModel\=nike.


%solve_puzzle(AnswerList)
solve_puzzle(AnswerList) :-
    answer_form(AnswerList),
    hint1(AnswerList),
    hint2(AnswerList),
    hint3(AnswerList),
    hint4(AnswerList),
    hint5(AnswerList),
    hint6(AnswerList),
    force_memberships(AnswerList),
    force_differences(AnswerList).
