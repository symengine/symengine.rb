#include "ruby_real_mpfr.h"

VALUE crealmpfr_init(VALUE self, VALUE num_value, VALUE prec_value)
{
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
        case T_DATA:
            c = rb_obj_classname(num_value);
            if(strcmp(c, "BigDecimal") == 0){
                c = RSTRING_PTR( rb_funcall(num_value, rb_intern("to_s"), 1, rb_str_new2("F")) );
                real_mpfr_set_str(cresult, c, prec);
                break;
            }
        default:
            rb_raise(rb_eTypeError, "Invalid Type: Float, BigDecimal or String required.");
            break;
    }

    return self;
}

VALUE crealmpfr_to_float(VALUE self)
{
    // TODO: Make the following method work
    //VALUE result;
    //basic cbasic_operand1;
    //basic_new_stack(cbasic_operand1);
    //sympify(self, cbasic_operand1);
    //result = rb_float_new(real_mpfr_get_d(cbasic_operand1));

    return rb_funcall(( rb_funcall( self, rb_intern("to_s"), 1, rb_str_new2("F")) ),
                       rb_intern("to_f"), 0, NULL);
}

