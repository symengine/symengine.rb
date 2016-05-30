#include "symengine_utils.h"
#include "symengine.h"

void sympify(VALUE operand2, basic_struct *cbasic_operand2) {

    basic_struct *temp;
    VALUE new_operand2, num, den;
    VALUE real, imag;
    double f;

    switch(TYPE(operand2)) {
        case T_FIXNUM:
        case T_BIGNUM:
            get_symintfromval(operand2, cbasic_operand2);
            break;

        case T_FLOAT:         
            f = rb_float_value(operand2);
            real_double_set_d(cbasic_operand2, f);
            break;

        case T_RATIONAL:
            num = rb_funcall(operand2, rb_intern("numerator"), 0, NULL);
            den = rb_funcall(operand2, rb_intern("denominator"), 0, NULL);

            basic num_basic, den_basic;
            basic_new_stack(num_basic);
            basic_new_stack(den_basic);

            get_symintfromval(num, num_basic);
            get_symintfromval(den, den_basic);

            rational_set(cbasic_operand2, num_basic, den_basic);

            basic_free_stack(num_basic);
            basic_free_stack(den_basic);
            break;

        case T_COMPLEX:
            real = rb_funcall(operand2, rb_intern("real"), 0, NULL);
            imag = rb_funcall(operand2, rb_intern("imaginary"), 0, NULL);

            basic real_basic;
            basic imag_basic;

            basic_new_stack(real_basic);
            basic_new_stack(imag_basic);

            sympify(real, real_basic);
            sympify(imag, imag_basic);

            basic_const_I(cbasic_operand2);
            basic_mul(cbasic_operand2, cbasic_operand2, imag_basic);
            basic_add(cbasic_operand2, cbasic_operand2, real_basic);

            basic_free_stack(real_basic);
            basic_free_stack(imag_basic);

            break;

        case T_DATA:
            Data_Get_Struct(operand2, basic_struct, temp);
            basic_assign(cbasic_operand2, temp);
            break;
            
    }
}

void get_symintfromval(VALUE operand2, basic_struct *cbasic_operand2)
{
    if ( TYPE(operand2) == T_FIXNUM ){
        int i = NUM2INT( operand2 );
        integer_set_si(cbasic_operand2, i);
    } else if ( TYPE(operand2) == T_BIGNUM ){
        VALUE Rb_Temp_String = rb_funcall(operand2, rb_intern("to_s"), 0, NULL);
        integer_set_str(cbasic_operand2, StringValueCStr(Rb_Temp_String));
    } else {
        rb_raise(rb_eTypeError, "Invalid Type: Fixnum or Bignum required");
    }
}

VALUE Klass_of_Basic(const basic_struct *basic_ptr) {
    switch(basic_get_type(basic_ptr)) {
        case SYMENGINE_SYMBOL:
            return c_symbol;
        case SYMENGINE_INTEGER:
            return c_integer;
        case SYMENGINE_REAL_DOUBLE:
            return c_real_double;
        case SYMENGINE_RATIONAL:
            return c_rational;
        case SYMENGINE_COMPLEX:
            return c_complex;
        case SYMENGINE_COMPLEX_DOUBLE:
            return c_complex_double;
        case SYMENGINE_CONSTANT:
            return c_constant;
        case SYMENGINE_ADD:
            return c_add;
        case SYMENGINE_MUL:
            return c_mul;
        case SYMENGINE_POW:
            return c_pow;
        case SYMENGINE_SIN:
            return c_sin;
        case SYMENGINE_COS:
            return c_cos;
        case SYMENGINE_TAN:
            return c_tan;
        case SYMENGINE_CSC:
            return c_csc;
        case SYMENGINE_SEC:
            return c_sec;
        case SYMENGINE_COT:
            return c_cot;
        case SYMENGINE_ASIN:
            return c_asin;
        case SYMENGINE_ACOS:
            return c_acos;
        case SYMENGINE_ATAN:
            return c_atan;
        case SYMENGINE_ACSC:
            return c_acsc;
        case SYMENGINE_ASEC:
            return c_asec;
        case SYMENGINE_ACOT:
            return c_acot;
        case SYMENGINE_SINH:
            return c_sinh;
        case SYMENGINE_COSH:
            return c_cosh;
        case SYMENGINE_TANH:
            return c_tanh;
        case SYMENGINE_CSCH:
            return c_csch;
        case SYMENGINE_SECH:
            return c_sech;
        case SYMENGINE_COTH:
            return c_coth;
        case SYMENGINE_ASINH:
            return c_asinh;
        case SYMENGINE_ACOSH:
            return c_acosh;
        case SYMENGINE_ATANH:
            return c_atanh;
        case SYMENGINE_ACSCH:
            return c_acsch;
        case SYMENGINE_ASECH:
            return c_asech;
        case SYMENGINE_ACOTH:
            return c_acoth;
        case SYMENGINE_LAMBERTW:
            return c_lambertw;
        case SYMENGINE_DIRICHLET_ETA:
            return c_dirichlet_eta;
        case SYMENGINE_ZETA:
            return c_zeta;
        case SYMENGINE_GAMMA:
            return c_gamma;
        default:
            return c_basic;
    }
}

VALUE function_onearg(void (*cwfunc_ptr)(basic_struct*, const basic_struct*), VALUE operand1) {
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

VALUE function_twoarg(void (*cwfunc_ptr)(basic_struct*, const basic_struct*, const basic_struct*),
                      VALUE operand1, VALUE operand2) {
    basic_struct *cresult;
    VALUE result;

    basic cbasic_operand1;
    basic_new_stack(cbasic_operand1);
    sympify(operand1, cbasic_operand1);

    basic cbasic_operand2;
    basic_new_stack(cbasic_operand2);
    sympify(operand2, cbasic_operand2);

    cresult = basic_new_heap();
    cwfunc_ptr(cresult, cbasic_operand1, cbasic_operand2);
    result = Data_Wrap_Struct(Klass_of_Basic(cresult), NULL , cbasic_free_heap, cresult);
    basic_free_stack(cbasic_operand1);
    basic_free_stack(cbasic_operand2);

    return result;
}
