/*
 *  The scanner definition for COOL.
 */

/*
 *  Stuff enclosed in %{ %} in the first section is copied verbatim to the
 *  output, so headers and global definitions are placed here to be visible
 * to the code in the file.  Don't remove anything that was here initially
 */
%{
#include <cool-parse.h>
#include <stringtab.h>
#include <utilities.h>

/* The compiler assumes these identifiers. */
#define yylval cool_yylval
#define yylex  cool_yylex

/* Max size of string constants */
#define MAX_STR_CONST 1025
#define YY_NO_UNPUT   /* keep g++ happy */

extern FILE *fin; /* we read from this file */

/* define YY_INPUT so we read from the FILE fin:
 * This change makes it possible to use this scanner in
 * the Cool compiler.
 */
#undef YY_INPUT
#define YY_INPUT(buf,result,max_size) \
	if ( (result = fread( (char*)buf, sizeof(char), max_size, fin)) < 0) \
		YY_FATAL_ERROR( "read() in flex scanner failed");

char string_buf[MAX_STR_CONST]; /* to assemble string constants */
char *string_buf_ptr;

extern int curr_lineno;
extern int verbose_flag;

extern YYSTYPE cool_yylval;

/*
 *  Add Your own definitions here
 */
int comment_depth = 0;	/* Variable for multilevel comments */

bool overflow();	/* Function to check overflow	*/
int err();			/* Finish long strings and return ERROR */

%}

/*
 * Define names for regular expressions here.
 */

INT			[[:digit:]]+
TYPE		[[:upper:]][[:alnum:]_]*
OBJECT 		[[:lower:]][[:alnum:]_]*
NEWLINE		"\n"
WHITESPACE 	[[:blank:]]
DARROW      =>
ASSIGN		<-
LESSTHAN	<=
OPERATOR	"{"|"}"|","|":"|"."|"@"|"+"|"-"|"*"|"/"|"~"|"<"|"="|"("|")"|";"

 /* Iterate till end of line */
SINGLE_LINE_COMMENT "--".*

 /* Exclusive start conditions */
%x comment string end_string

%%
 /* Eat up newline in code and multiline comments*/
<INITIAL,comment>{NEWLINE}			curr_lineno++;


{SINGLE_LINE_COMMENT}

 /*
  *  Nested comments 
  */
  
"(*"					{ comment_depth++; BEGIN(comment); }

<comment>"(*"			{ comment_depth++; }

 /* comment end*/
<INITIAL,comment>"*)"	{ 
							if(comment_depth <= 0) {
								cool_yylval.error_msg = "Unmatched *)";
								return ERROR;
							}
							else {
								comment_depth--;
								if(comment_depth ==0)BEGIN(INITIAL);
							}
						}
<comment><<EOF>>        {
                            cool_yylval.error_msg = "EOF in comment";
                            BEGIN(INITIAL);
                            return ERROR;
                        }
  /* Eat up rest*/
<comment>.

 /*String Starts*/
\"						{ 
							string_buf[0] = '\0';
							string_buf_ptr = string_buf;
							BEGIN(string); 
						}
 /* EOF in String*/	
<string><<EOF>>			{
							cool_yylval.error_msg = "EOF in string constant";
							BEGIN(end_string);
  							return ERROR;
  						}
 /* Null char in string*/
<string>\0				{
							cool_yylval.error_msg = "String contains null character.";
							BEGIN(end_string);
							return ERROR;
						}
										
<string>\n				{
							curr_lineno++;
							BEGIN(INITIAL);
							cool_yylval.error_msg = "Unterminated string constant";
							return ERROR;
						}
  /* Multi-line String*/
<string>\\\n			{
							curr_lineno++;
							if(overflow())return err();
							*string_buf_ptr++ = '\n';
						}
 /* Escaped null character */
<string>\\\0			{
							cool_yylval.error_msg = "String contains escaped null character.";
							BEGIN(end_string);
							return ERROR;
						}
 /* End of string */
<string>\"				{
							if(overflow())return err();
							*string_buf_ptr = '\0';
							cool_yylval.symbol = stringtable.add_string(string_buf);
							BEGIN(INITIAL);
							return STR_CONST;
						}
 /*
  *  String constants (C syntax)
  *  Escape sequence \c is accepted for all characters c. Except for 
  *  \n \t \b \f, the result is c.
  *
  */

<string>\\n				{  
							if(overflow())return err();
							*string_buf_ptr++ = '\n';
						}
						
<string>\\t				{	
							if(overflow())return err();
							*string_buf_ptr++ = '\t';
						}
						
<string>\\b				{
							if(overflow())return err();
							*string_buf_ptr++ = '\b';
						}
						
<string>\\f				{
							if(overflow())return err();
							*string_buf_ptr++ = '\f';
						}
						
<string>\\.				{
							if(overflow())return err();
							*string_buf_ptr++ = yytext[1];
						}
						
<string>.				{
							if(overflow())return err();
							*string_buf_ptr++ = yytext[0];
						}
 /* Eating up escaped double quote character occured */					
<end_string>\\\"
 /* Eating up escaped newline character after error occured */	
<end_string>\\\n   		{ curr_lineno++; }
 /* Unescaped newline occurs after these errors are encountered */
<end_string>\n			{ curr_lineno++; BEGIN(INITIAL); }
 /* " Occurs after these errors are encountered */
<end_string>\"			{ BEGIN(INITIAL); }
 /* Eat Remaining characters */
<end_string>.

{WHITESPACE}+

 /*
  * Keywords are case-insensitive except for the values true and false,
  * which must begin with a lower-case letter.
  */
(?i:class)		    return CLASS;
(?i:else)		    return ELSE;
(?i:fi)			    return FI;
(?i:if)			    return IF;
(?i:in)			    return IN;
(?i:inherits)	    return INHERITS;
(?i:isvoid)		    return ISVOID;
(?i:let)		    return LET;
(?i:loop)		    return LOOP;
(?i:pool)		    return POOL;
(?i:then)		    return THEN;
(?i:while)		    return WHILE;
(?i:case)		    return CASE;
(?i:esac)		    return ESAC;
(?i:new)		    return NEW;
(?i:of)			    return OF;
(?i:not)		    return NOT;

 /* Case sensitive values true and false */
(t)(?i:rue)			{ cool_yylval.boolean = true; return BOOL_CONST; }
(f)(?i:alse)		{ cool_yylval.boolean = false; return BOOL_CONST; }

 /*
  *  The multiple-character operators.
  */
{DARROW}		    return DARROW;
{ASSIGN}		    return ASSIGN;
{LESSTHAN}			return LE;

 /* Other Single char valid operators */
{OPERATOR}		    return int(yytext[0]);
{INT}          		{ cool_yylval.symbol = inttable.add_string(yytext); return INT_CONST; }
{TYPE}				{ cool_yylval.symbol = idtable.add_string(yytext); return TYPEID; }
{OBJECT}			{ cool_yylval.symbol = idtable.add_string(yytext); return OBJECTID; }
.					{ cool_yylval.error_msg = yytext; return ERROR;	}

%%

bool overflow () { return ((string_buf_ptr - string_buf) > (MAX_STR_CONST - 1)); }

int err() { 
    BEGIN(end_string);
    cool_yylval.error_msg = "String constant too long";
    return ERROR;
}
