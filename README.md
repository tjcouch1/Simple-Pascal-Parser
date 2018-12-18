# Simple-Pascal-Parser
Simplistic Pascal parsing program in logical paradigm

Written for Programming Languages class to experience logical programming. Based on [these syntax diagrams]( http://primepuzzle.com/tp2/syntax-diagrams.html), but simplified to include only the following rules:

* program (no identifier list in between parentheses - just put empty parens)
* block
	* VAR, and BEGIN branches only
	* Do not implement LABEL, TYPE, PROCEDURE, and FUNCTION
* type (These can be entered directly as keywords (terminals) rather than using the syntax diagram. Valid types for this assignment are INTEGER, REAL, and CHAR.)
* statement
	* Implement branches that start with variable, BEGIN, IF, and WHILE 
expression (the not equal operator is <>, less than is <=, and greater than is >=)
* simple expression
* term
* factor
	* Implement branches that start with unsigned constant, variable, (, and NOT
* variable
	* Implement branch that starts with variable identifier only
constant (Do not implement the constant identifier branch, which is a part of the first branch. You only need to use unsigned number.)
* unsigned constant
	* Do not implement constant identifier and string constants (branch that starts with an apostrophe ')
* unsigned number (instead of defining this recursively with digits and so on, you can use predicates built-in to SWI-Prolog, such as number/1).
* identifier (assume identifiers can only be a single lowercase letter - this is just to make the program easier for this case)