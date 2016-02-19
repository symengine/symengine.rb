#ifndef SYMENGINE_H_
#define SYMENGINE_H_

#include "ruby.h"

//variable name for a module starts with m
VALUE m_symengine;

//variable names for classes begin with c
VALUE c_basic;
VALUE c_symbol;
VALUE c_integer;
VALUE c_rational;
VALUE c_constant;
VALUE c_add;
VALUE c_mul;
VALUE c_pow;

#endif //SYMENGINE_H_
