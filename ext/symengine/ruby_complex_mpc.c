#include "ruby_complex_mpc.h"

#ifdef HAVE_SYMENGINE_MPC
VALUE ccomplex_mpc_real_part(VALUE self)
{
    return function_onearg(complex_mpc_real_part, self);
}

VALUE ccomplex_mpc_imaginary_part(VALUE self)
{
    return function_onearg(complex_mpc_imaginary_part, self);
}
#endif // HAVE_SYMENGINE_MPC
