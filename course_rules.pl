% some rules about courses and enrollment
% Mary Elaine Califf and Aidan Freund

consult(course_info).

% in_same_course(Student1, Student2) - Student1 and Student2 are in the same course and are different students
in_same_course(Student1, Student2):-
    not(Student1 = Student2),
    taking(Student1, Course),
    taking(Student2, Course),
    Course = Course.    
    % I dont understand why I need to specify Course = Course here?

% taking_two_courses(Student) - Student is taking at least two courses
taking_two_courses(Student):-
    taking(Student, Course),
    taking(Student, Other_course),
    not(Course = Other_course).

% before(Course1, Course2) - Course1 must come before Course2 based on the prerequisite information
% basecase
before(Course1, Course2):-
    prerequisite(Course1, Course2).
before(Course1, Course2):-
    prerequisite(Course1, Intermediary),
    prerequisite(Intermediary, Course2),
    before(Intermediary, Course2).


    
