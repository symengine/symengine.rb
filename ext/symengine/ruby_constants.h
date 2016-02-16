#ifndef RUBY_CONSTANTS_H_
#define RUBY_CONSTATNS_H_

#include <ruby.h>
#include <symengine/cwrapper.h>

#include "symengine_macros.h"

void cbasic_free_ptr(void *ptr);

VALUE cconstants_const(void (*cwfunc_ptr)(basic_struct*));

VALUE cconstants_pi();

VALUE cconstants_e();

VALUE cconstants_euler_gamma();

#endif //RUBY_CONSTANTS_H_
