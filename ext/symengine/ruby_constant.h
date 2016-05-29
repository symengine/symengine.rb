#ifndef RUBY_CONSTANTS_H_
#define RUBY_CONSTANTS_H_

#include <ruby.h>
#include <symengine/cwrapper.h>

#include "symengine.h"
#include "symengine_utils.h"

VALUE cconstant_const(void (*cwfunc_ptr)(basic_struct*), VALUE klass);

VALUE cconstant_pi();

VALUE cconstant_e();

VALUE cconstant_euler_gamma();

VALUE cconstant_i();

#endif //RUBY_CONSTANTS_H_
