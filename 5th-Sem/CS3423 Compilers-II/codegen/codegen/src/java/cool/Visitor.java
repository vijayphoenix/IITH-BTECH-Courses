package cool;
import cool.AST.*;
import java.io.PrintWriter;
import java.util.*;

public class Visitor {
    private Map<String, List<String>> adj_list;
	private Map<String, NodeGraph> nodes;      
	private Map<String, Integer> nodeMap;
	private List<String> strConst;
	List <String> funcArgs;
    List <String> blocks;
    method mGlobal;
	
	PrintWriter out;
	int varCount = 0;
    int loopCount = 0;
	int ifCount = 0;
	
	Visitor() {

	}
	
	Visitor(PrintWriter temp) {
		out=temp;
		strConst=new ArrayList<String>();
	}

	private class NodeGraph {
		public int nodeSize = 0;
		public int depth = 0;
		public String parent;
        public Map<String, attr> attributes;
		public Map<String, method> methods;
		public List <String> attrList;
		public Map<String, String> method2class;
		
		public NodeGraph(String p, int ns, int d) {
			parent = p;
			nodeSize = ns;
			depth = d;
			attributes = new HashMap<>();
			methods = new HashMap<>();
			attrList = new ArrayList<>();
			method2class = new HashMap<>();
		}

        public NodeGraph(class_ clsObj) {

			parent = clsObj.parent;
			NodeGraph temp = nodes.get(parent);
			
			attributes = new HashMap<>();
			methods = new HashMap<>();
			attrList = new ArrayList<>();
			method2class = new HashMap<>();
			if(!parent.equals("Object") && !parent.equals("IO") ){
				attributes.putAll(temp.attributes);
				method2class.putAll(temp.method2class);
				depth = temp.depth + 1;
				nodeSize = temp.nodeSize;
			}
			if(parent!=null)attrList.add("1");
			for (feature featureName : clsObj.features) 
			{
				if (featureName instanceof attr) {
					attr refTemp = (attr) featureName;
					attributes.put(refTemp.name, refTemp);
					attrList.add(refTemp.name);
					if (refTemp.typeid == "Int" || refTemp.typeid == "Bool") nodeSize += 4;
					else nodeSize += 8;
				}
				else if(featureName instanceof method) {
					method refTemp = (method) featureName;
					methods.put(refTemp.name, refTemp);
					method2class.put(refTemp.name,mangleName(clsObj.name, refTemp.name));
				}
			}
        }
    }

    public void createAdjacencyList(List <class_> classes){
		adj_list = new HashMap<>();
		adj_list.put("Object", new ArrayList<>());
		adj_list.put("IO", new ArrayList<>());

		nodeMap = new HashMap<>();

		int i = 0;
		for (class_ cls : classes) {
			adj_list.put(cls.name, new ArrayList <String> ());
			nodeMap.put(cls.name, i);
			i = i + 1;
		}

		adj_list.get("Object").add("IO");
		for (class_ cls : classes){
			if (cls.parent != null) adj_list.get(cls.parent).add(cls.name);
			else {
				cls.parent = "Object";
				adj_list.get("Object").add(cls.name);
			}
		}
	}

	public void emitClassDecl(List <class_> classes){
		Queue <String> q = new LinkedList<>();
		nodes = new HashMap<>();
		putDefualtClasses();
		q.add("Object");
		while (!q.isEmpty()) {
			String c = q.poll();
			if(!c.equals("Object") && !c.equals("IO"))
				nodes.put(c, new NodeGraph(classes.get(nodeMap.get(c))));
			printClass(c);
			for (String child : adj_list.get(c))
				q.add(child);
		}
	}

	public void printClass(String c){
		if (c.equals("Object"))
			out.println("%class.Object = type { i8*, i32 }");
		else if(c.equals("IO"))
			out.println("%class.IO = type { %class.Object }");
		else {
			NodeGraph n = nodes.get(c);
			out.print("%class."+ c + " = type { "  + "%class." + n.parent );
			for (String a : n.attrList) {
				if(a.equals("1"))continue;
				attr attr = n.attributes.get(a);
				out.print(", ");
				out.print(typeId(attr.typeid));
			}
			out.println(" }");
		}
	}

	public void emitFunctions(List <class_> classes) {
		Queue <String> q = new LinkedList<>();
		q.add("Object");
		while (!q.isEmpty()) {
			String c = q.poll();
			emitClassFunction(c);
			for (String child : adj_list.get(c))
				q.add(child);
		}
		emitMainFunction();
	}

