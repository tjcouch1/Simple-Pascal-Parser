/*
 * Timothy Couch
 * 2/26/18
 * CS 424-01 Dr. Lukins
 * valid_program.pl: Determines if a simplified Pascal program has
 * correct syntax.
 */

%normal rules
%tests validation of the input file. validateFile("pasc.txt").
%USE: validateFile("C:/Users/user/Documents/CS 424/Project 1/pascalProgram.txt").
validateFile(Prog) :- open(Prog, read, Fd),
   read_string(Fd, "", "", _, Str),
   validateString(Str).

%test validation of the input string. validateString("My name is TJ").
validateString(S) :-
    split_string(S, "\s\n\t", "\s\n\t", L),
    phrase(program,L), !.


%Pascal DCG clauses
%program is the whole pascal program
program --> ["PROGRAM"], identifier, ["("], [")"], [";"], block, ["."].

%block is a big ol' chunk of code
block --> ["VAR"], 'identifierDeclarationLoop', 'beginEndBlock'.
block --> 'beginEndBlock'.

%identifiers between optional commas
  %when I say optional throughout, I mean if there's just one you don't put the punctuation
'identifierCommaLoop' --> identifier.
'identifierCommaLoop' --> identifier, [","], 'identifierCommaLoop'.

%declarations of identifiers between forced semicolons
'identifierDeclarationLoop' --> 'identifierCommaLoop', [":"], type, [";"].
'identifierDeclarationLoop' --> 'identifierCommaLoop', [":"], type, [";"], 'identifierDeclarationLoop'.

%begin dostuff end
'beginEndBlock' --> ["BEGIN"], 'statementSemicolonLoop', ["END"].

%statements between optional semicolons
'statementSemicolonLoop' --> statement.
'statementSemicolonLoop' --> statement, [";"].%this is not in the language, but the program supplied needs it
'statementSemicolonLoop' --> statement, [";"], 'statementSemicolonLoop'.

%type is a type wowee
type --> ["INTEGER"].
type --> ["REAL"].
type --> ["CHAR"].

%statement is a line or chunk of code basically
statement --> variable, [":="], expression.
statement --> 'beginEndBlock'.
statement --> ["IF"], expression, ["THEN"], statement.
statement --> ["IF"], expression, ["THEN"], statement, ["ELSE"], statement.
statement --> ["WHILE"], expression, ["DO"], statement.

%expression is a couple of simple expressions with an operator inbetween
expression --> simpleExpression, 'operatorSimpleExpression'.

%operator + simpleExpression or nothing
'operatorSimpleExpression' --> [].
'operatorSimpleExpression' --> ["<"], simpleExpression.
'operatorSimpleExpression' --> ["<="], simpleExpression.
'operatorSimpleExpression' --> ["="], simpleExpression.
'operatorSimpleExpression' --> ["<>"], simpleExpression.
'operatorSimpleExpression' --> [">="], simpleExpression.
'operatorSimpleExpression' --> [">"], simpleExpression.
'operatorSimpleExpression' --> ["IN"], simpleExpression.

%simpleExpression is just a term with other operators and other terms
simpleExpression --> term, 'operatorTermLoop'.
simpleExpression --> ["+"], term, 'operatorTermLoop'.
simpleExpression --> ["-"], term, 'operatorTermLoop'.

%a loop of operator + term or nothing
'operatorTermLoop' --> [].
'operatorTermLoop' --> ["+"], term, 'operatorTermLoop'.
'operatorTermLoop' --> ["-"], term, 'operatorTermLoop'.
'operatorTermLoop' --> ["OR"], term, 'operatorTermLoop'.


%term is a bunch of factors with operators between
term --> factor, 'operatorFactorLoop'.

%a loop of operator + factor or nothing
'operatorFactorLoop' --> [].
'operatorFactorLoop' --> ["*"], factor, 'operatorFactorLoop'.
'operatorFactorLoop' --> ["/"], factor, 'operatorFactorLoop'.
'operatorFactorLoop' --> ["DIV"], factor, 'operatorFactorLoop'.
'operatorFactorLoop' --> ["MOD"], factor, 'operatorFactorLoop'.
'operatorFactorLoop' --> ["AND"], factor, 'operatorFactorLoop'.

%factor is a group of things
factor --> unsignedConstant.
factor --> variable.
factor --> ["("], expression, [")"].
factor --> ["NOT"], factor.

%variable is an identifier.
variable --> identifier.

%constant is a signed constant number.
constant --> ["+"], unsignedNumber.
constant --> ["-"], unsignedNumber.

%unsignedConstant is an unsigned number or NIL
unsignedConstant --> unsignedNumber.
unsignedConstant --> ["NIL"].

%unsignedNumber is a number that has no sign. Scientific notation works too
unsignedNumber([Y | X], X) :- atom_number(Y, Z), number(Z), Z >= 0.

%identifier is a single lower case character
identifier --> ["a"].
identifier --> ["b"].
identifier --> ["c"].
identifier --> ["d"].
identifier --> ["e"].
identifier --> ["f"].
identifier --> ["g"].
identifier --> ["h"].
identifier --> ["i"].
identifier --> ["j"].
identifier --> ["k"].
identifier --> ["l"].
identifier --> ["m"].
identifier --> ["n"].
identifier --> ["o"].
identifier --> ["p"].
identifier --> ["q"].
identifier --> ["r"].
identifier --> ["s"].
identifier --> ["t"].
identifier --> ["u"].
identifier --> ["v"].
identifier --> ["w"].
identifier --> ["x"].
identifier --> ["y"].
identifier --> ["z"].