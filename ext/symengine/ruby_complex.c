#include "ruby_complex.h"

VALUE ccomplex_init(VALUE self, VALUE comp_value) {
    basic_struct *this;
    basic real_basic, imag_basic;

    basic_new_stack(real_basic);
    basic_new_stack(imag_basic);

    Data_Get_Struct(self, basic_struct, this);

    VALUE real, imag;
    real = rb_funcall(comp_value, rb_intern("real"), 0, NULL);
    imag = rb_funcall(comp_value, rb_intern("imaginary"), 0, NULL);

    crational_init(real_basic, real);
    crational_init(imag_basic, imag);

    complex_set(this, real_basic, imag_basic);
    basic_free_stack(real_basic);
    basic_free_stack(imag_basic);
    return self;
}