	public void emitClassFunction(String c) {
		if(c.equals("Object")){
			emitObjectFunctions();
			emitStringFunctions();
		}
		else if(c.equals("IO"))	emitIOFunctions();
		else {
	        funcArgs = new ArrayList<>();
			emitConstructors(c);
			emitOtherFunctions(c);
		}
	}

	public void emitObjectFunctions() {
		out.println("; Constructor of class Object");
		out.print("define void ");
		out.print(mangleName("Object", "cons"));
		out.println("(%class.Object* %self) {");
		out.println("entry:");
		out.println("\tret void");
		out.println("}\n");

		strConst.add("@.str.0 = private unnamed_addr constant [6 x i8] c\"Abort\\00\", align 1");

		out.println("; Class Object Func abort");
		out.print("define %class.Object* ");
		out.print(mangleName("Object", "abort"));
		out.println("(%class.Object* %self) {");
		out.println("entry:");
		out.println("\t%0 = getelementptr inbounds %class.Object, %class.Object* %self, i32 0, i32 0");
		out.println("\t%1 = load i8*, i8** %0, align 8");
		out.println("\t%2 = getelementptr inbounds [6 x i8], [6 x i8]* @.str.0, i32 0, i32 0");
		out.println("\t%3 = call i32 (i8*, ...) @printf(i8* %2)");
		out.println("\tcall void @exit(i32 0)");
		out.println("\tret %class.Object* null");
		out.println("}\n");

		out.println("; Class Object Func type_name");
		out.print("define i8* ");
		out.print(mangleName("Object", "type_name"));
		out.println("(%class.Object* %self) {");
		out.println("entry:");
		out.println("\t%0 = getelementptr inbounds %class.Object, %class.Object* %self, i32 0, i32 0");
		out.println("\t%1 = load i8*, i8** %0, align 8");
		out.println("\tret i8* %1");
		out.println("}\n");
	}

	public void putDefualtClasses(){
		NodeGraph Object = new NodeGraph("", 12, 0);
		List<formal> f0=Arrays.asList(new formal("this", "Object", 0));
		Object.methods.put("abort", new method("abort", f0, "Object", new object("", 0), 0));
		Object.methods.put("type_name", new method("type_name", f0, "String", new string_const("", 0), 0));
		Object.method2class.put("abort", mangleName("Object", "abort"));
		Object.method2class.put("type_name", mangleName("Object", "type_name" ));
		nodes.put("Object", Object);

		NodeGraph IO = new NodeGraph("Object", 12, 1);
		List<formal> f1 = Arrays.asList(new formal("out_string", "String", 0), new formal("this", "IO", 0));
		List<formal> f2 = Arrays.asList(new formal("out_int", "Int", 0), new formal("this", "IO", 0));
		IO.methods.put("out_string",new method("out_string", f1, "Object", new object("", 0), 0));
		IO.methods.put("out_int", new method("out_int", f2, "Object", new object("", 0), 0));
		IO.methods.put("in_string",new method("in_string", new ArrayList<>(), "String", new string_const("", 0), 0));
		IO.methods.put("in_int",new method("in_int", new ArrayList<>(), "Int", new int_const(0, 0), 0));
		IO.method2class.putAll(Object.method2class);
		IO.method2class.put("out_string", mangleName("IO", "out_string"));
		IO.method2class.put("in_string", mangleName("IO", "in_string"));
		IO.method2class.put("in_string", mangleName("IO", "in_string"));
		IO.method2class.put("in_int", mangleName("IO", "in_int"));
		nodes.put("IO", IO);
		
		NodeGraph Int = new NodeGraph("Object", 4, 1);
		Int.method2class.putAll(Object.method2class);
		nodes.put("Int", Int);
		
		NodeGraph Bool = new NodeGraph("Object", 4, 1);
		Bool.method2class.putAll(Object.method2class);
		nodes.put("Bool", Bool);
		
		NodeGraph str = new NodeGraph("Object", 8, 1);
		List<formal> f3 = Arrays.asList(new formal("s", "String", 0), new formal("this", "String", 0));
		List<formal> f4 = Arrays.asList(new formal("i", "Int", 0), new formal("l", "Int", 0), new formal("this", "String", 0));
		str.methods.put("length",new method("length", new ArrayList<>(), "Int", new int_const(0, 0), 0));
		str.methods.put("concat", new method("concat", f3, "String", new string_const("", 0), 0));
		str.methods.put("substr", new method("substr", f4, "String", new string_const("", 0), 0));
		str.method2class.putAll(Object.method2class);
		str.method2class.put("length",mangleName("String", "length"));
		str.method2class.put("concat",mangleName("String", "concat"));
		str.method2class.put("substr",mangleName("String", "substr"));
		nodes.put("String", str);
	}

