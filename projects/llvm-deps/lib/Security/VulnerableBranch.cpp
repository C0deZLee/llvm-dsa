//===- SourceSinkAnalysis.cpp ---------------------------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// An analysis for identifying vulnerable branches.
//
//===----------------------------------------------------------------------===//

#include "VulnerableBranch.h"
#include "Infoflow.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/Support/raw_ostream.h"
#include <fstream>

// For __cxa_demangle (demangling c++ function names)
// Requires libstdc++
#include <cxxabi.h>

namespace deps {

static RegisterPass<VulnerableBranch>
X("vulnerablebranch", "An analysis for identifying vulnerable branches");

char VulnerableBranch::ID;

/** Taint a Value whose name matches s */
void 
VulnerableBranch::taintStr (std::string kind, std::string match) {
  for (DenseMap<const Value *, const ConsElem *>::const_iterator entry = ifa->summarySourceValueConstraintMap.begin(),
    end = ifa->summarySourceValueConstraintMap.end(); entry != end; ++entry) {
    const Value& value = *(entry->first);

    // errs() << "Visiting ";
    // value.dump();

    std::string s;
    if (value.hasName() && value.getName() == match) {
      s = value.getName();
      const std::set<const AbstractLoc *> & locs = ifa->locsForValue(value);
      for (std::set<const AbstractLoc *>::const_iterator loc = locs.begin(),
             end = locs.end(); loc != end; ++loc) {
        DenseMap<const AbstractLoc *, const ConsElem *>::iterator curElem = ifa->locConstraintMap.find(*loc);
        if (curElem != ifa->locConstraintMap.end()) {
           ifa->kit->addConstraint(kind, ifa->kit->highConstant(), *(curElem->second));
        }
      }
    }
    else {
      llvm::raw_string_ostream* ss = new llvm::raw_string_ostream(s);
      *ss << value; // dump value info to ss
      ss->str(); // flush stream to s
      if (s.find(match) == 0) // test if the value's content starts with match
        ifa->setTainted(kind, value);
    } 
  }
}

bool 
VulnerableBranch::runOnModule(Module &M) {
  ifa = &getAnalysis<Infoflow>();
  if (!ifa) { errs() << "No instance\n"; return false;}
   
  errs() << "Not implemented yet\n";

  /** copied from taint analysis 
  std::ifstream infile("taint.txt"); // read tainted values from txt file
  std::string line;
  while (std::getline(infile, line)) {
    taintStr ("taint", line);
  }

  std::set<std::string> kinds;
  kinds.insert("taint");

  errs() << "Least solution with explicit contraints\n";
  InfoflowSolution* soln = ifa->leastSolution(kinds, false, true);
  soln->allTainted();

  errs() << "Least solution with implicit contraints\n";
  soln = ifa->leastSolution(kinds, true, true);
  soln->allTainted(); */
  return false;
}

}
