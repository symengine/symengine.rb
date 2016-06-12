#ifndef RUBY_REAL_MPFR_H_
#define RUBY_REAL_MPFR_H_

#include <ruby.h>
#include <symengine/cwrapper.h>

#include "symengine.h"
#include "symengine_utils.h"

#ifdef HAVE_SYMENGINE_MPFR
VALUE crealmpfr_init(VALUE self, VALUE num_value, VALUE prec_value);
VALUE crealmpfr_to_float(VALUE self);
#endif //HAVE_SYMENGINE_MPFR

#endif //RUBY_REAL_MPFR_H_