	public void emitStringFunctions() {

		out.println("; Class String Func length");
		out.print("define i32 ");
		out.print(mangleName("String", "length"));
		out.println("(i8* %self) {");
		out.println("entry:");
		out.println("\t%0 = call i64 @strlen( i8* %self )");
		out.println("\t%1 = trunc i64 %0 to i32");
		out.println("\tret i32 %1");
		out.println("}\n");

		out.println("; Class String Func concat");
		out.print("define i8* ");
		out.print(mangleName("String", "concat"));
		out.println("(i8* %s1, i8* %s2) {");
		out.println("entry:");
		out.println("\t%0 = call i64 @strlen(i8* %s1)");
		out.println("\t%1 = call i64 @strlen(i8* %s2)");
		out.println("\t%2 = add nsw i64 %0, %1");
		out.println("\t%3 = add nsw i64 %2, 1");
		out.println("\t%4 = call noalias i8* @malloc(i64 %3)");
		out.println("\t%5 = call i8* @strcpy(i8* %4, i8* %s1)");
		out.println("\t%6 = call i8* @strcat(i8* %4, i8* %s2)");
		out.println("\tret i8* %4");
		out.println("}\n");

		out.println("; Class String Func substr");
		out.print("define i8* ");
		out.print(mangleName("String", "substr"));
		out.println("(i8* %self, i32 %i, i32 %l) {");
		out.println("entry:");
		out.println("\t%0 = zext i32 %l to i64");
		out.println("\t%1 = call noalias i8* @malloc(i64 %0)");
		out.println("\t%2 = getelementptr inbounds i8, i8* %self, i32 %i");
		out.println("\t%3 = call i8* @strncpy(i8* %1, i8* %2, i64 %0)");
		out.println("\tret i8* %1");
		out.println("}\n");
	}
		
	public void emitIOFunctions() {

		strConst.add("@.str.1 = private unnamed_addr constant [3 x i8] c\"%s\\00\", align 1");
		strConst.add("@.str.2 = private unnamed_addr constant [3 x i8] c\"%d\\00\", align 1");
		strConst.add("@.str.3 = private unnamed_addr constant [10 x i8] c\"%1024[^\n]\\00\", align 1");

		out.println("; Class IO Func cons");
		out.print("define void ");
		out.print(mangleName("IO", "cons"));
		out.println("(%class.IO* %self) {");
		out.println("entry:");
		out.println("\t%0 = bitcast %class.IO* %self to %class.Object*");
		out.println("\tcall void " + mangleName("Object", "cons") + "(%class.Object* %0)");
		out.println("\tret void");
		out.println("}\n");

		out.println("; Class IO Func out_string");
		out.print("define %class.IO* ");
		out.print(mangleName("IO", "out_string"));
		out.println("(%class.IO* %self, i8* %s) {");
		out.println("entry:");
		out.println("\t%0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.1, i32 0, i32 0");
		out.println("\t%call = call i32 (i8*, ...) @printf(i8* %0, i8* %s)");
		out.println("\t%1 = call noalias i8* @malloc(i64 8)");
		out.println("\t%2 = bitcast i8* %1 to %class.IO*");
		out.println("\tcall void " + mangleName("IO", "cons") + "(%class.IO* %2)");
		out.println("\tret %class.IO* %2");
		out.println("}\n");

		out.println("; Class IO Func out_int");
		out.print("define %class.IO* ");
		out.print(mangleName("IO", "out_int"));
		out.println("(%class.IO* %self, i32 %d) {");
		out.println("entry:");
		out.println("\t%0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.2, i32 0, i32 0");
		out.println("\t%call = call i32 (i8*, ...) @printf(i8* %0, i32 %d)");
		out.println("\t%1 = call noalias i8* @malloc(i64 8)");
		out.println("\t%2 = bitcast i8* %1 to %class.IO*");
		out.println("\tcall void " + mangleName("IO", "cons") + "(%class.IO* %2)");
		out.println("\tret %class.IO* %2");
		out.println("}\n");

		out.println("; Class IO Func in_string");
		out.print("define i8* ");
		out.print(mangleName("IO", "in_string"));
		out.println("(%class.IO* %self) {");
		out.println("entry:");
		out.println("\t%0 = call noalias i8* @malloc(i64 1024)");
		out.println("\t%1 = getelementptr inbounds [10 x i8], [10 x i8]* @.str.3, i32 0, i32 0");
		out.println("\t%2 = call i32 (i8*, ...) @scanf(i8* %1, i8* %0)");
		out.println("\tret i8* %0");
		out.println("}\n");

		out.println("; Class IO Func in_int");
		out.print("define i32 ");
		out.print(mangleName("IO", "in_int"));
		out.println("(%class.IO* %self) {");
		out.println("entry:");
		out.println("\t%0 = alloca i32, align 8");
		out.println("\t%1 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.2, i32 0, i32 0");
		out.println("\t%call = call i32 (i8*, ...) @scanf(i8* %1, i32* %0)");
		out.println("\t%2 = load i32, i32* %0, align 4");
		out.println("\tret i32 %2");
		out.println("}\n");
	}

