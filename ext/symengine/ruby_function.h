#ifndef RUBY_FUNCTION_H_
#define RUBY_FUNCTION_H_

#include <ruby.h>
#include <symengine/cwrapper.h>

#include "ruby_basic.h"
#include "symengine.h"
#include "symengine_macros.h"

VALUE cfunction_func(void (*cwfunc_ptr)(basic_struct*, const basic_struct*), VALUE operand1);

VALUE cfunction_abs(VALUE self, VALUE operand1);
VALUE cfunction_sin(VALUE self, VALUE operand1);
VALUE cfunction_cos(VALUE self, VALUE operand1);
VALUE cfunction_tan(VALUE self, VALUE operand1);

#endif //RUBY_FUNCTION_H_
