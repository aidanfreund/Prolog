% information about courses and current and past enrollment
% Mary Elaine Califf

% prerequisite(Prerequisite, Course)
prerequisite(it168, it179).
prerequisite(it179, it180).
prerequisite(it179, it327).
prerequisite(it180, it279).
prerequisite(it168, it225). % not messing with corequisites
prerequisite(it225, it261).
prerequisite(it279, it383).
prerequisite(it279, it328).
prerequisite(it225, it383).

% taking(Student, Course)
taking(john_doe, it279).
taking(john_doe, it225).
taking(jane_doe, it225).
taking(jane_doe, it179).
taking(mary_smith, it261).
taking(mary_smith, it279).
taking(jeff_jones, it383).
taking(jeff_jones, it327).
taking(jeff_jones, it261).
taking(jay_collins, it168).

% has_taken(Student, Course)
has_taken(john_doe, it168).
has_taken(john_doe, it179).
has_taken(john_doe, it180).
has_taken(jane_doe, it168).
has_taken(mary_smith, it168).
has_taken(mary_smith, it179).
has_taken(mary_smith, it225).
has_taken(mary_smith, it180).
has_taken(mary_smith, it327).
has_taken(jeff_jones, it168).
has_taken(jeff_jones, it179).
has_taken(jeff_jones, it225).
has_taken(jeff_jones, it180).
has_taken(jeff_jones, it279).

%HW21


rev_filter(List, E, Result):-
    rev_filter_acc(List, E, [], Result).
rev_filter_acc([],_,Acc, Acc).
rev_filter_acc([E|Tail], E, Acc, Result):-
    rev_filter_acc(Tail, E, Acc, Result).
rev_filter_acc([Head|Tail], E, Acc, Result):-
    rev_filter_acc(Tail, E, [Head|Acc], Result).