	public String typeId(String t){
		if (t.equals("Int") || t.equals("Bool")) return "i32";
    	else if (t.equals("String")) return "i8*";
    	else return "%class."+t+"*";
	}

    public String mangleName(String c, String Func){
        return "@_Class_" + c + "_" + c.length() + "_Fun_" + Func + "_" + Func.length();
	}
	
	public String retType(String t) {
		return t.split(" ")[0];
	}

	public void emitOtherFunctions(String c) {
		NodeGraph n = nodes.get(c);
		String formals = typeId(c)+" %self";
		
		for(Map.Entry<String, method> entry: n.methods.entrySet() ){
			mGlobal = entry.getValue();
			formals = "%class."+c+"* %self";
	    	for (formal f : mGlobal.formals) {
	    		formals += ", "+ typeId(f.typeid) + " %" + f.name;
			}
			blocks.clear();
			
	        out.println("define "+typeId(mGlobal.typeid)+" "+ n.method2class.get(entry.getKey())+"( "+formals+" )" + "{");
	        out.println("entry:");
	        blocks.add("entry");
	        varCount = -1;
	        loopCount = -1;
	        ifCount = -1;
			for (formal f : mGlobal.formals) {
				String type = typeId(f.typeid);
				out.println("\t%"+f.name+".addr = alloca "+type+", align 4");
				funcArgs.add(f.name);
				out.println("\tstore "+type+" %"+f.name+", "+type+"* %"+f.name+".addr, align 4");
			}

			String ret = emitExprIR(c, mGlobal.body);
	        String rettype = retType(ret);
	        if (!rettype.equals(typeId(mGlobal.typeid))) {
	        	if (rettype.equals("i32")) {
	        		out.println("\t%"+(++varCount)+" = call noalias i8* @malloc(i64 8)"); // Object size
	        		out.println("\t%"+(++varCount)+" = bitcast i8* %"+(varCount-1)+" to "+typeId(mGlobal.typeid));
	        	} else {
	        		out.println("\t%"+(++varCount)+" = bitcast "+ret+" to "+typeId(mGlobal.typeid));	        		
	        	}
	        	ret = typeId(mGlobal.typeid)+" %"+varCount;
	        }
	        out.println("\tret "+ret);
			out.println("}\n");
		}
	}
	
	public void emitConstructors(String c) {
		NodeGraph n = nodes.get(c);
		out.println("; Constructor of class " + c);
		out.println("define void " + mangleName(c, "cons") + " ( " + typeId(c) + " %self ) {");
	    out.println("entry:");
		varCount = loopCount = ifCount = -1;
		blocks = new ArrayList<>();
		mGlobal = null;
		for (Map.Entry<String, AST.attr> entry :  n.attributes.entrySet())
			entry.getValue().accept(this, c);	
		out.println("\t%" + (++varCount) + " = bitcast " + typeId(c) +  " %self to %class.Object*");
		int objPtr = varCount;
		out.println("\t%"+(++varCount)+" = getelementptr inbounds %class.Object, %class.Object* %" + objPtr +", i32 0, i32 1");
		out.println("\tstore i32 "+ n.nodeSize +", i32* %"+varCount);
		String ty = "["+(c.length()+1)+" x i8]";
		strConst.add( "@.str."+ strConst.size() +" = private unnamed_addr constant "+ty+" c\""+c+"\\00\", align 1");
		out.println("\t%"+(++varCount)+" = getelementptr inbounds %class.Object, %class.Object* %" + objPtr +", i32 0, i32 0");
		out.println("\t%"+(++varCount)+" = getelementptr inbounds "+ ty + ", " + ty + "* @.str."+ (strConst.size() -1) + ", i32 0, i32 1");
		int strPtr = varCount;
		out.println("\tstore i8* %" + strPtr + ", i8** %" + (strPtr -1) +", align 8");
		out.println("\tret void");
	    out.println("}\n");
	}

