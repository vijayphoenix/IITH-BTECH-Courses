package cool;
import cool.AST.*;
import java.io.PrintWriter;

public class Codegen{

	public Codegen(program program, PrintWriter out){
		Visitor visitor = new Visitor(out);
		visitor.createAdjacencyList(program.classes);
		visitor.emitClassDecl(program.classes);
		visitor.emitFunctions(program.classes);
	}
}
