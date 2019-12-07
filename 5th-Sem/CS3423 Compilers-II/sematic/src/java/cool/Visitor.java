package cool;
import cool.AST.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.LinkedList;

public class Visitor {

    private boolean errorFlag = false;

    public void reportError(String filename, int lineNo, String error) {
        errorFlag = true;
        System.err.println(filename + ":" + lineNo + ": " + error);
    }

    public boolean getErrorFlag() {
        return errorFlag;
    }

    private Map<String, List<String>> adj_list; // Stores adjacent vertices corresponding to a node in the graph
    private Map<String, NodeGraph> nodes;       // Maps each class to a node
    private Map<String, Integer> nodeMap;       // Maps each class to an integer
    private Integer depth = 0;                  // Globar variable to determine depth during depth first search
    private Integer[] inTime;                   // Array which stores entry time during DFS of a node
    private Integer[] outTime;                  // Array which stores exit time during DFS of a node
    ScopeTable<attr> scopeTab = new ScopeTable<>();
    String filename;

    // The objects of this class represent each class of a COOL program
    private class NodeGraph {
        public String parent;
        public String filename;
        public Integer lineNo;
        public Map<String, attr> attributes;
        public Map<String, method> methods;

        // Constructor for calling on default classes of COOL
        public NodeGraph(String p) {
            parent = p;
            filename = "COOL_LIBRARY";
            lineNo = 0;
            attributes = new HashMap<>();
            methods = new HashMap<>();
        }

        // Constructor for calling on new classes of COOL
        public NodeGraph(class_ clsObj) {
            filename = clsObj.filename;
            parent = clsObj.parent;
            lineNo = clsObj.lineNo;
            attributes = new HashMap<>();
            methods = new HashMap<>();
            
            // This loop is separating the features into attributes and methods
            for (feature featureName : clsObj.features) 
            {
                if (featureName instanceof attr) {
                    attr refTemp = (attr) featureName;

                    // Checks if an attribute with same name is not being redefined
                    if (attributes.containsKey(refTemp.name))
                        reportError(filename, refTemp.lineNo, "Attribute " + refTemp.name + " is multiply defined.");
                    else
                        attributes.put(refTemp.name, refTemp);
                } 
                else if (featureName instanceof method) {
                    method refTemp = (method) featureName;
                    // Checks if an method with same name is not being redefined
                    if (methods.containsKey(refTemp.name))
                        reportError(filename, refTemp.lineNo, "Method " + refTemp.name + " is multiply defined.");
                    else
                        methods.put(refTemp.name, refTemp);
                }
            }
        }
    }

    public void preProcessInheritanceGraph()
    {
        nodes = new HashMap<>();

        // Adding a Node 'Object' in the Nodegraph along with methods like abort(), type_name().
        NodeGraph Object = new NodeGraph("");
        Object.methods.put("abort", new method("abort", new ArrayList<>(), "Object", new object("", 0), 0));
        Object.methods.put("type_name", new method("type_name", new ArrayList<>(), "String", new string_const("", 0), 0));
        Object.methods.put("copy", new method("copy", new ArrayList<>(), "Object", new object("", 0), 0));
        nodes.put("Object", Object);

        // Adding a Node 'IO' in the Nodegraph along with methods like out_string(), out_int(), in_string(), in_int().
        NodeGraph IO = new NodeGraph("Object");
        List<formal> f1 = Arrays.asList(new formal("out_string", "String", 0));
        List<formal> f2 = Arrays.asList(new formal("out_int", "Int", 0));
        IO.methods.put("out_string",new method("out_string", f1, "Object", new object("", 0), 0));
        IO.methods.put("out_int", new method("out_int", f2, "Object", new object("", 0), 0));
        IO.methods.put("in_string",new method("in_string", new ArrayList<>(), "String", new string_const("", 0), 0));
        IO.methods.put("in_int",new method("in_int", new ArrayList<>(), "Int", new int_const(0, 0), 0));
        nodes.put("IO", IO);
        
        NodeGraph Int = new NodeGraph("Object");
        nodes.put("Int", Int);
        
        NodeGraph Bool = new NodeGraph("Object");
        nodes.put("Bool", Bool);
        
        // Adding a Node 'str' in the Nodegraph along with methods like length(), concat(), substr().
        NodeGraph str = new NodeGraph("Object");
        List<formal> f3 = Arrays.asList(new formal("s", "String", 0));
        List<formal> f4 = Arrays.asList(new formal("i", "Int", 0), new formal("l", "Int", 0));
        str.methods.put("length",new method("length", new ArrayList<>(), "Int", new int_const(0, 0), 0));
        str.methods.put("concat", new method("concat", f3, "String", new string_const("", 0), 0));
        str.methods.put("substr", new method("substr", f4, "String", new string_const("", 0), 0));
        nodes.put("String", str);
    }