	public void emitMainFunction() {
		emitCFunctions();
		strConst.add("@.str.divby0 = private unnamed_addr constant [22 x i8] c\"Division by 0 occured\\00\", align 1");
		strConst.add("@.str.voidDispatch = private unnamed_addr constant [25 x i8] c\"Dispatch to void occured\\00\", align 1");
		for (String str : strConst) {
			out.println(str);
		}
		out.println("");
		out.println("define i32 @main() {");
		out.println("entry:");
		out.println("\t%0 = alloca %class.Main, align 8");
		out.println("\tcall void " + mangleName("Main", "cons") + "(%class.Main* %0)");
		out.println("\tcall " + typeId(nodes.get("Main").methods.get("main").typeid) + mangleName("Main", "main") + "(%class.Main* %0)");
		out.println("\tret i32 0");
		out.println("}");
	}

	public void emitCFunctions() {
		out.println("declare i32 @printf(i8*, ...)\n");
		out.println("declare i32 @scanf(i8*, ...)\n");
		out.println("declare i64 @strlen(i8*)\n");
		out.println("declare i8* @strcpy(i8*, i8*)\n");
		out.println("declare i8* @strcat(i8*, i8*)\n");
		out.println("declare i8* @strncpy(i8*, i8*, i64)\n");
		out.println("declare noalias i8* @malloc(i64)\n");
		out.println("declare void @exit(i32)\n");
	}

	public String emitExprIR(String cname,expression expr) {
		return expr.accept(this,cname);		
	}

	public String visit(expression expr,String cname) {
		return "";
	}

	public String visit(attr attr, String cname) {
		NodeGraph n = nodes.get(cname);
		if (!(attr.value instanceof no_expr)) {
			assign exp = new assign(attr.name, attr.value, 0);
			exp.type = attr.typeid;
			emitExprIR(cname, exp);
		} else if (attr.typeid.equals("Int")) {
			assign exp = new assign(attr.name, new int_const(0, 0), 0);
			exp.type = "Int";
			emitExprIR(cname, exp);
		} else if (attr.typeid.equals("Bool")) {
			assign exp = new assign(attr.name, new bool_const(false, 0), 0);
			exp.type = "Bool";
			emitExprIR(cname, exp);
		} else if (attr.typeid.equals("String")) {
			assign exp = new assign(attr.name, new string_const("", 0), 0);
			exp.type = "String";
			emitExprIR(cname, exp);
		} else {
			int attri = n.attrList.indexOf(attr.name);
			String ctype = typeId(cname);
			ctype = ctype.substring(0, ctype.length()-1);
			out.println("\t%"+(++varCount)+" = getelementptr inbounds "+ctype+", "+ctype+"* %self, i32 0, i32 "+attri);
			out.println("\tstore "+typeId(attr.typeid)+" null, "+typeId(attr.typeid)+"* %"+varCount+", align 4");
		}
		return "";
	}

	public String visit(no_expr no_expr,String cname){
		return "";
	}

	public String visit(bool_const bool_const,String cname){
		return "i32 " + (bool_const.value ? 1 : 0);
	}

	public String visit(string_const string_const,String cname){
		strConst.add("@.str."+ strConst.size() +" = private unnamed_addr constant "+"["+(string_const.value.length()+1)+" x i8]"+" c\""+string_const.value+"\\00\", align 1");
		out.println("\t%"+(++varCount)+" = bitcast "+"["+(string_const.value.length()+1)+" x i8]"+"* @.str."+(strConst.size()-1)+" to i8*");
		return "i8* %"+varCount;
	}

	public String visit(int_const int_const,String cname){
		return "i32 " + int_const.value;
	}

