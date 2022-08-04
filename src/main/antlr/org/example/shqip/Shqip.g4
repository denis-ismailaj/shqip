grammar Shqip;

/*
 * Lexer Rules
 */

NUMBER: [0-9]+;

fragment T          : ('T'|'t') ;
fragment H          : ('H'|'h') ;
fragment U          : ('U'|'u') ;
fragment A          : ('A'|'a') ;
fragment J          : ('J'|'j') ;
fragment M          : ('M'|'m') ;
fragment B          : ('B'|'b') ;
fragment E          : ('E'|'e') ;
fragment N          : ('N'|'n') ;
fragment D          : ('D'|'d') ;
fragment Q          : ('Q'|'q') ;
fragment S          : ('S'|'s') ;

THUAJ               : T H U A J ;
MBA                 : M B A ;
MEND                : M E N D ;
QE                  : Q E ;
SA                  : S A ;
ESHTE               : E S H T E ;

fragment LOWERCASE  : [a-z] ;
fragment UPPERCASE  : [A-Z] ;

WORD                : (LOWERCASE | UPPERCASE)+ ;

WS                  : (' ' | '\n')+ ;

PERIOD              : ('.' | '?') ;

NEWLINE             : ('\r'? '\n' | '\r')+ ;

/*
 * Parser Rules
 */

say             : THUAJ WS text ;

assign          : MBA WS MEND WS QE WS WORD WS ESHTE WS NUMBER;

output          : SA WS ESHTE WS WORD;

expression
    : say #SayExpr
    | assign #AssignExpr
    | output #OutputExpr
    ;

code            : (expression PERIOD WS?)+ ;

text             : (WORD | WS)+ ;