    // This creates the NodeGraph objects and checks for basic inheritance
    public void checkInheritance(program program) { 
        preProcessInheritanceGraph();
       
        // Checks if the class is not being redefined or inheriting from Bool,Int or String
        for (class_ className : program.classes) 
        {
            if (nodes.get(className.name) == null) {
                if (className.parent.equals("Int") || className.parent.equals("Bool") || className.parent.equals("String") || className.parent.equals("SELF_TYPE")) {
                    reportError(className.filename, className.lineNo, "Class " + className.name + " cannot inherit class " + className.parent + ".");
                    return;
                }
                NodeGraph temp = new NodeGraph(className);
                nodes.put(className.name, temp);
            } 
            else {
                reportError(className.filename, className.lineNo, "Class " + className.name + " was previously defined.");
                return;
            }
        }
       
        // Check for Class Main
        NodeGraph n = nodes.get("Main");
        if (n == null) {
            reportError(program.classes.get(0).filename, program.lineNo, "Class Main is not defined");
            return;
        } 
        // Check for 'main' Functions
        else {
            if (!n.methods.containsKey("main")) {
                reportError(n.filename, n.lineNo, "No 'main' method in class Main");
                return;
            }
            else {
                if(!n.methods.get("main").formals.isEmpty()){
                    reportError(n.filename, n.lineNo, "'main' method in class Main should have no arguments");
                    return;
                }
            }
        }
    }

    // This function creates the adjacency lists and hence the graph
    public void createAdjacencyList() 
    {
        //If there was an error previously then stop doing checks
        if (errorFlag) return;
        adj_list = new HashMap<>();

        for (Map.Entry<String, NodeGraph> cls : nodes.entrySet())
            adj_list.put(cls.getKey(), new LinkedList<>());

        // Checks if the parent class a class is deriving from exists.
        for (Map.Entry<String, NodeGraph> node : nodes.entrySet()) {
            if (node.getKey().equals("Object"))
                continue;
            if (adj_list.get(node.getValue().parent) == null) {
                reportError(node.getValue().filename, node.getValue().lineNo,
                        "Class " + node.getKey() + " inherits from an undefined class " + node.getValue().parent + ".");
                return;
            } else
                adj_list.get(node.getValue().parent).add(node.getKey());
        }
    }

    // Detects if an inheritance graph is cyclic or not
    public void detectCycles() { 
        if (errorFlag)
            return;
        nodeMap = new HashMap<>();
        Integer len = adj_list.size();
        inTime = new Integer[len];
        outTime = new Integer[len];
        boolean[] visited = new boolean[len];
        Integer temp = 0;

        // Here we initialise the map from a class to an integer
        for (Map.Entry<String, NodeGraph> cls : nodes.entrySet()) {
            nodeMap.put(cls.getKey(), temp);
            temp = temp + 1;
        }

        temp = nodeMap.get("Object"); // All classes must have Object as their ancestor
        depthFirstSearch(visited, temp, "Object"); // Call depth first search from Object

        // If any node was unvisited then they must have formed cycle disconnectedly
        for (Map.Entry<String, NodeGraph> cls : nodes.entrySet()) { 
            Integer i = nodeMap.get(cls.getKey());
            if (!visited[i])
                reportError(cls.getValue().filename, cls.getValue().lineNo, "Inheritance Graph is Cyclic at " + cls.getKey());
        }
    }

