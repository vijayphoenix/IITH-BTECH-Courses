#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Analysis/ScalarEvolutionExpander.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/InstIterator.h"
#include <unordered_set>

// #define DEBUG_TYPE "Footprint"
#define lli long long int 

using namespace llvm;

static cl::opt<std::string> argName("var-name", cl::desc("Variable name"), cl::value_desc("Variable name"));

namespace {
struct FootPrint : public FunctionPass {
    static char ID;
    FootPrint() : FunctionPass(ID) {}

    struct varInfo {
		std::unordered_set<int> ftprint;
		DIScope* scope;
		Value *value;
		int scopeBegin;
		int scopeEnd;
		lli reads = 0;
		lli writes = 0;
		varInfo(DIScope* s, Value *v, int sB = 0, int sE = 0){
			scope = s;
			value = v;
			scopeBegin = sB;
			scopeEnd = sE;
		}
    };

    void getAnalysisUsage(AnalysisUsage &AU) const override {
		AU.addRequired<AAResultsWrapperPass>();
		AU.setPreservesAll();
    }
	
    bool runOnFunction(Function &F) override {
		auto *AA = &getAnalysis<AAResultsWrapperPass>().getAAResults();

		std::vector<varInfo> info;
		for (auto I = inst_begin(F), E = inst_end(F); I != E; ++I) {
			if(isa<DbgDeclareInst>(*I)){
				auto a = cast<DIVariable>(cast<MetadataAsValue>(I->getOperand(1))->getMetadata());
				if(argName == a -> getName()){
					Metadata *Meta = cast<MetadataAsValue>(I->getOperand(0))->getMetadata();
					if (isa<ValueAsMetadata>(Meta))
						info.push_back(varInfo(a->getScope(), cast <ValueAsMetadata>(Meta)->getValue(), a -> getLine()));
				}
			}
		}
		for(inst_iterator I = inst_begin(F), E = inst_end(F); I != E; I++){
			if(!I->getDebugLoc())continue;
			int line = I->getDebugLoc()->getLine();
			
			for(auto O = I->op_begin(), OE = I->op_end(); O!=OE;O++) {
				for(uint i = 0; i < info.size(); i++) {
					if(int(AA->alias(info[i].value, *O)) >= 1) {
						if(isa<LoadInst>(*I)) info[i].reads++;
						if(isa<StoreInst>(*I)){
							if(O - I->op_begin() == 1) info[i].writes++;			
							else info[i].reads++;
						}
						if(info[i].ftprint.find(line) == info[i].ftprint.end()){
							info[i].ftprint.insert(line);
							if(info[i].scopeEnd < line) info[i].scopeEnd = line;
						}
					}
				}
			}
			for (size_t i = 0; i < info.size(); i++){
				DIScope *scope = I->getDebugLoc()->getScope();
				while(scope!= nullptr and !isa<DIFile>(scope)){
					if(scope == info[i].scope){
						if(info[i].scopeEnd < line) info[i].scopeEnd = line;
						break;
					}
					scope = scope -> getScope();
				}
			}
		}

        errs() << "Clang version: 9.0.0\n";
        errs() << "LLVM Source Repository: https://github.com/llvm/llvm-project.git\n";
        errs() << "LLVM Commit Hash: 0399d5a9682b3cef71c653373e38890c63c4c365\n";
        errs() << "Clang Source Repository: https://github.com/llvm-mirror/clang.git\n";
        errs() << "LLVM Commit Hash: 0399d5a9682b3cef71c653373e38890c63c4c365\n";
        errs() << "Target: x86_64-unknown-linux-gnu\n";

		for(uint i = 0; i < info.size(); i++) {
			errs() << "Variable Name: " << argName << "\n";
			errs() << "Variable Scope: " <<info[i].scopeBegin <<":"<<info[i].scopeEnd<<"\n"; 
			errs() << "Footprint: ";
			std::vector<int> v;
			for(auto s: info[i].ftprint) v.push_back(s);
			std::sort(v.begin(),v.end());
			for(uint j = 0; j < v.size(); j++) {
				errs() << v[j];
				if(j != v.size()-1) errs() << ", ";
			}
			errs() <<"\n";
			errs() << "Number of Reads: " << info[i].reads << "\nNumber of Writes: " << info[i].writes << "\n";
		}
        return false;
    }
};
} // namespace

char FootPrint::ID = 'a';
static RegisterPass<FootPrint> X("ftprint", "Print footprint of a given variable");
