grammar Shqip;

/*
 * Lexer Rules
 */

NUMBER: [-]?[1-9]+[0-9]?;

fragment A          : ('A'|'a') ;
fragment B          : ('B'|'b') ;
fragment D          : ('D'|'d') ;
fragment E          : ('E'|'e') ;
fragment H          : ('H'|'h') ;
fragment I          : ('I'|'i') ;
fragment J          : ('J'|'j') ;
fragment L          : ('L'|'l') ;
fragment M          : ('M'|'m') ;
fragment N          : ('N'|'n') ;
fragment P          : ('P'|'p') ;
fragment Q          : ('Q'|'q') ;
fragment R          : ('R'|'r') ;
fragment S          : ('S'|'s') ;
fragment T          : ('T'|'t') ;
fragment U          : ('U'|'u') ;
fragment Z          : ('Z'|'z') ;

fragment LOWERCASE  : [a-z] ;
fragment UPPERCASE  : [A-Z] ;

THUAJ               : T H U A J ;

MBA                 : M B A ;
MEND                : M E N D ;
QE                  : Q E ;

SA                  : S A ;
ESHTE               : E S H T E ;

PLUS                : P L U S ;
MINUS               : M I N U S ;
HERE                : H E R E ;
SHUMEZIM            : S H U M E Z I M ;
PJESTIM             : P J E S T I M ;

WORD                : (LOWERCASE | UPPERCASE)+ ;

// WHITESPACE
W                   : (' ' | '\n')+ ;

PERIOD              : ('.' | '?') ;

NEWLINE             : ('\r'? '\n' | '\r')+ ;

/*
 * Parser Rules
 */

say             : THUAJ W text ;

mul             : (HERE | SHUMEZIM) ;

mathOperator    : (PLUS | MINUS | mul | PJESTIM) ;

expression
    : SA W WORD W mathOperator W NUMBER
    | SA W WORD
    | NUMBER W mathOperator W NUMBER
    | NUMBER
    ;

assign         
 : MBA W MEND W QE W WORD W ESHTE W expression
 ;

output          : SA W ESHTE W WORD;

statement
    : say
    | assign
    | output
    ;

code            : (statement PERIOD W?)+ ;

text             : (WORD | W)+ ;
