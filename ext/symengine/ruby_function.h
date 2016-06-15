#ifndef RUBY_FUNCTION_H_
#define RUBY_FUNCTION_H_

#include <ruby.h>
#include <symengine/cwrapper.h>

#include "symengine.h"
#include "symengine_utils.h"

VALUE cfunction_abs(VALUE self, VALUE operand1);
VALUE cfunction_sin(VALUE self, VALUE operand1);
VALUE cfunction_cos(VALUE self, VALUE operand1);
VALUE cfunction_tan(VALUE self, VALUE operand1);
VALUE cfunction_csc(VALUE self, VALUE operand1);
VALUE cfunction_cot(VALUE self, VALUE operand1);
VALUE cfunction_sec(VALUE self, VALUE operand1);
VALUE cfunction_asin(VALUE self, VALUE operand1);
VALUE cfunction_acos(VALUE self, VALUE operand1);
VALUE cfunction_atan(VALUE self, VALUE operand1);
VALUE cfunction_acsc(VALUE self, VALUE operand1);
VALUE cfunction_acot(VALUE self, VALUE operand1);
VALUE cfunction_asec(VALUE self, VALUE operand1);
VALUE cfunction_sinh(VALUE self, VALUE operand1);
VALUE cfunction_cosh(VALUE self, VALUE operand1);
VALUE cfunction_tanh(VALUE self, VALUE operand1);
VALUE cfunction_csch(VALUE self, VALUE operand1);
VALUE cfunction_coth(VALUE self, VALUE operand1);
VALUE cfunction_sech(VALUE self, VALUE operand1);
VALUE cfunction_asinh(VALUE self, VALUE operand1);
VALUE cfunction_acosh(VALUE self, VALUE operand1);
VALUE cfunction_atanh(VALUE self, VALUE operand1);
VALUE cfunction_acsch(VALUE self, VALUE operand1);
VALUE cfunction_acoth(VALUE self, VALUE operand1);
VALUE cfunction_asech(VALUE self, VALUE operand1);
VALUE cfunction_lambertw(VALUE self, VALUE operand1);
VALUE cfunction_dirichlet_eta(VALUE self, VALUE operand1);
VALUE cfunction_zeta(VALUE self, VALUE operand1);
VALUE cfunction_gamma(VALUE self, VALUE operand1);

VALUE cfunction_functionsymbol_init(VALUE self, VALUE args);

#endif // RUBY_FUNCTION_H_
