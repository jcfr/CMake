/*============================================================================
  CMake - Cross Platform Makefile Generator
  Copyright 2000-2009 Kitware, Inc., Insight Software Consortium

  Distributed under the OSI-approved BSD License (the "License");
  see accompanying file Copyright.txt for details.

  This software is distributed WITHOUT ANY WARRANTY; without even the
  implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
  See the License for more information.
============================================================================*/
#ifndef cmNinjaExecutableTargetGenerator_h
#define cmNinjaExecutableTargetGenerator_h

#include "cmNinjaTargetGenerator.h"

class cmNinjaExecutableTargetGenerator: public cmNinjaTargetGenerator
{
public:
  cmNinjaExecutableTargetGenerator(cmTarget* target);

  /* the main entry point for this class. Writes the Makefiles associated
     with this target */
  virtual void WriteRuleFiles();
  
protected:
  virtual void WriteExecutableRule(bool relink);
  void CreateAppBundle(std::string& targetName, std::string& outpath);
};

#endif
