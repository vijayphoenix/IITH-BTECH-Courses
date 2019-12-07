#include "llvm/Analysis/LoopInfo.h"
#include "llvm/IR/NoFolder.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/Utils.h"

using namespace llvm;

namespace {
	struct loopReversal : public FunctionPass {
		static char ID;
		loopReversal() : FunctionPass(ID) {}

		// A struct for storing all the important information needed for loop transformation
		struct loopInfo {
			int initValue;    // Initial value of Induction Variable
			int updateValue;  // Step increment value
			int endValue;	  // End value of Induction Variable
			CmpInst *cmpInst; // Comp Instruction of the loop
			BasicBlock *body;	
			PHINode *phiNode;
			Instruction *updateInst;
    	};
		
		
		void getAnalysisUsage (AnalysisUsage &AU) const {
			AU.addRequired<LoopInfoWrapperPass>();
			AU.setPreservesAll();
		}
		
		bool runOnFunction(Function &F) {
			// Run mem2reg pass to generate SSA form
			legacy::FunctionPassManager FPM(F.getParent());
			FPM.add(createPromoteMemoryToRegisterPass());
			FPM.run(F);
			LoopInfo &LI = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
			
			auto loopList = LI.getLoopsInPreorder();

			// Iterate over all the loops in a preorder manner 
			for (Loop *L : loopList) {
				loopInfo *loop_info = new loopInfo;
				loopInfo *new_loop_info = new loopInfo;

				// Gather all the neccessary information
				initLoopInfo(L,loop_info);

				// Update initial, end, increment value of the loop information
				updatedLoopInfo(loop_info, new_loop_info);

				// Generate IR for the reversed loop
				IRBuilder<NoFolder> builder(L->getHeader()->getFirstNonPHI());
				PHINode* newPhi = builder.CreatePHI(Type::getInt32Ty(F.getContext()), 2, "newPhi");
				auto newInitVal = ConstantInt::get(Type::getInt32Ty(F.getContext()),  new_loop_info->initValue);
				newPhi->addIncoming(newInitVal, loop_info->phiNode->getIncomingBlock(0));
				IRBuilder<NoFolder> builder1(L->getLoopLatch()->getFirstNonPHI());
				Value *pResult, *Result, *newUpdateInst;
				pResult = builder.CreateSub(newInitVal, newPhi, "newVar");
				auto newEndVal = ConstantInt::get(Type::getInt32Ty(F.getContext()), new_loop_info->endValue);
				Result = builder.CreateAdd(pResult, newEndVal, "newVar");
				newUpdateInst = builder1.CreateSub(newPhi, ConstantInt::get(Type::getInt32Ty(F.getContext()),  new_loop_info->updateValue), "newInst");
				loop_info->cmpInst->setOperand(0, newPhi);
				loop_info->cmpInst->setOperand(1, newEndVal);
				newPhi->addIncoming(newUpdateInst, loop_info->phiNode->getIncomingBlock(1));
				loop_info->phiNode->replaceAllUsesWith(Result);
				loop_info->phiNode->eraseFromParent();
				loop_info->updateInst->eraseFromParent();
			}
			return true; // Transformation pass changes IR, hence return True value
		}

		void initLoopInfo(Loop *L, loopInfo *loop_info){
			for (auto I = L->getLoopLatch()->begin(); I != L->getLoopLatch()->end(); I++) {
				if(I->getOpcode() == Instruction::Add || I->getOpcode() == Instruction::Sub ){
					loop_info->updateInst = &(*I);
					for(auto O = I->op_begin(), OE = I->op_end(); O!=OE;O++){
						if(isa<Constant>(O)) {
							loop_info->updateValue = dyn_cast<ConstantInt>(O)->getSExtValue();
							break;
						}
					}
					break;
				}
			}
			for (auto I = L->getHeader()->begin(); I != L->getHeader()->end(); I++)	{
				if(isa<CmpInst>(I)){
					loop_info -> cmpInst = dyn_cast<CmpInst>(I);
					for(auto O = I->op_begin(), OE = I->op_end(); O!=OE;O++) {
						if(isa<Constant>(O)) loop_info->endValue = dyn_cast<ConstantInt>(O)->getSExtValue();
						else if(isa<PHINode>(O)) {
							loop_info->phiNode = dyn_cast<PHINode>(O);
							Value *v = loop_info->phiNode->getIncomingValue(0);
							loop_info->initValue = dyn_cast<ConstantInt>(v)->getSExtValue();
						}
					}
				}
				else if(isa<BranchInst>(I))	loop_info->body = dyn_cast<BasicBlock>(I->getOperand(2));
			}
		}

		void updatedLoopInfo(loopInfo *loop_info, loopInfo *new_info){
			auto cmpOpName = CmpInst::getPredicateName(loop_info->cmpInst->getPredicate());
			int bound = loop_info->endValue;
			new_info -> endValue = loop_info -> initValue;
			if(cmpOpName == "slt" || cmpOpName == "sle" || cmpOpName == "ule" || cmpOpName == "ult")
				loop_info->cmpInst->setPredicate(CmpInst::Predicate::ICMP_SGE);
			else if(cmpOpName == "sgt" || cmpOpName == "sge"  || cmpOpName == "uge" || cmpOpName == "ugt")
				loop_info->cmpInst->setPredicate(CmpInst::Predicate::ICMP_SLE);
			new_info -> updateValue = loop_info -> updateValue;
			if(loop_info->updateInst->getOpcode() == Instruction::Sub)
				new_info->updateValue  = -loop_info->updateValue;
			if(cmpOpName == "slt" || cmpOpName == "ult") bound--;
			else if(cmpOpName == "sgt"|| cmpOpName == "ugt") bound++;
			new_info -> initValue = bound - (bound - loop_info->initValue)%new_info->updateValue;
		}
	};
}

char loopReversal::ID = 'a';
static RegisterPass<loopReversal> X("loop-reversal", "Reverse the loop");
