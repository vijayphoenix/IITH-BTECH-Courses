# **COOL Compiler Semantic Analyser**

This repository contains the implementation of the semantic analyser for COOL language.  
It uses the Abstract Syntax Trees(AST) built by the parser to check that a program conforms to the COOL specification.  
It rejects semantically erroneous programs and for correct programs it annotates AST.

Salient features of our Semantic Analyser:

- Only **two AST traversals** are required.
- Most of the errors like **Cyclic Inheritance, undefined Classes, repeated attributes** etc are handled in the first AST traversal. We halt compilation citing the corresponding reasons.
- **Good Error messages** : We print correct line number, filename in every error message.(This feature is not present in the default cool compiler).
- Implementation of **Visitor pattern** for checking semantic correctness.

Our semantic analyzer works in the following way:

1. Create **graph nodes** for each Class

- First, we create graph nodes corresponding to the five basic classes which are **Object, IO, Int, Bool and String** _._ We then iterate through each class and create graph nodes for them. While doing so, we make sure that no class with the same **class.name** is already defined.
- While creating the graph nodes, we partition the features into two parts attributes and methods and while doing so, we make sure that no attribute or method name is being redefined.
- Once we have created the graph nodes for each class, we do some additional checks like
  - **Class Main** is defined or not.
  - If **Class Main** is defined, then check if we have a **Method main** in Class Main.
  - If a Method main is defined, then we ensure that it has **no parameters**.
- We go to the next step if all the above checks pass else we throw the corresponding errors and halt compilation citing reason as semantic error.

2. Create an **Inheritance graph** and check for cycles

- We proceed to first create a graph using an **adjacency list** and while doing so we check if all the parents of our class exists else we return an error.
- Next we check our graph for cycles by calling **depth-first search** from graph node of **Class Object**.
- While doing DFS, we also record the **entry time** and **exit time** for each node in DFS. This helps us determine if a node is a child of another node in **O(1)** time. In this DFS traversal, we also add all the attributes and methods from parent classes in the child class and handle all the repeated attributes and methods in the child class. This helps us to access any attribute or method from parent class in **O(1)** time.
- If we detect any cycle then we report an error and halt compilation citing corresponding reasons.

3. Visit program and check for semantic errors and anomalies.

- We first iterate through all classes in the program and then visit each class.
- When we enter a class, we enter a new scope and add an **attribute corresponding to self** in the scopetable. Then we add all the attributes present in the class to the scope table because the cool compiler allows the usage of attributes which are defined later in the same scope.
- Then we visit all the attributes and methods in the order they are defined.
- When we have finished visiting, we exit the scope.

4. Visit attributes and methods

- Attributes
  - We make some initial checks like
    - **Name** of the attribute is not **&#39;self&#39;**
    - **TypeId** of the attribute should be defined.
  - We first see if there exists a value expression, otherwise it defaults to no expression. Then we don&#39;t do anything and move on.
  - Then we visit the expression. Let&#39;s call the type of this expression as type1. If type1 is not an ancestor of the type of the attribute then we throw an error.
  - After doing this we return back.

- Methods
  - We first enter a scope.
  - Then we visit **formals (arguments)**, and add them in the scope table. If any of them appears multiple times, we throw an error. We ensure that no formal name is **&#39;self&#39;.**
  - Then we visit the body of the method which is an expression.
  - After we have finished the previous visit, we compare the deduced type of the method and the return type of the method. If they don&#39;t match, we throw an error.
  - When we finish our visit, we exit the scope.

5. Visit the various children of expressions.

- Expression can itself branch out to various child classes like _dispatch, static\_dispatch, no\_expr, bool\_const, string\_const, int\_const, object, comp, eq, leq, lt, neg, divide, mul, sub, plus, isVoid, new, assign, block, loop, cond, let and typcase._
- Visit the **dispatch** expression
  - We first visit the caller of the dispatch which is an expression.
  - Then we individually visit all the arguments of the dispatch, which themselves are expressions. At no point of time, attributes will be passed, because attributes have values which are expressions which are passed.
  - After visiting the above expressions, we determine if the inferred type of the caller exists or not. If it doesn&#39;t exist we throw an error.
  - We then check if the caller had a method with the dispatch name. If we have such a method then we check the number of arguments and the type of arguments with the signature. Should any fail, we throw an error.
  - If we don&#39;t have such a method,then we throw an error.
  - Finally, we have it return the type &quot;Object&quot; in case of errors, such that semantic checking may continue.