    // Do depth first search from class nodeString
    public void depthFirstSearch(boolean[] visited, Integer v, String nodeString) { 
        inTime[v] = depth; // Record entry time during DFS
        visited[v] = true;
        for (String temp : adj_list.get(nodeString)) {
            Integer i = nodeMap.get(temp);
            if (!visited[i]) {
                visited[i] = true;
                // Copy the attributes and features of parent to child which were not present in child
                union(nodeString, temp); 
                depth++;
                depthFirstSearch(visited, i, temp);
            }
        }
        depth++;
        outTime[v] = depth; // Record exit time during DFS
        return;
    }

    //Combines the attributes of the parent and the child class
    public void union(String parent, String child) {
        NodeGraph temp = nodes.get(child);
        // Checks if an attribute with same name has already been defined in parent
        for (Map.Entry<String, attr> a : nodes.get(parent).attributes.entrySet()) {
            if (temp.attributes.containsKey(a.getKey()))
                reportError(nodes.get(child).filename, temp.attributes.get(a.getKey()).lineNo,
                        "Attribute " + a.getKey() + " cannot be redefined in child: " + child + " class.");
            else
                temp.attributes.put(a.getKey(), a.getValue());
        }

        // Checks if a method with same name has already been defined and if yes then
        // defined with same signature
        for (Map.Entry<String, method> a : nodes.get(parent).methods.entrySet()) {
            method mChild = temp.methods.get(a.getKey());
            if (temp.methods.containsKey(a.getKey())) {
                if (!isFormalsEqual(mChild.formals, a.getValue().formals))
                    reportError(nodes.get(child).filename, mChild.lineNo, "Method " + a.getKey()
                            + " cannot be redefined in " + child + " class with different arguements");
                if (!mChild.typeid.equals(a.getValue().typeid))
                    reportError(nodes.get(child).filename, mChild.lineNo, "Method " + a.getKey()
                            + " cannot be redefined in " + child + " class with different return type");
            } else
                temp.methods.put(a.getKey(), a.getValue());
        }
    }

    // Checks if two formal lists are equal or not
    public Boolean isFormalsEqual(List<formal> formal1, List<formal> formal2) 
    {
        if (formal1.size() != formal2.size())
            return false;
        for (Integer i = 0; i < formal1.size(); i++)
            if (!formal1.get(i).typeid.equals(formal2.get(i).typeid))
                return false;
        return true;
    }

    //Checks if a class is an ancestor of another
    public Boolean isAncestor(String type1, String type2) {
        return (inTime[(nodeMap.get(type1))] >= inTime[(nodeMap.get(type2))]
                && outTime[(nodeMap.get(type1))] <= outTime[(nodeMap.get(type2))]);
    }

    //Returns the name of the least common ancestor of two classes
    private String leastCommonAncestor(String type1, String type2) {
        if (isAncestor(type1, type2))
            return type2;
        else if (isAncestor(type2, type1))
            return type1;
        else
            return leastCommonAncestor(nodes.get(type1).parent, type2);
    }

    //Visit function for program
    public void visit(program p) {
        for(class_ classes : p.classes)
            classes.accept(this);
	}

    //Visit function for class
	public void visit(class_ classes) {
        scopeTab.enterScope();
        scopeTab.insert("self", new attr("self",classes.name,new no_expr(classes.lineNo),classes.lineNo));
        filename = classes.filename;
        for(Map.Entry<String,attr> temp : nodes.get(classes.name).attributes.entrySet())
            if(temp!=null)scopeTab.insert(temp.getKey(),temp.getValue());
        for(feature temp : classes.features)
            temp.accept(this);
        scopeTab.exitScope();
	}

    //Visit function for attributes
	public void visit(attr atr) {
        atr.value.accept(this);
        if(nodes.get(atr.typeid)==null){
            reportError(filename, atr.lineNo,"Class " + atr.typeid + " of attribute " + atr.name + " is undefined.");
        }
        if(atr.name.equals("self")){
            reportError(filename, atr.lineNo, "'self' cannot be the name of an attribute.");            
        }
        if(atr.value.getClass() != no_expr.class)
        {
            if(!isAncestor(atr.value.type, atr.typeid))
                reportError(filename, atr.lineNo, "Inferred type " + atr.value.type + " of initialization of attribute " + atr.name + " does not conforms to declared type " + atr.typeid);
        }
    }

