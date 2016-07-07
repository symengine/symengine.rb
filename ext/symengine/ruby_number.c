#include "ruby_number.h"

int cnumber_comp(VALUE self, VALUE operand2)
{
    basic_struct *this;

    basic cbasic_operand2;
    basic_new_stack(cbasic_operand2);

    Data_Get_Struct(self, basic_struct, this);
    sympify(operand2, cbasic_operand2);

    basic_sub(operand2, this, operand2);

    int sign = basic_number_sign(operand2);
    basic_free_stack(cbasic_operand2);

    return sign;
}

VALUE cnumber_lt(VALUE self, VALUE operand2)
{
    return cnumber_comp(self, operand2) == -1 ? Qtrue : Qfalse;
}

VALUE cbasic_gt(VALUE self, VALUE operand2)
{
    return cnumber_comp(self, operand2) == 1 ? Qtrue : Qfalse;
}

VALUE cbasic_lt_e(VALUE self, VALUE operand2)
{
    return cnumber_comp(self, operand2) == 1 ? Qfalse : Qtrue;
}

VALUE cbasic_gt_e(VALUE self, VALUE operand2)
{
    return cnumber_comp(self, operand2) == -1 ? Qfalse : Qtrue;
}
