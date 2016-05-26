#include "ruby_complex.h"

VALUE ccomplex_real_part(VALUE self) {
    basic_struct *c_result = basic_new_heap();

    basic cbasic_operand;
    basic_new_stack(cbasic_operand);

    VALUE result;

    sympify(self, cbasic_operand);
    complex_real_part(c_result, cbasic_operand);

    result = Data_Wrap_Struct(Klass_of_Basic(c_result), NULL, cbasic_free_heap, c_result);
    
    basic_free_stack(cbasic_operand);

    return result;
}

VALUE ccomplex_imaginary_part(VALUE self) {
    basic_struct *c_result = basic_new_heap();

    basic cbasic_operand;
    basic_new_stack(cbasic_operand);

    VALUE result;

    sympify(self, cbasic_operand);
    complex_imaginary_part(c_result, cbasic_operand);

    result = Data_Wrap_Struct(Klass_of_Basic(c_result), NULL, cbasic_free_heap, c_result);
    
    basic_free_stack(cbasic_operand);

    return result;
}
