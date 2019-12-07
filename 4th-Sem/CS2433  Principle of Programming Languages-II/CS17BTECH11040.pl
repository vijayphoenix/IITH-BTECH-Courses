%% Construct new tree Res using Operand1 and Operand2 as subtrees
%% Operator can be  + | - | * | / 
construct_tree(Operand1,Operand2,Res) :- 
   Res = Operand1 + Operand2;
   Res = Operand1 - Operand2;
   Res = Operand1 * Operand2;
   Res = Operand1 / Operand2, Operand2 =\= 0.   % Avoid division by 0


%% Split the List L at a random position to generate two non-empty lists L1 and L2.
partition(L,L1,L2) :- append(L1,L2,L), L1 = [_|_], L2 = [_|_].


%% Special Case for a single term in list
make_expression([X],X).
%% This function generates all possible expressions for a list of numbers LHS and four operators +,-*,/
make_expression(LHS,Exp) :-                    
   partition(LHS,LHS1,LHS2),              
   make_expression(LHS1,Exp1),                 
   make_expression(LHS2,Exp2),                 
   construct_tree(Exp1,Exp2,Exp).            
   
%% LHS is a List, RHS is a number
solve(LHS,RHS) :-
   make_expression(LHS,Exp),                 
   Exp =:= RHS,                   % Solve Exp and equate it with RHS             
   % Print Exp and RHS to STDOUT. Appropriate bracketing is done to show the correct internal tree structure of Exp. 
   format('~w=~w\n',[Exp,RHS]),!.   
%% Print IMPOSSIBLE if no permutation of operators gives the desired results
solve(_,_) :- format('IMPOSSIBLE\n').


%% Special case for empty List
lhs_rhs(RHS,LHS,[]) :- RHS = 0, LHS =[].
%% Separate last term from the rest of the list,  RHS = Last term, LHS = Rest     
lhs_rhs(RHS,LHS,L) :- append(LHS,[RHS],L),!. 

run(0,_).                        % Dont run when N is 0
run(N,S):-                 
   read(S,List),                 % Read List from the File
   lhs_rhs(RHS,LHS,List),        % Separate last term from the rest of the list,  RHS = Last term, LHS = Rest
   solve(LHS,RHS),               % Solve LHS and RHS
   N1 is N-1,
   run(N1,S).                    % Repeat 

%% Main Function 
main:-
   open('input.txt',read,S),      % Read input from the File
   read(S,N),                     % N is the no. of inputs
   run(N,S),
   close(S).