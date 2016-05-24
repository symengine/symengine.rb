#include "ruby_utils.h"

VALUE cutils_sympify(VALUE self, VALUE operand) {
    
    VALUE result;
    basic cbasic_operand;
    basic_new_stack(cbasic_operand);
    
    sympify(operand, cbasic_operand);
    result = Data_Wrap_Struct(Klass_of_Basic(cbasic_operand), NULL , cbasic_free_heap, cbasic_operand);

    return operand;

}

