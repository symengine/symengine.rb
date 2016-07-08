#ifndef RUBY_UTILS_H_
#define RUBY_UTILS_H_

#include "symengine_utils.h"

// Returns the Ruby Value after going through sympify
VALUE cutils_sympify(VALUE self, VALUE operand);
// Parses the expression in str and returns a SymEngine::Basic
VALUE cutils_parse(VALUE self, VALUE str);
// Evaluates the numerical value in operand (SymEngine::Basic) to precision
// defined in prec
VALUE cutils_evalf(VALUE self, VALUE operand, VALUE prec, VALUE real);
#endif // RUBY_UTILS_H_
