#include "ruby_complex.h"

VALUE ccomplex_real_part(VALUE self) {
    return function_onearg(complex_real_part, self);
}

VALUE ccomplex_imaginary_part(VALUE self) {
    return function_onearg(complex_imaginary_part, self);
}
