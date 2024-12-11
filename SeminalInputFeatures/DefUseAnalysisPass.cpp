#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include <map>
#include <set>
#include <vector>

using namespace llvm;

namespace {
    struct VariableAnalysisPass : public FunctionPass {
        static char ID;
        VariableAnalysisPass() : FunctionPass(ID) {}

        // Structure to hold influential variable information
        struct VarInfo {
            std::string name;
            std::vector<Instruction*> uses;
        };

        bool runOnFunction(Function &F) override {
            std::map<std::string, VarInfo> varMap;
            std::set<Value*> initializedVars;

            // Traverse the function to collect influential variables and check for uninitialized variables
            for (BasicBlock &BB : F) {
                for (Instruction &I : BB) {
                    if (auto *alloca = dyn_cast<AllocaInst>(&I)) {
                        // Track variable allocations
                        std::string varName = alloca->getName().str();
                        varMap[varName] = VarInfo{varName, {}};
                    }
                    if (auto *store = dyn_cast<StoreInst>(&I)) {
                        if (auto *ptr = store->getPointerOperand()) {
                            if (auto *var = dyn_cast<AllocaInst>(ptr)) {
                                // Mark variable as initialized
                                initializedVars.insert(var);
                            }
                        }
                    }
                    if (auto *load = dyn_cast<LoadInst>(&I)) {
                        if (auto *ptr = load->getPointerOperand()) {
                            if (auto *var = dyn_cast<AllocaInst>(ptr)) {
                                // Collect uses of the variable
                                varMap[var->getName().str()].uses.push_back(&I);
                            }
                        }
                    }
                }
            }

            // Check for uninitialized variables
            for (const auto &pair : varMap) {
                const std::string &varName = pair.first;
                if (initializedVars.find(F.getValueSymbolTable()->lookup(varName)) == initializedVars.end()) {
                    errs() << "Warning: Variable " << varName << " may be uninitialized.\n";
                }
            }

            // Output the results
            errs() << "Influential Variables in Function: " << F.getName() << "\n";
            for (const auto &pair : varMap) {
                const VarInfo &info = pair.second;
                errs() << "Variable: " << info.name << "\n";
                errs() << "  Uses:\n";
                for (Instruction *use : info.uses) {
                    errs() << "    - " << *use << "\n";
                }
            }

            return false; // No modifications made to the function
        }
    };
}

char VariableAnalysisPass::ID = 0;
static RegisterPass<VariableAnalysisPass> X("var-analysis", "Variable Analysis Pass", false, false);
