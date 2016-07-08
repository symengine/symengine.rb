#include "ruby_number.h"

int cnumber_comp(VALUE self, VALUE operand2)
{
    basic cbasic_operand1;
    basic cbasic_operand2;
    basic_new_stack(cbasic_operand1);
    basic_new_stack(cbasic_operand2);

    basic cbasic_sub;
    basic_new_stack(cbasic_sub);

    sympify(self, cbasic_operand1);
    sympify(operand2, cbasic_operand2);

    if (is_a_Number(cbasic_operand2) == 0) {
        rb_raise(rb_eTypeError, "Expected SymEngine::Number found %s ",
                 rb_obj_classname(operand2));
    }

    basic_sub(cbasic_sub, cbasic_operand1, cbasic_operand2);

    int sign = basic_number_sign(cbasic_sub);

    basic_free_stack(cbasic_operand1);
    basic_free_stack(cbasic_operand2);
    basic_free_stack(cbasic_sub);

    return sign;
}

VALUE cnumber_lt(VALUE self, VALUE operand2)
{
    return cnumber_comp(self, operand2) == -1 ? Qtrue : Qfalse;
}

VALUE cnumber_gt(VALUE self, VALUE operand2)
{
    return cnumber_comp(self, operand2) == 1 ? Qtrue : Qfalse;
}

VALUE cnumber_lt_e(VALUE self, VALUE operand2)
{
    return cnumber_comp(self, operand2) == 1 ? Qfalse : Qtrue;
}

VALUE cnumber_gt_e(VALUE self, VALUE operand2)
{
    return cnumber_comp(self, operand2) == -1 ? Qfalse : Qtrue;
}