- Visit the **static\_dispatch** expression
  - We first visit the caller of the dispatch which is an expression.
  - Then we individually visit all the arguments of the dispatch, which themselves are expressions. At no point of time, attributes will be passed, because attributes have values which are expressions which are passed.
  - After visiting the above expressions, we determine if the inferred type of the class exists or not. If it doesn&#39;t exist we throw an error.
  - Then if the inferred type of the caller exists, we check if the caller is actually the child of the class,whose function we are calling.if it is not then we throw an error.
  - If it is actually the child of the class, we follow the rest of the steps of the static dispatch.
- Visit the **no\_expr** expression
  - We don&#39;t need to do anything.
- Visit the **bool\_const** expression
  - We set it&#39;s type as Bool
- Visit the **string\_const** expression
  - We set it&#39;s type as String
- Visit the **int\_const** expression
  - We set it&#39;s type as Int
- Visit the **object** expression
  - We check if the object is present in our scope table. If it is not then it means that it was not declared and hence we throw an error. Then we set it&#39;s type as Objects and we return.
  - If we find the object then, we just set the type as the type that we got from the scope table.
- Visit the **comp** expression
  - We visit the expression inside it.
  - If the returned type is not Bool then we report an error and set it as Bool otherwise we do not do anything.
- Visit the **eq** expression
  - We visit both the expression of the equality.
  - Then we compare their types with the basic types : String,Int and Bool.
  - Then we check if both the expressions have same type else we return an error.
  - We then set the type to Bool.
- Visit the **leq** expression
  - We visit both the expressions of the comparison.
  - If any of them are not of the type Int, then we throw an error.
  - We set the type to Bool.
- Visit the **lt** expression
  - Repeat the above 3 steps of leq expression
- Visit the **neg** expression
  - Visit the expression
  - Check if the type of the expression is Int. If not we throw an error.
  - We set they type to Int
- Visit the **divide** expression
  - Repeat the first 2 steps of what we did in leq or lt.
  - We set the type to Int.
- Visit the **mul** expression
  - Repeat the 2 steps of divide.
- Visit the **sub** expression
  - Repeat the 2 steps of divide.
- Visit the **plus** expression
  - Repeat the 2 steps of divide.
- Visit the **isVoid** expression
  - We set the type to Bool
- Visit the **new** expression
  - We check if the class exists.
  - If it does not exists, we throw an error.
- Visit the **assign** expression
  - We visit the expression.
  - We check if the variable has already been declared by looking it up in the scopetable else we throw an error.
  - Then we check if the type of the attribute is a parent or not of the inferred type of the expression.
  - We set the type as the expression&#39;s type.
- Visit the **block** expression
  - We visit all the expressions inside a block.
  - Then we set the type as what the type of the last expression of the block is.
- Visit the **loop** expression
  - We visit the loop predicate which is an expression.
  - If it&#39;s inferred type is not Bool we throw an error.
  - Then we visit the loop body.
  - We set the type as Object
- Visit the **cond** expression
  - We repeat the above 2 steps of loop.
  - Then we visit the body of if, if the condition was true and the body of else which is if the condition was false.
  - Then we set the type as the least common ancestor of the types of the above two expressions which we visited.
- Visit the **let** expression
  - First we check if the expression is not a no\_expr.
  - We also ensure that **&#39;self&#39;** is not bound in a let expression.
  - If it is not then we visit the expression.
  - Then we check if the given type and the inferred type matches and if it doesn&#39;t, we throw an error.
  - After doing this we enter a new scope.
  - We insert the attribute specified into the scope table and then visit the body of the let.
  - Then we set it&#39;s type to the type of the body.
  - We then exit the scope.
- Visit the **typecase** expression
  - We visit the predicate.
  - Then we visit each branch.
  - Then we iterate over all branches and check if all the branch types are appearing only once.
  - While iterating we keep doing least common ancestor such that we get the type which is nearest to our required type

- Visit the **branch** expression
  - Enter a new scope
  - We ensure that **&#39;self&#39;** is not bound in a branch expression.
  - Check if the type of the branch exists else we put it in the scope table.
  - Exit the scope.
