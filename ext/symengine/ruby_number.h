#ifndef RUBY_NUMBER_H_
#define RUBY_NUMBER_H_

#include <ruby.h>
#include <symengine/cwrapper.h>

#include "symengine_utils.h"

int cnumber_comp(VALUE self, VALUE operand2);

VALUE cnumber_lt(VALUE self, VALUE operand2);

VALUE cnumber_gt(VALUE self, VALUE operand2);

VALUE cnumber_lt_e(VALUE self, VALUE operand2);

VALUE cnumber_gt_e(VALUE self, VALUE operand2);

#endif // RUBY_NUMBER_H_
