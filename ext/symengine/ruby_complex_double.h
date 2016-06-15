#ifndef RUBY_COMPLEX_DOUBLE_H_
#define RUBY_COMPLEX_DOUBLE_H_

#include <ruby.h>
#include <symengine/cwrapper.h>

#include "symengine.h"
#include "symengine_utils.h"

VALUE ccomplex_double_real_part(VALUE self);
VALUE ccomplex_double_imaginary_part(VALUE self);

#endif // RUBY_COMPLEX_DOUBLE_H_