	public String visit(object object,String cname){
			NodeGraph ci=nodes.get(cname);
			int attri = ci.attrList.indexOf(object.name);
			for (formal f : mGlobal.formals) {
				if (f.name.equals(object.name)) {
					attri = -1;
					break;
				}
			}
			if (attri == -1) {
				if (funcArgs.indexOf(object.name) == -1){
					return typeId(object.type) + " %"+object.name;
				}
				else {
					String ty = typeId(object.type);
					out.println("\t%"+(++varCount)+" = load "+ty+", "+ty+"* %"+object.name+".addr, align 4");
					return ty+" %"+varCount;
				}
			}
			String id = typeId(cname);
			id = id.substring(0, id.length()-1);
			out.println("\t%"+(++varCount)+" = getelementptr inbounds "+id+", "+id+"* %self, i32 0, i32 "+attri);
			out.println("\t%"+(++varCount)+" = load "+typeId(object.type)+", "+typeId(object.type)+"* %"+(varCount-1)+", align 4");
			return typeId(object.type)+" %"+varCount;
	}

	public String visit(comp comp,String cname){
		String e1 = emitExprIR(cname, comp.e1);
		out.println("\t%"+(++varCount)+" = sub nsw i32 1, " + e1.substring(4));
		return "i32 %"+varCount;
	}

	public String visit(eq eq,String cname){
		String e1 = emitExprIR(cname,eq.e1);
		String e2 = emitExprIR(cname,eq.e2);
		out.println("\t%"+(++varCount)+" = icmp eq i32 " + e1.substring(4) + ", " + e2.substring(4));
		return "i1 %"+varCount;
	}

	public String visit(leq leq,String cname){
		String e1 = emitExprIR(cname,leq.e1);
		String e2 = emitExprIR(cname,leq.e2);
		out.println("\t%"+(++varCount)+" = icmp sle i32 " + e1.substring(4) + ", " + e2.substring(4));
		return "i1 %"+varCount;
	}

	public String visit(lt lt,String cname){
		String e1 = emitExprIR(cname,lt.e1);
		String e2 = emitExprIR(cname,lt.e2);
		out.println("\t%"+(++varCount)+" = icmp slt i32 " + e1.substring(4) + ", " + e2.substring(4));
		return "i1 %"+varCount;
	}

	public String visit(neg neg,String cname){
		String e1 = emitExprIR(cname,neg.e1);
		out.println("\t%"+(++varCount)+" = sub nsw i32 0, " + e1.substring(4));
		return "i32 %"+varCount;
	}

	public String visit(divide divide,String cname){

		String e1 = emitExprIR(cname, divide.e1);
		String e2 = emitExprIR(cname, divide.e2);
		out.println("\t%"+(++varCount)+" = icmp eq i32 0, "+e2.substring(4));
		ifCount++;
		out.println("\tbr i1 %"+varCount+", label %if.then"+ifCount+", label %if.else"+ifCount);
		out.println("if.then"+ifCount+":");
		blocks.add("if.then"+ifCount);
		out.println("\t%"+(++varCount)+" = bitcast [22 x i8]* @.str.divby0 to i8*");
		out.println("\t%"+(++varCount)+" = call %class.IO* "+mangleName("IO", "out_string")+"( %class.IO* null, i8* %"+(varCount-1)+")");
		out.println("\tcall void @exit(i32 1)");
		out.println("\tbr label %if.else"+ifCount);
		
		out.println("if.else"+ifCount+":");
		blocks.add("if.else"+ifCount);
		out.println("\t%"+(++varCount)+" = sdiv i32 " + e1.substring(4) + ", " + e2.substring(4));
		return "i32 %"+varCount;
	}

	public String visit(mul mul,String cname){
		String e1 = emitExprIR(cname, mul.e1);
		String e2 = emitExprIR(cname, mul.e2);
		out.println("\t%"+(++varCount)+" = mul nsw i32 " + e1.substring(4) + ", " + e2.substring(4));
		return "i32 %"+varCount;
	}

	public String visit(sub sub,String cname){
		String e1 = emitExprIR(cname, sub.e1);
		String e2 = emitExprIR(cname, sub.e2);
		out.println("\t%"+(++varCount)+" = sub nsw i32 " + e1.substring(4) + ", " + e2.substring(4));
		return "i32 %"+varCount;
	}

