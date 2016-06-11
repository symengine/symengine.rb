#ifndef SYMENGINE_UTILS_H_
#define SYMENGINE_UTILS_H_

#include "ruby.h"
#include "ruby_basic.h"
#include "symengine/cwrapper.h"

VALUE rb_cBigDecimal;

//Returns the pointer wrapped inside the Ruby VALUE
void sympify(VALUE operand2, basic_struct *cbasic_operand2);
//Returns the pointer wrapped inside the Ruby Fixnum or Bignum 
void get_symintfromval(VALUE operand2, basic_struct *cbasic_operand2);
//Returns the Ruby class of the corresponding basic_struct pointer
VALUE Klass_of_Basic(const basic_struct *basic_ptr);
//Returns the result from the function pointed by cwfunc_ptr: for one argument functions
VALUE function_onearg(void (*cwfunc_ptr)(basic_struct*, const basic_struct*), VALUE operand1);
//Returns the result from the function pointed by cwfunc_ptr: for two argument functions
VALUE function_twoarg(void (*cwfunc_ptr)(basic_struct*, const basic_struct*, const basic_struct*),
                      VALUE operand1, VALUE operand2);

#endif //SYMENGINE_UTILS_H_
