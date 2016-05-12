#ifndef RUBY_NTHEORY_H_
#define RUBY_NTHEORY_H_

#include <ruby.h>
#include <symengine/cwrapper.h>

#include "ruby_basic.h"
#include "symengine.h"
#include "symengine_macros.h"

VALUE cfunction_onearg(void (*cwfunc_ptr)(basic_struct*, const basic_struct*), VALUE operand1);
VALUE cfunction_twoarg(void (*cwfunc_ptr)(basic_struct*, const basic_struct*, const basic_struct*), VALUE operand1, VALUE operand2);

VALUE cfunction_gcd(VALUE self, VALUE operand1, VALUE operand2);
VALUE cfunction_lcm(VALUE self, VALUE operand1, VALUE operand2);
VALUE cfunction_nextprime(VALUE self, VALUE operand1);
VALUE cfunction_mod(VALUE self, VALUE operand1, VALUE operand2);
VALUE cfunction_quotient(VALUE self, VALUE operand1, VALUE operand2);
//VALUE cfunction_fibonacci(VALUE self, VALUE operand1);
//VALUE cfunction_lucas(VALUE self, VALUE operand1);
//VALUE cfunction_binomial(VALUE self, VALUE operand1, VALUE operand2);

#endif //RUBY_NTHEORY_H_
