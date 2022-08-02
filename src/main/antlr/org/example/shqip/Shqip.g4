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

THUAJ                : T H U A J ;

fragment LOWERCASE  : [a-z] ;
fragment UPPERCASE  : [A-Z] ;

WORD                : (LOWERCASE | UPPERCASE)+ ;

WHITESPACE          : (' ') ;

PERIOD          : ('.') ;

NEWLINE             : ('\r'? '\n' | '\r')+ ;

/*
 * Parser Rules
 */

say             : THUAJ WHITESPACE text PERIOD ;

text             : (WORD | WHITESPACE)+ ;
