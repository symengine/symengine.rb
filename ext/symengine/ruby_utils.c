#include "ruby_utils.h"

VALUE cutils_sympify(VALUE self, VALUE operand)
{

    VALUE result;

    basic_struct *cbasic_operand;
    cbasic_operand = basic_new_heap();

    sympify(operand, cbasic_operand);
    result = Data_Wrap_Struct(Klass_of_Basic(cbasic_operand), NULL,
                              cbasic_free_heap, cbasic_operand);

    return result;
}

VALUE cutils_evalf(VALUE self, VALUE operand, VALUE prec, VALUE real)
{
    VALUE result = Qnil;

    basic_struct *cresult;
    cresult = basic_new_heap();

    sympify(operand, cresult);
    int error_code
        = basic_evalf(cresult, cresult, NUM2INT(prec), (real == Qtrue ? 1 : 0));

    if (error_code == 0) {
        result = Data_Wrap_Struct(Klass_of_Basic(cresult), NULL,
                                  cbasic_free_heap, cresult);
    } else {
        raise_exception(error_code);
    }
    return result;
}
