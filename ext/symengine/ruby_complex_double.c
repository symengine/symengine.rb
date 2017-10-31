#include "ruby_complex_double.h"

VALUE ccomplex_double_real_part(VALUE self)
{
    return function_onearg(complex_base_real_part, self);
}

VALUE ccomplex_double_imaginary_part(VALUE self)
{
    return function_onearg(complex_base_imaginary_part, self);
}
