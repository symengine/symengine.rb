#include "ruby_constant.h"

VALUE cconstant_const(void (*cwfunc_ptr)(basic_struct *), VALUE klass)
{
    basic_struct *cresult;
    VALUE result;

    cresult = basic_new_heap();
    cwfunc_ptr(cresult);

    result = Data_Wrap_Struct(klass, NULL, cbasic_free_heap, cresult);
    return result;
}

VALUE cconstant_pi()
{
    return cconstant_const(basic_const_pi, c_constant);
}

VALUE cconstant_e()
{
    return cconstant_const(basic_const_E, c_constant);
}

VALUE cconstant_euler_gamma()
{
    return cconstant_const(basic_const_EulerGamma, c_constant);
}

VALUE cconstant_i()
{
    return cconstant_const(basic_const_I, c_complex);
}

VALUE cconstant_have_mpfr()
{
#ifdef HAVE_SYMENGINE_MPFR
    return Qtrue;
#else
    return Qfalse;
#endif // HAVE_SYMENGINE_MPFR
}

VALUE cconstant_have_mpc()
{
#ifdef HAVE_SYMENGINE_MPC
    return Qtrue;
#else
    return Qfalse;
#endif // HAVE_SYMENGINE_MPC
}
