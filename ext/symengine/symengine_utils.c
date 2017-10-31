#include "symengine_utils.h"
#include "symengine.h"

VALUE check_sympify(VALUE operand2, basic_struct *cbasic_operand2)
{

    basic_struct *temp;
    VALUE a, b;
    double f;

    switch (TYPE(operand2)) {
        case T_FIXNUM:
        case T_BIGNUM:
            get_symintfromval(operand2, cbasic_operand2);
            break;

        case T_FLOAT:
            f = RFLOAT_VALUE(operand2);
            real_double_set_d(cbasic_operand2, f);
            break;

        case T_RATIONAL:
            a = rb_funcall(operand2, rb_intern("numerator"), 0, NULL);
            b = rb_funcall(operand2, rb_intern("denominator"), 0, NULL);

            basic num_basic, den_basic;
            basic_new_stack(num_basic);
            basic_new_stack(den_basic);

            get_symintfromval(a, num_basic);
            get_symintfromval(b, den_basic);

            rational_set(cbasic_operand2, num_basic, den_basic);

            basic_free_stack(num_basic);
            basic_free_stack(den_basic);
            break;

        case T_COMPLEX:
            a = rb_funcall(operand2, rb_intern("real"), 0, NULL);
            b = rb_funcall(operand2, rb_intern("imaginary"), 0, NULL);

            basic real_basic;
            basic imag_basic;

            basic_new_stack(real_basic);
            basic_new_stack(imag_basic);

            sympify(a, real_basic);
            sympify(b, imag_basic);

            basic_const_I(cbasic_operand2);
            basic_mul(cbasic_operand2, cbasic_operand2, imag_basic);
            basic_add(cbasic_operand2, cbasic_operand2, real_basic);

            basic_free_stack(real_basic);
            basic_free_stack(imag_basic);

            break;

        case T_DATA:
            if (rb_obj_is_kind_of(operand2, c_basic)) {
                Data_Get_Struct(operand2, basic_struct, temp);
                basic_assign(cbasic_operand2, temp);
                break;
            }
#ifdef HAVE_SYMENGINE_MPFR
            if (strcmp(rb_obj_classname(operand2), "BigDecimal") == 0) {
                const char *c;
                c = RSTRING_PTR(rb_funcall(operand2, rb_intern("to_s"), 1,
                                           rb_str_new2("F")));
                real_mpfr_set_str(cbasic_operand2, c, 200);
                break;
            }
#endif // HAVE_SYMENGINE_MPFR
        default:
            return Qfalse;
    }
    return Qtrue;
}

void sympify(VALUE operand2, basic_struct *cbasic_operand2)
{
    VALUE ret = check_sympify(operand2, cbasic_operand2);
    if (ret == Qfalse) {
        rb_raise(rb_eTypeError, "%s can't be coerced into SymEngine::Basic",
                 rb_obj_classname(operand2));
    }
}

void get_symintfromval(VALUE operand2, basic_struct *cbasic_operand2)
{
    if (TYPE(operand2) == T_FIXNUM) {
        long int i = NUM2LONG(operand2);
        integer_set_si(cbasic_operand2, i);
    } else if (TYPE(operand2) == T_BIGNUM) {
        VALUE Rb_Temp_String = rb_funcall(operand2, rb_intern("to_s"), 0, NULL);
        integer_set_str(cbasic_operand2, StringValueCStr(Rb_Temp_String));
    } else {
        rb_raise(rb_eTypeError, "Invalid Type: Fixnum or Bignum required");
    }
}

VALUE Klass_of_Basic(const basic_struct *basic_ptr)
{
    switch (basic_get_type(basic_ptr)) {
        case SYMENGINE_SYMBOL:
            return c_symbol;
        case SYMENGINE_INTEGER:
            return c_integer;
        case SYMENGINE_REAL_DOUBLE:
            return c_real_double;
#ifdef HAVE_SYMENGINE_MPFR
        case SYMENGINE_REAL_MPFR:
            return c_real_mpfr;
#endif // HAVE_SYMENGINE_MPFR
        case SYMENGINE_RATIONAL:
            return c_rational;
        case SYMENGINE_COMPLEX:
            return c_complex;
        case SYMENGINE_COMPLEX_DOUBLE:
            return c_complex_double;
#ifdef HAVE_SYMENGINE_MPC
        case SYMENGINE_COMPLEX_MPC:
            return c_complex_mpc;
#endif // HAVE_SYMENGINE_MPFR
        case SYMENGINE_CONSTANT:
            return c_constant;
        case SYMENGINE_SUBS:
            return c_subs;
        case SYMENGINE_ADD:
            return c_add;
        case SYMENGINE_MUL:
            return c_mul;
        case SYMENGINE_POW:
            return c_pow;
        case SYMENGINE_FUNCTIONSYMBOL:
            return c_function_symbol;
        case SYMENGINE_ABS:
            return c_abs;
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

VALUE function_onearg(
    symengine_exceptions_t (*cwfunc_ptr)(basic_struct *, const basic_struct *),
    VALUE operand1)
{
    basic_struct *cresult;
    VALUE result = Qnil;

    basic cbasic_operand1;
    basic_new_stack(cbasic_operand1);
    sympify(operand1, cbasic_operand1);

    cresult = basic_new_heap();
    symengine_exceptions_t error_code = cwfunc_ptr(cresult, cbasic_operand1);
    if (error_code == SYMENGINE_NO_EXCEPTION) {
        result = Data_Wrap_Struct(Klass_of_Basic(cresult), NULL,
                                  cbasic_free_heap, cresult);
        basic_free_stack(cbasic_operand1);
    } else {
        basic_free_stack(cbasic_operand1);
        raise_exception(error_code);
    }
    return result;
}

VALUE function_twoarg(
    symengine_exceptions_t (*cwfunc_ptr)(basic_struct *, const basic_struct *,
                                         const basic_struct *),
    VALUE operand1, VALUE operand2)
{
    basic_struct *cresult;
    VALUE result = Qnil;

    basic cbasic_operand1;
    basic_new_stack(cbasic_operand1);
    sympify(operand1, cbasic_operand1);

    basic cbasic_operand2;
    basic_new_stack(cbasic_operand2);
    sympify(operand2, cbasic_operand2);

    cresult = basic_new_heap();
    symengine_exceptions_t error_code
        = cwfunc_ptr(cresult, cbasic_operand1, cbasic_operand2);

    if (error_code == SYMENGINE_NO_EXCEPTION) {
        result = Data_Wrap_Struct(Klass_of_Basic(cresult), NULL,
                                  cbasic_free_heap, cresult);
        basic_free_stack(cbasic_operand1);
        basic_free_stack(cbasic_operand2);
    } else {
        basic_free_stack(cbasic_operand1);
        basic_free_stack(cbasic_operand2);
        raise_exception(error_code);
    }
    return result;
}

void raise_exception(symengine_exceptions_t error_code)
{
    char *str = "";
    switch (error_code) {
        case SYMENGINE_NO_EXCEPTION:
            return;
        case SYMENGINE_RUNTIME_ERROR:
            str = "Runtime Error";
            break;
        case SYMENGINE_DIV_BY_ZERO:
            str = "Division by Zero";
            break;
        case SYMENGINE_NOT_IMPLEMENTED:
            str = "Not Implemented";
            break;
        case SYMENGINE_DOMAIN_ERROR:
            str = "Domain Error";
            break;
        case SYMENGINE_PARSE_ERROR:
            str = "Parse Error";
            break;
    }
    rb_raise(rb_eRuntimeError, "%s", str);
}
