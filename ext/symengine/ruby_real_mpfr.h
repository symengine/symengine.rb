#ifndef RUBY_REAL_MPFR_H_
#define RUBY_REAL_MPFR_H_

#include <ruby.h>
#include <symengine/cwrapper.h>

#include "symengine.h"
#include "symengine_utils.h"

VALUE crealmpfr_init(VALUE self, VALUE num_value);

#endif //RUBY_REAL_MPFR_H_
