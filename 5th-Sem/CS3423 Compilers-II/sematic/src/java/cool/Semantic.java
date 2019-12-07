package cool;

public class Semantic{
	private boolean errorFlag = false;
	public void reportError(String filename, int lineNo, String error){
		errorFlag = true;
		System.err.println(filename+":"+lineNo+": "+error);
	}
	public boolean getErrorFlag(){
		return errorFlag;
	}

/*
	Don't change code above this line
*/

		

	public Semantic(AST.program program){
		//Write Semantic analyzer code here
		
		Visitor visitor = new Visitor();

		visitor.checkInheritance(program);
		visitor.createAdjacencyList();
		visitor.detectCycles();

		program.accept(visitor);
		errorFlag = visitor.getErrorFlag();
	}

}