    //Visit function for methods
	public void visit(method m) {
        scopeTab.enterScope();
        for (formal e : m.formals) e.accept(this);
        m.body.accept(this);
        if (!isAncestor(m.body.type, m.typeid))
            reportError(filename, m.body.lineNo, "Inferred return type " + m.body.type + " of method " + m.name + " does not conforms to declared return type " + m.typeid);
        scopeTab.exitScope();
	}

    //Visit function for no_expr
	public void visit(no_expr no_expr) {
        return;
	}

    //Visit function for bool_const
	public void visit(bool_const bool_const) {
        bool_const.type = "Bool";
	}

    //Visit function for string_const
	public void visit(string_const string_const) {
        string_const.type = "String";
	}

    //Visit function for int_const
	public void visit(int_const int_const) {
        int_const.type = "Int";
	}

    //Visit function for object
	public void visit(object object) {
        attr a = scopeTab.lookUpGlobal(object.name);
        if (a == null) {
            reportError(filename, object.lineNo, "Undeclared identifier " + object.name);
            object.type = "Object";
        } else
            object.type = a.typeid;
	}

    //Visit function for comp
	public void visit(comp comp) {
        comp.e1.accept(this);
        if (comp.e1.type.equals("Bool") == false)
            reportError(filename, comp.lineNo, "Argument of 'not' has type " + comp.e1.type + " instead of Bool.");
        comp.type = "Bool";
	}

    //Visit function for eq
	public void visit(eq eq) {
        eq.e1.accept(this);
        eq.e2.accept(this);
        List<String> basic_types = Arrays.asList("String", "Int", "Bool");
        if (basic_types.contains(eq.e1.type) || basic_types.contains(eq.e2.type))
            if (eq.e1.type.equals(eq.e2.type) == false) 
                reportError(filename, eq.lineNo, "Illegal comparison with a basic type.");
        eq.type = "Bool";
    }
    
    //Visit function for leq
	public void visit(leq leq) {
        leq.e1.accept(this);
        leq.e2.accept(this);
        if (leq.e1.type.equals("Int") == false || leq.e2.type.equals("Int") == false)
            reportError(filename, leq.lineNo, "non-Int arguments:" + leq.e1.type + " <= " + leq.e2.type);
        leq.type = "Bool";
	}

    //Visit function for lt
	public void visit(lt lt) {
        lt.e1.accept(this);
        lt.e2.accept(this);
        if (lt.e1.type.equals("Int") == false || lt.e2.type.equals("Int") == false)
            reportError(filename, lt.lineNo, "non-Int arguments: " + lt.e1.type + " < " + lt.e2.type);
        lt.type = "Bool";
    }
    
    //Visit function for branch
    public void visit(branch e) {
        scopeTab.enterScope();        
        if (e.name.equals("self")) {
            reportError(filename, e.lineNo, "'self' bound in 'case'.");
        }
        NodeGraph c = nodes.get(e.type);
        if (c == null) {
            reportError(filename, e.lineNo, "Class " + e.type + " of case branch is undefined.");
            scopeTab.insert(e.name, new attr(e.name, "Object", e.value, e.lineNo));
        } else
            scopeTab.insert(e.name, new attr(e.name, e.type, e.value, e.lineNo));
        e.value.accept(this);
        scopeTab.exitScope();

    }

    //Visit function for formal
    public void visit(formal formal) {
        if(formal.name.equals("self")){
            reportError(filename, formal.lineNo, "'self' cannot be the name of a formal parameter.");
            return;        
        }
        attr f = scopeTab.lookUpLocal(formal.name);
        if (f != null)
            reportError(filename, f.lineNo, "Formal parameter " + f.name + " is multiply defined.");
        else
            scopeTab.insert(formal.name, new attr(formal.name, formal.typeid, new no_expr(formal.lineNo), formal.lineNo));
    }

    //Visit function for neg
	public void visit(neg neg) {
        neg.e1.accept(this);
        if (!neg.e1.type.equals("Int")) reportError(filename, neg.lineNo, "Argument of '~' has type " + neg.e1.type + " instead of Int");
        neg.type = "Int";
	}

