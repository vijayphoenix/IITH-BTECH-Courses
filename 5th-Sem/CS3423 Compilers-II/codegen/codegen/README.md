# **Code Generation for COOL**
  
  

Tadikamalla Vijay : CS17BTECH11040

Tungadri Mandal : CS17BTECH11043

  
  
  

**Problem:**

In this assignment, we create a simplified version of the code generator for cool given the lexer, parser and semantic analyser with minor changes to semantic analyser.This report is aimed to report only how the code generation part of our compiler works.

  

**Code Structure And Overview:**

Each class has a corresponding object in the class NodeGraph. The NodeGraph stores all the information of the class like methods, attributes, parent name, node size and so on.After getting the annotated AST from semantic analyser, we first generate the adjacency list. Then we first create the nodes for the default classes such as Object and IO.Then we iterate over all the classes once and print their class declarations.Then we once again iterate over all the classes and print the IR for the functions and the main part of the IR through BFS.

  

**Generating Adjacency List:**

This is basically the inheritance graph from the previous assignment but without the semantic checks and following checks as semantic analyser has already done that and hence we are sure we have a correct annotated AST. This helps while defining class types as structs for referring to parents.

  
  

**Printing Class Declarations:**

Then we use the created graph to print the class declarations while traversing the adjacency list. Other than the 5 default classes, the struct is declared based on the members of the class such as i32 for integer, i32 for bool and i8* for string and pointer to the struct for object of other class members.These are for representing the attributes of the class.The first member is always an object of the class’s parents.Object has 2 members, which are of type and i8* respectively. 

  
  

**Printing Classes:**

After all the declarations are printed, we start iterating over each class and printing their necessary parts.We start by printing constructors of the class and then the other functions. The functions are printed using a visitor pattern where we call visitor on every smaller part of the classes. The types are automatically resolved by the visitor pattern and there exists a visit for each AST node to print the corresponding IR. 

  

**Constructors:**

First we mangle the name of the constructor functions.All function names are mangled in the same way.First it starts with  Class followed by class name then length of the class name. Then it has Fun to indicate the start of function and then function name followed by length of the function. The mangled name of constructor functions have cons passed as their function in their mangled names.Then we initialise the attributes with appropriate values.Constructor normally have the return type void.

  

**Other Functions:**

First we also print some C functions for things like out_string and length so that they can call the C functions and perform the necessary tasks.As the IR is compiled with clang, the C libraries are linked and can be used in our IR.  All the functions of a class are printed by iterating over the methods of the class. 

  

They all have similar signature which is:

define &lt;return_type&gt; &lt;mangled_name&gt; (%class.&lt;class_name&gt;* %self,**formals)

  

The entry to the function is defined by the “entry:” label which is stored in the blocks list which is a list of string. The blocks also have similar entries for different parts of loop and conditional code parts.

  

**String Constants:**

After this we declare all the string constants  globally in the IR. We had created a vector for this which stored all the strings as we visited different functions. We also have some additional string constants.After getting all the string constants we declare them in the IR.

  

**Visitors:**

Now we will mention some of our visitor functions.

  

- **AST.block:**
Iterate over all the expressions and then call the visitor on each expression 
- **AST.loop:**
Create loop.cond,loop.body and loop.end and generate the IR of the loop in the appropriate block. 
- **AST.cond:**
Create if.then,if.else and if.end and generate the IR of the conditional block in the appropriate sub-blocks. 
- **AST.assign:**
Assign an expression or value to a formal or an attribute. 
- **AST.static_dispatch:**
If a null object is calling then dispatch to void else call the method. 
- **AST.new_:**
Allocate memory for an object. 
- **AST.isvoid:**
Check if something is null or not. 
