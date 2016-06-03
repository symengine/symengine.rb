#include "ruby_real_mpfr.h"

VALUE crealmpfr_init(VALUE self, VALUE num_value, VALUE prec_value) {
    basic_struct *cresult;
    double d;
    char *c;
    int prec = NUM2INT(prec_value);

    Data_Get_Struct(self, basic_struct, cresult);

    switch( TYPE(num_value) ) {
        case T_FLOAT:
            d = RFLOAT_VALUE(num_value);     
            real_mpfr_set_d(cresult, d, prec);
            break;
        case T_STRING:
            c = RSTRING_PTR(num_value);
            real_mpfr_set_str(cresult, c, prec);
            break;
        default:
            rb_raise(rb_eTypeError, "Invalid Type: Float, BigDecimal or String required.");
            break;
    }

    return self;
}

