#include "ruby_constant.h"

VALUE cconstant_const(void (*cwfunc_ptr)(basic_struct*)) {
    basic_struct *cresult;
    VALUE result;

    cresult = basic_new_heap();
    cwfunc_ptr(cresult);
    
    result = Data_Wrap_Struct(c_constant, NULL, cbasic_free_heap, cresult);
    return result;
}

VALUE cconstant_pi() {
    return cconstant_const(basic_const_pi);
}

VALUE cconstant_e() {
    return cconstant_const(basic_const_E);
}

VALUE cconstant_euler_gamma() {
    return cconstant_const(basic_const_EulerGamma);
}

VALUE cconstant_i() {
    return cconstant_const(basic_const_I);
}
