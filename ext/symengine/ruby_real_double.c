#include "ruby_real_double.h"


VALUE crealdouble_to_float(VALUE self)
{
    VALUE result;

    basic cbasic_operand1;
    basic_new_stack(cbasic_operand1);
    sympify(self, cbasic_operand1);

    result = rb_float_new(real_double_get_d(cbasic_operand1));
    basic_free_stack(cbasic_operand1);

    return result;
}
