#include "ruby_real_mpfr.h"

VALUE crealmpfr_init(VALUE self, VALUE num_value, VALUE prec_value) {
    basic_struct *cresult;
    VALUE result;
    double d;
    int prec = NUM2INT(prec_value);
    cresult = basic_new_heap();

    switch( TYPE(num_value) ) {
        case T_FLOAT:
            d = RFLOAT_VALUE(num_value);     
            real_mpfr_set_d(cresult, d, prec);
            break;
        default:
            rb_raise(rb_eTypeError, "Invalid Type: Float, BigDecimal or String required.");
            break;
    }
    result = Data_Wrap_Struct(c_real_mpfr, NULL, cbasic_free_heap, cresult);
    return result;
}