    //Visit function for divide
	public void visit(divide divide) {
        divide.e1.accept(this);
        divide.e2.accept(this);
        if (divide.e1.type.equals("Int") == false || divide.e2.type.equals("Int") == false)
            reportError(filename, divide.lineNo, "non-Int arguments: " + divide.e1.type + " / " + divide.e2.type);
        divide.type = "Int";
	}

    //Visit function for mul
	public void visit(mul mul) {
        mul.e1.accept(this);
        mul.e2.accept(this);
        if (mul.e1.type.equals("Int") == false || mul.e2.type.equals("Int") == false) {
            reportError(filename, mul.lineNo, "non-Int arguments: " + mul.e1.type + " * " + mul.e2.type);
        }
        mul.type = "Int";
	}

    //Visit function for sub
	public void visit(sub sub) {
        sub.e1.accept(this);
        sub.e2.accept(this);
        if (sub.e1.type.equals("Int") == false || sub.e2.type.equals("Int") == false) {
            reportError(filename, sub.lineNo, "non-Int arguments: " + sub.e1.type + " - " + sub.e2.type);
        }
        sub.type = "Int";
	}

    //Visit function for plus
	public void visit(plus plus) {
        plus.e1.accept(this);
        plus.e2.accept(this);
        if (plus.e1.type.equals("Int") == false || plus.e2.type.equals("Int") == false) {
            reportError(filename, plus.lineNo, "non-Int arguments: " + plus.e1.type + " + " + plus.e2.type);
        }
        plus.type = "Int";
	}

    //Visit function for isvoid
	public void visit(isvoid isvoid) {
        isvoid.type = "Bool";
        isvoid.e1.accept(this);
	}

    //Visit function for new
	public void visit(new_ new_) {
        NodeGraph c = nodes.get(new_.typeid);
        if (c == null) {
            reportError(filename, new_.lineNo, "'new' used with undefined class " + new_.typeid);
            new_.type = "Object";
        } else
            new_.type = new_.typeid;
	}

    //Visit function for assign
	public void visit(assign assign) {
        assign.e1.accept(this);
        attr a = scopeTab.lookUpGlobal(assign.name);
        if(assign.name.equals("self")){
            reportError(filename, assign.lineNo, "Cannot assign to 'self'.");
            return;
        }
        if (a == null) reportError(filename, assign.lineNo, "Assignment to undeclared variable " + assign.name);
        else if (!isAncestor(assign.e1.type, a.typeid))
            reportError(filename, assign.lineNo, "Type " + assign.e1.type + " of assigned expression does not conforms to declared type " + a.typeid + " of identifier " + a.name);
        assign.type = assign.e1.type;
	}

    //Visit function for block
	public void visit(block block) {
        for (expression e : block.l1) e.accept(this);
        block.type = block.l1.get(block.l1.size() - 1).type;
	}

    //Visit function for loop
	public void visit(loop loop) {
        loop.predicate.accept(this);
        if (!loop.predicate.type.equals("Bool"))
            reportError(filename, loop.predicate.lineNo, "Loop condition does not have type Bool.");
        loop.body.accept(this);;
        loop.type = "Object";
	}

    //Visit function for cond
	public void visit(cond cond) {
        cond.predicate.accept(this);
        if (!cond.predicate.type.equals("Bool"))
            reportError(filename, cond.predicate.lineNo, "Predicate of 'if' does not have type Bool.");
        cond.ifbody.accept(this);
        cond.elsebody.accept(this);
        cond.type = leastCommonAncestor(cond.ifbody.type, cond.elsebody.type);
	}

    //Visit function for let
    public void visit(let let) {
        if(let.name.equals("self")){
            reportError(filename, let.lineNo, "'self' cannot be bound in a 'let' expression.");
        }
        if (let.value.getClass() != no_expr.class) {
            let.value.accept(this);
            if (!isAncestor(let.value.type, let.typeid))
                reportError(filename, let.lineNo, "Inferred type of " + let.value.type + " of initialization" + "of " + let.name + " does not match with idenitifier's declared type " + let.typeid);
        }
        scopeTab.enterScope();
        scopeTab.insert(let.name, new attr(let.name, let.typeid, let.value, let.lineNo));
        let.body.accept(this);
        let.type = let.body.type;
        scopeTab.exitScope();
	}

