#include "ruby_function.h"


VALUE cfunction_onearg(void (*cwfunc_ptr)(basic_struct*, const basic_struct*), VALUE operand1) {
    basic_struct *cresult;
    VALUE result;

    basic cbasic_operand1;
    basic_new_stack(cbasic_operand1);
    sympify(operand1, cbasic_operand1);

    cresult = basic_new_heap();
    cwfunc_ptr(cresult, cbasic_operand1);
    result = Data_Wrap_Struct(Klass_of_Basic(cresult), NULL , cbasic_free_heap, cresult);
    basic_free_stack(cbasic_operand1);

    return result;
}

#define IMPLEMENT_ONE_ARG_FUNC(func) \
VALUE cfunction_ ## func(VALUE self, VALUE operand1) { \
    return cfunction_func(basic_ ## func, operand1); \
}

IMPLEMENT_ONE_ARG_FUNC(abs);
IMPLEMENT_ONE_ARG_FUNC(sin);
IMPLEMENT_ONE_ARG_FUNC(cos);
IMPLEMENT_ONE_ARG_FUNC(tan);
IMPLEMENT_ONE_ARG_FUNC(csc);
IMPLEMENT_ONE_ARG_FUNC(sec);
IMPLEMENT_ONE_ARG_FUNC(cot);
IMPLEMENT_ONE_ARG_FUNC(asin);
IMPLEMENT_ONE_ARG_FUNC(acos);
IMPLEMENT_ONE_ARG_FUNC(asec);
IMPLEMENT_ONE_ARG_FUNC(acsc);
IMPLEMENT_ONE_ARG_FUNC(atan);
IMPLEMENT_ONE_ARG_FUNC(acot);
IMPLEMENT_ONE_ARG_FUNC(sinh);
IMPLEMENT_ONE_ARG_FUNC(cosh);
IMPLEMENT_ONE_ARG_FUNC(tanh);
IMPLEMENT_ONE_ARG_FUNC(csch);
IMPLEMENT_ONE_ARG_FUNC(sech);
IMPLEMENT_ONE_ARG_FUNC(coth);
IMPLEMENT_ONE_ARG_FUNC(asinh);
IMPLEMENT_ONE_ARG_FUNC(acosh);
IMPLEMENT_ONE_ARG_FUNC(asech);
IMPLEMENT_ONE_ARG_FUNC(acsch);
IMPLEMENT_ONE_ARG_FUNC(atanh);
IMPLEMENT_ONE_ARG_FUNC(acoth);
IMPLEMENT_ONE_ARG_FUNC(lambertw);
IMPLEMENT_ONE_ARG_FUNC(dirichlet_eta);
IMPLEMENT_ONE_ARG_FUNC(gamma);

