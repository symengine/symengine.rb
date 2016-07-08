#ifndef RUBY_COMPLEX_MPC_H_
#define RUBY_COMPLEX_MPC_H_

#include <ruby.h>
#include <symengine/cwrapper.h>

#include "symengine.h"
#include "symengine_utils.h"

#ifdef HAVE_SYMENGINE_MPC
VALUE ccomplex_mpc_real_part(VALUE self);
VALUE ccomplex_mpc_imaginary_part(VALUE self);
#endif // HAVE_SYMENGINE_MPC

#endif // RUBY_COMPLEX_MPC_H_
