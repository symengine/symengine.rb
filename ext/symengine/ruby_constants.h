#ifndef RUBY_CONSTANTS_H_
#define RUBY_CONSTANTS_H_

#include <ruby.h>
#include <symengine/cwrapper.h>

#include "ruby_basic.h"
#include "symengine.h"
#include "symengine_macros.h"

VALUE cconstants_const(void (*cwfunc_ptr)(basic_struct*));

VALUE cconstants_pi();

VALUE cconstants_e();

VALUE cconstants_euler_gamma();

#endif //RUBY_CONSTANTS_H_