	public String visit(plus plus,String cname){
		String e1 = emitExprIR(cname,plus.e1);
		String e2 = emitExprIR(cname,plus.e2);
		out.println("\t%"+(++varCount)+" = add nsw i32 " + e1.substring(4) + ", " + e2.substring(4));
		return "i32 %"+varCount;
	}

	public String visit(isvoid isvoid,String cname){
		String e1 = emitExprIR(cname, isvoid.e1);
		if(typeId(e1).substring(0, 6).equals("%class.")){
			out.println("\t%"+(++varCount)+" = icmp eq "+e1+", null");
			out.println("\t%"+(++varCount)+" = zext i1 %" + (varCount -1) + " to i32");
			return "i32 %"+varCount;
		}
		else return "i32 0";
	}

	public String visit(new_ new_,String cname){
		String type = typeId(new_.typeid);
		int size = nodes.get(new_.typeid).nodeSize;
		out.println("\t%"+(++varCount)+" = call noalias i8* @malloc(i64 "+size+")");
		out.println("\t%"+(++varCount)+" = bitcast i8* %"+(varCount-1)+" to "+type);
		out.println("\tcall void "+mangleName(new_.typeid, "cons")+"( "+type+" %"+varCount+" )");
		return type+" %"+varCount;
	}

	public String visit(assign assign,String cname){
		String e1 = emitExprIR(cname,assign.e1);
		int attri = nodes.get(cname).attrList.indexOf(assign.name);
		if (mGlobal != null) {
			for (formal f : mGlobal.formals) {
				if (f.name.equals(assign.name)) {
					attri = -1;
					break;
				}
			}
		}
		String type = typeId(assign.type);
		String stype = typeId(cname);
		stype = stype.substring(0, stype.length()-1);
		String e1type = retType(e1);
		if (!e1type.equals(type)) {
			if (e1type.equals("i32")) {
				out.println("\t%"+(++varCount)+" = call noalias i8* @malloc(i64 8)");
				out.println("\t%"+(++varCount)+" = bitcast i8* %"+(varCount-1)+" to "+type);
			} else {
				out.println("\t%"+(++varCount)+" = bitcast "+e1+" to "+type);	        		
			}
			e1 = type+" %"+varCount;
		}
		if (attri == -1) {
			if (funcArgs.indexOf(assign.name) == -1) {
				out.println("\t%"+assign.name+".addr = alloca "+type+", align 4");
				funcArgs.add(assign.name);
			}
			out.println("\tstore "+e1+", "+type+"* %"+assign.name+".addr, align 4");
			return e1;
		} else {
			out.println("\t%"+(++varCount)+" = getelementptr inbounds "+stype+", "+stype+"* %self, i32 0, i32 "+attri);
			out.println("\tstore "+e1+", "+type+"* %"+varCount+", align 4");
			return e1;
		}
	}

	public String visit(block block,String cname){
		String re = "";
		for (expression ex : block.l1) {
			re = emitExprIR(cname, ex);
		}
		return re;
	}

	public String visit(loop loop,String cname){
		int loopcnt = ++loopCount;
		out.println("\tbr label %loop.cond"+loopcnt);
		
		out.println("loop.cond"+loopcnt+":");
		blocks.add("loop.cond"+loopcnt);
		String pred = emitExprIR(cname, loop.predicate);
		if(pred.split(" ")[0].equals("i32")){
			out.println("\t%" + (++varCount) + " = trunc i32 " + pred.substring(4) + "  to i1");
			out.println("\tbr i1 "+ varCount +", label %loop.body"+loopcnt+" , label %loop.end"+loopcnt);
		}
		else out.println("\tbr i1 " + pred.split(" ")[1] +", label %loop.body"+loopcnt+" , label %loop.end"+loopcnt);
		
		out.println("loop.body"+loopcnt+":");
		blocks.add("loop.body"+loopcnt);
		String body = emitExprIR(cname, loop.body);
		out.println("\tbr label %loop.cond"+loopcnt);
		
		out.println("loop.end"+loopcnt+":");
		blocks.add("loop.end"+loopcnt);
		return body;
	}