    //Visit function for dispatch
	public void visit(dispatch dispatch) {
        //Visit the caller
        dispatch.caller.accept(this);

        //Visit the actuals
        for (expression e : dispatch.actuals)
            e.accept(this);

        NodeGraph c = nodes.get(dispatch.caller.type);
        //Check if the caller class exists or not
        if (c == null) {
            reportError(filename, dispatch.lineNo, "Class " + dispatch.caller.type + " is undefined.");
            dispatch.type = "Object";
        } else {
            //Check if class actually contains the method
            if (c.methods.containsKey(dispatch.name)) {
                method temp = c.methods.get(dispatch.name);
                //Set the type of dispatch
                dispatch.type = temp.typeid;
                //Check that the number of arguements match
                if (temp.formals.size() != dispatch.actuals.size())
                    reportError(filename, dispatch.lineNo,
                            "Method " + temp.name + " invoked with wrong number of arguments.");
                else {
                    //Check the type of the actuals and formals of the declaration match
                    for (int i = 0; i < dispatch.actuals.size(); i++)
                        if (!isAncestor(dispatch.actuals.get(i).type, temp.formals.get(i).typeid))
                            reportError(filename, dispatch.lineNo,
                                    "In call of method " + temp.name + ", type " + dispatch.actuals.get(i).type
                                            + " does not conform to declared type " + temp.formals.get(i).typeid);
                }
            } else {
                reportError(filename, dispatch.lineNo, "Dispatch to undefined method " + dispatch.name);
                dispatch.type = "Object";
            }
        }
    }

    //Visit function for static_dispatch
    public void visit(static_dispatch static_dispatch) {
        //Visit the caller
        static_dispatch.caller.accept(this);

        //Visit the actuals
        for (expression e : static_dispatch.actuals)
            e.accept(this);
        
        NodeGraph c = nodes.get(static_dispatch.typeid);

        //Check if the class exists or not
        if (c == null) {
            reportError(filename, static_dispatch.lineNo, "Class " + static_dispatch.caller.type + " is undefined.");
            static_dispatch.type = "Object";
        }
        else {
            
            //Check if the class is actually the parent of the caller class
            if(!isAncestor(static_dispatch.caller.type, static_dispatch.typeid))
            {
                reportError(filename, static_dispatch.lineNo, "Expression type " + static_dispatch.caller.type+ " does not conform to declared static dispatch type " + static_dispatch.typeid);
                static_dispatch.type = "Object";
            }
            else
            {   //Check if class actually contains the method
                if (c.methods.containsKey(static_dispatch.name)) {
                method temp = c.methods.get(static_dispatch.name);
                static_dispatch.type=temp.typeid;
                //Check if the number of arguments are same
                if (temp.formals.size() != static_dispatch.actuals.size())
                    reportError(filename, static_dispatch.lineNo,
                            "Method " + temp.name + " invoked with wrong number of arguments.");
                else {
                    for (int i = 0; i < static_dispatch.actuals.size(); i++)
                    //Check if the type of the arguments are same or not    
                    if (!isAncestor(static_dispatch.actuals.get(i).type, temp.formals.get(i).typeid))
                            reportError(filename, static_dispatch.lineNo,
                                    "In call of method " + temp.name + ", type " + static_dispatch.actuals.get(i).type
                                            + " does not conform to declared type " + temp.formals.get(i).typeid);
                }
            } else {
                reportError(filename, static_dispatch.lineNo, "Dispatch to undefined method " + static_dispatch.name);
                static_dispatch.type = "Object";
            }}
        }
    }

    //Visit function for typcase
	public void visit(typcase typcase) {
        //visit the predicate
        typcase.predicate.accept(this);
        //visit the branches
        for (branch e : typcase.branches) {
            e.accept(this);
        }

        Map<String, Boolean> br_types = new HashMap<>();
        typcase.type = typcase.branches.get(0).value.type;

        //Check that a type of branch only exist only once
        for (branch br : typcase.branches) {
            if (!br_types.containsKey(br.type) )
                br_types.put(br.type, true);
            else
                reportError(filename, br.lineNo, "Duplicate branch " + br.type + " in case statement.");
            //Set the type of typcase
            typcase.type = leastCommonAncestor(typcase.type, br.value.type);
        }

	}
}