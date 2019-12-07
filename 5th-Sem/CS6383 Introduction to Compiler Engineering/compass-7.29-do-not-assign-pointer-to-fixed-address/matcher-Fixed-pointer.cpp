// Declares clang::SyntaxOnlyAction.
#include "clang/Frontend/FrontendActions.h"
#include "clang/Tooling/CommonOptionsParser.h"
#include "clang/Tooling/Tooling.h"
// Declares llvm::cl::extrahelp.
#include "llvm/Support/CommandLine.h"

#include "clang/ASTMatchers/ASTMatchers.h"
#include "clang/ASTMatchers/ASTMatchFinder.h"

using namespace clang;
using namespace clang::ast_matchers;
using namespace clang::tooling;
using namespace llvm;

// Apply a custom category to all command-line options so that they are the
// only ones displayed.
static llvm::cl::OptionCategory MyToolCategory("my-tool options");

// CommonOptionsParser declares HelpMessage with a description of the common
// command-line options related to the compilation database and input files.
// It's nice to have this help message in all tools.
static cl::extrahelp CommonHelp(CommonOptionsParser::HelpMessage);

// A help message for this specific tool can be added afterwards.
static cl::extrahelp MoreHelp("\nMore help text...\n");

// =========================================
// MODIFY THIS

DeclarationMatcher PointerDeclarationMatcher =
    varDecl( isExpansionInMainFile()
           , hasType(isAnyPointer())
           , hasInitializer(cStyleCastExpr(hasCastKind(CK_IntegralToPointer), hasSourceExpression(integerLiteral())))
           ).bind("Pointer");

StatementMatcher PointerAssignmentMatcher =
    binaryOperator( isExpansionInMainFile()
                  , isAssignmentOperator()
                  , hasLHS(declRefExpr(to(varDecl(hasType(isAnyPointer())))))
                  , hasRHS(cStyleCastExpr(hasCastKind(CK_IntegralToPointer)))
                  ).bind("Assign");

class PointerPrint : public MatchFinder::MatchCallback
{
public:
    virtual void run(const MatchFinder::MatchResult &Result)
    {
        ASTContext *Context = Result.Context;
        if (const VarDecl *VD = Result.Nodes.getNodeAs<clang::VarDecl>("Pointer"))
        {
            SourceLocation Loc = VD->getBeginLoc();
            FullSourceLoc FullLocation = Context->getFullLoc(Loc);
            llvm::outs() << "Pointer assigned to fixed address at "
                         << FullLocation.getSpellingLineNumber() << ":"
                         << FullLocation.getSpellingColumnNumber() << "\n";
        }
        else if (const BinaryOperator *E = Result.Nodes.getNodeAs<clang::BinaryOperator>("Assign"))
        {
            SourceLocation Loc = E->getBeginLoc();
            FullSourceLoc FullLocation = Context->getFullLoc(Loc);
            llvm::outs() << "Pointer assigned to fixed address at "
                         << FullLocation.getSpellingLineNumber() << ":"
                         << FullLocation.getSpellingColumnNumber() << "\n";
        }
    }
};
// =========================================

int main(int argc, const char **argv)
{
    CommonOptionsParser OptionsParser(argc, argv, MyToolCategory);
    ClangTool Tool(OptionsParser.getCompilations(), OptionsParser.getSourcePathList());

    // =========================================
    // MODIFY THIS
    PointerPrint Printer;
    MatchFinder Finder;
    Finder.addMatcher(PointerDeclarationMatcher, &Printer);
    Finder.addMatcher(PointerAssignmentMatcher , &Printer);
    // =========================================

    return Tool.run(newFrontendActionFactory(&Finder).get());
}