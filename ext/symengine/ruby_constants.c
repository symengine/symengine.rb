#include "ruby_constants.h"

VALUE cconstants_const(void (*cwfunc_ptr)(basic_struct*)){
    basic_struct *cresult;
    VALUE result;

    cresult = basic_new_heap();
    cwfunc_ptr(cresult);
    
    result = Data_Wrap_Struct(c_constants, NULL , cbasic_free_heap, cresult);
    return result;
}

VALUE cconstants_pi(){
    return cconstants_const(basic_const_pi);
}

VALUE cconstants_e(){
    return cconstants_const(basic_const_E);
}

VALUE cconstants_euler_gamma(){
    return cconstants_const(basic_const_EulerGamma);
}
