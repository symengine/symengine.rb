#include "ruby_function.h"


VALUE cfunction_func(void (*cwfunc_ptr)(basic_struct*, const basic_struct*), VALUE operand1) {
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


VALUE cfunction_abs(VALUE self, VALUE operand1) {  
    return cfunction_func(basic_abs, operand1);
}

VALUE cfunction_sin(VALUE self, VALUE operand1) {  
    return cfunction_func(basic_sin, operand1);
}

VALUE cfunction_cos(VALUE self, VALUE operand1) {  
    return cfunction_func(basic_cos, operand1);
}

VALUE cfunction_tan(VALUE self, VALUE operand1) {  
    return cfunction_func(basic_tan, operand1);
}
