#ifndef RUBY_UTILS_H_
#define RUBY_UTILS_H_

#include "symengine_utils.h"

// Returns the Ruby Value after going through sympify
VALUE cutils_sympify(VALUE self, VALUE operand);
VALUE cutils_evalf(VALUE self, VALUE operand, VALUE prec, VALUE real);
#endif // RUBY_UTILS_H_