	public String visit(cond cond,String cname){
		int ifcnt = ++ifCount;
			String pred = emitExprIR(cname, cond.predicate);
			if(pred.split(" ")[0].equals("i32")){
				out.println("\t%" + (++varCount) + " = trunc i32 " + pred.substring(4) + "  to i1");
				out.println("\tbr i1 "+ varCount +", label %if.then"+ifcnt+", label %if.else"+ifcnt);
			}
			else out.println("\tbr i1 "+ pred.split(" ")[1]+", label %if.then"+ifcnt+", label %if.else"+ifcnt);
			
			out.println("if.then"+ifcnt+":");
			blocks.add("if.then"+ifcnt);
			String ifbody = emitExprIR(cname, cond.ifbody);
			out.println("\t%" + (++varCount) + " = bitcast " + ifbody + " to " + typeId(cond.type));
			String ifbody1 = "%"+varCount;
			
			String ifbodylabel = blocks.get(blocks.size()-1);
			ifbody=ifbody.split(" ")[1];
			out.println("\tbr label %if.end"+ifcnt);
			
			out.println("if.else"+ifcnt+":");
			blocks.add("if.else"+ifcnt);
			String elsebody = emitExprIR(cname, cond.elsebody);
			out.println("\t%" + (++varCount) + " = bitcast " + elsebody + " to " + typeId(cond.type));
			String elsebody1 = "%"+varCount;

			String elsebodylabel = blocks.get(blocks.size()-1);
			elsebody = elsebody.split(" ")[1];
			out.println("\tbr label %if.end"+ifcnt);
			
			out.println("if.end"+ifcnt+":");
			blocks.add("if.end"+ifcnt);
			out.println("\t%"+(++varCount)+" = phi "+typeId(cond.type)
				+" ["+ifbody1+", %"+ifbodylabel+"], ["+elsebody1+", %"+elsebodylabel+"]");
			return typeId(cond.type)+" %"+varCount;
	}

	public String visit(let let,String cname){
		return "";
	}

	public String visit(dispatch dispatch,String cname){
		return "";
	}

	public String visit(static_dispatch static_dispatch,String cname){
		String caller = emitExprIR(cname, static_dispatch.caller);
		List<String> actuals = new ArrayList<>();
		for (AST.expression actual : static_dispatch.actuals) {
			String a = emitExprIR(cname, actual);
			actuals.add(a);
		}
		ifCount++;
		if(typeId(caller).substring(0, 7).equals("%class.")) out.println("\t%"+(++varCount)+" = icmp eq "+caller+", null");
		else out.println("\t%"+(++varCount)+" = icmp slt " + caller + ", " + caller.split(" ")[1]);
		out.println("\tbr i1 %"+varCount+", label %if.then"+ifCount+", label %if.else"+ifCount);
		
		out.println("if.then"+ifCount+":");
		blocks.add("if.then"+ifCount);
		out.println("\t%"+(++varCount)+" = bitcast [25 x i8]* @.str.voidDispatch to i8*");
		out.println("\t%"+(++varCount)+" = call %class.IO* "+mangleName("IO", "out_string")+"( %class.IO* null, i8* %"+(varCount-1)+")");
		out.println("\tcall void @exit(i32 1)");
		out.println("\tbr label %if.else"+ifCount);
		
		out.println("if.else"+ifCount+":");
		blocks.add("if.else"+ifCount);
		String funcname = mangleName(static_dispatch.typeid, static_dispatch.name);
		String callRev=retType(caller);
		String typeCall;
		if (callRev.equals("i32"))	typeCall="Int";
		else if (callRev.equals("i8*")) typeCall="String"; 
		else typeCall=callRev.substring(7, callRev.length()-1);
		NodeGraph ci2 = nodes.get(typeCall);
		while (!retType(caller).equals(typeId(static_dispatch.typeid))) {
			String par = typeId(ci2.parent);
			par = par.substring(0, par.length()-1);
			String ty = callRev;
			ty = ty.substring(0, ty.length()-1);
			out.println("\t%"+(++varCount)+" = getelementptr inbounds "+ty+", "+ty+"* "+ caller.split(" ")[1]+", i32 0, i32 0");
			caller = par+"* %"+varCount;
			ci2 = nodes.get(ci2.parent);
		}
		String actualsStr = caller;
		for (int i=0; i<actuals.size(); i++)
			actualsStr += ", " + actuals.get(i);
		out.println("\t%"+(++varCount)+" = call "+typeId(static_dispatch.type)+" "+funcname+"("+actualsStr+")");
		return typeId(static_dispatch.type)+" %"+varCount;
	}

	public String visit(typcase typcase,String cname){
		return "";
	}
}