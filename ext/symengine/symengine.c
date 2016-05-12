#include <symengine/cwrapper.h>
#include "ruby_basic.h"
#include "ruby_symbol.h"
#include "ruby_integer.h"
#include "ruby_rational.h"
#include "ruby_constant.h"
#include "ruby_function.h"
#include "ruby_ntheory.h"
#include "symengine.h"

///////////////////
// Ruby Bindings //
///////////////////

VALUE msymengine_ascii_art(VALUE self) {
    char* str = ascii_art_str();
    VALUE ascii_art = rb_str_new_cstr(str);
    basic_str_free(str);
    return ascii_art;
}

void Init_symengine() {
    m_symengine = rb_define_module("SymEngine");
    rb_define_singleton_method(m_symengine, "ascii_art", msymengine_ascii_art, 0);

    //Basic class
    c_basic = rb_define_class_under(m_symengine, "Basic", rb_cObject);
    rb_define_alloc_func(c_basic, cbasic_alloc);
    rb_define_method(c_basic, "+", cbasic_add, 1);
    rb_define_method(c_basic, "-", cbasic_sub, 1);
    rb_define_method(c_basic, "*", cbasic_mul, 1);
    rb_define_method(c_basic, "/", cbasic_div, 1);
    rb_define_method(c_basic, "**", cbasic_pow, 1);
    rb_define_method(c_basic, "diff", cbasic_diff, 1);
    rb_define_method(c_basic, "==", cbasic_eq, 1);
    rb_define_method(c_basic, "eql?", cbasic_eq, 1);
    rb_define_method(c_basic, "!=", cbasic_neq, 1);
    rb_define_method(c_basic, "-@", cbasic_neg, 0);
    rb_define_method(c_basic, "to_s", cbasic_to_str, 0);
    rb_define_method(c_basic, "expand", cbasic_expand, 0);
    rb_define_method(c_basic, "args", cbasic_get_args, 0);
    rb_define_protected_method(c_basic, "pr_free_symbols", cbasic_free_symbols, 0);
    rb_define_method(c_basic, "hash", cbasic_hash, 0);
    rb_define_method(c_basic, "subs", cbasic_subs, -1);
    rb_define_method(c_basic, "coerce", cbasic_coerce, 1);

    //Symbol class
    c_symbol = rb_define_class_under(m_symengine, "Symbol", c_basic);
    rb_define_alloc_func(c_symbol, cbasic_alloc);
    rb_define_method(c_symbol, "initialize", csymbol_init, 1);

    //Integer class
    c_integer = rb_define_class_under(m_symengine, "Integer", c_basic);
    rb_define_alloc_func(c_integer, cbasic_alloc);
    rb_define_method(c_integer, "initialize", cinteger_init, 1);

    //Rational class
    c_rational = rb_define_class_under(m_symengine, "Rational", c_basic);
    rb_define_alloc_func(c_rational, cbasic_alloc);
    rb_define_method(c_rational, "initialize", crational_init, 1);

    //Constant class
    c_constant = rb_define_class_under(m_symengine, "Constant", c_basic);

    //Constants as Module Level Constants
    rb_define_const(m_symengine, "PI", cconstant_pi());
    rb_define_const(m_symengine, "E", cconstant_e());
    rb_define_const(m_symengine, "EULER_GAMMA", cconstant_euler_gamma());

    //Add class
    c_add = rb_define_class_under(m_symengine, "Add", c_basic);

    //Mul class
    c_mul = rb_define_class_under(m_symengine, "Mul", c_basic);

    //Pow class
    c_pow = rb_define_class_under(m_symengine, "Pow", c_basic);

    //Functions Class
    c_function = rb_define_class_under(m_symengine, "Function", c_basic);

    //Function SubClasses
    c_trig_function = rb_define_class_under(m_symengine, "TrigFunction", c_function);
    c_hyperbolic_function = rb_define_class_under(m_symengine, "HyperbolicFunction", c_function);
    c_lambertw = rb_define_class_under(m_symengine, "LambertW", c_function);
    c_dirichlet_eta = rb_define_class_under(m_symengine, "Dirichlet_eta", c_function);
    c_zeta = rb_define_class_under(m_symengine, "Zeta", c_function);
    c_gamma = rb_define_class_under(m_symengine, "Gamma", c_function);

    //TrigFunction SubClasses
    c_sin = rb_define_class_under(m_symengine, "Sin", c_trig_function);
    c_cos = rb_define_class_under(m_symengine, "Cos", c_trig_function);
    c_tan = rb_define_class_under(m_symengine, "Tan", c_trig_function);
    c_csc = rb_define_class_under(m_symengine, "Csc", c_trig_function);
    c_sec = rb_define_class_under(m_symengine, "Sec", c_trig_function);
    c_cot = rb_define_class_under(m_symengine, "Cot", c_trig_function);
    c_asin = rb_define_class_under(m_symengine, "ASin", c_trig_function);
    c_acos = rb_define_class_under(m_symengine, "ACos", c_trig_function);
    c_atan = rb_define_class_under(m_symengine, "ATan", c_trig_function);
    c_acsc = rb_define_class_under(m_symengine, "ACsc", c_trig_function);
    c_asec = rb_define_class_under(m_symengine, "ASec", c_trig_function);
    c_acot = rb_define_class_under(m_symengine, "ACot", c_trig_function);

    //HyperbolicFunction SubClasses
    c_sinh = rb_define_class_under(m_symengine, "Sinh", c_hyperbolic_function);
    c_cosh = rb_define_class_under(m_symengine, "Cosh", c_hyperbolic_function);
    c_tanh = rb_define_class_under(m_symengine, "Tanh", c_hyperbolic_function);
    c_csch = rb_define_class_under(m_symengine, "Csch", c_hyperbolic_function);
    c_sech = rb_define_class_under(m_symengine, "Sech", c_hyperbolic_function);
    c_coth = rb_define_class_under(m_symengine, "Coth", c_hyperbolic_function);
    c_asinh = rb_define_class_under(m_symengine, "ASinh", c_hyperbolic_function);
    c_acosh = rb_define_class_under(m_symengine, "ACosh", c_hyperbolic_function);
    c_atanh = rb_define_class_under(m_symengine, "ATanh", c_hyperbolic_function);
    c_acsch = rb_define_class_under(m_symengine, "ACsch", c_hyperbolic_function);
    c_asech = rb_define_class_under(m_symengine, "ASech", c_hyperbolic_function);
    c_acoth = rb_define_class_under(m_symengine, "ACoth", c_hyperbolic_function);

    //SymEngine Functions as Module Level Funcions
    rb_define_module_function(m_symengine, "abs", cfunction_abs, 1);
    rb_define_module_function(m_symengine, "sin", cfunction_sin, 1);
    rb_define_module_function(m_symengine, "cos", cfunction_cos, 1);
    rb_define_module_function(m_symengine, "tan", cfunction_tan, 1);
    rb_define_module_function(m_symengine, "csc", cfunction_csc, 1);
    rb_define_module_function(m_symengine, "cot", cfunction_cot, 1);
    rb_define_module_function(m_symengine, "sec", cfunction_sec, 1);
    rb_define_module_function(m_symengine, "asin", cfunction_asin, 1);
    rb_define_module_function(m_symengine, "acos", cfunction_acos, 1);
    rb_define_module_function(m_symengine, "asec", cfunction_asec, 1);
    rb_define_module_function(m_symengine, "acsc", cfunction_acsc, 1);
    rb_define_module_function(m_symengine, "atan", cfunction_atan, 1);
    rb_define_module_function(m_symengine, "acot", cfunction_acot, 1);
    rb_define_module_function(m_symengine, "sinh", cfunction_sinh, 1);
    rb_define_module_function(m_symengine, "cosh", cfunction_cosh, 1);
    rb_define_module_function(m_symengine, "tanh", cfunction_tanh, 1);
    rb_define_module_function(m_symengine, "csch", cfunction_csch, 1);
    rb_define_module_function(m_symengine, "sech", cfunction_sech, 1);
    rb_define_module_function(m_symengine, "coth", cfunction_coth, 1);
    rb_define_module_function(m_symengine, "asinh", cfunction_asinh, 1);
    rb_define_module_function(m_symengine, "acosh", cfunction_acosh, 1);
    rb_define_module_function(m_symengine, "asech", cfunction_asech, 1);
    rb_define_module_function(m_symengine, "acsch", cfunction_acsch, 1);
    rb_define_module_function(m_symengine, "atanh", cfunction_atanh, 1);
    rb_define_module_function(m_symengine, "acoth", cfunction_acoth, 1);
    rb_define_module_function(m_symengine, "lambertw", cfunction_lambertw, 1);
    rb_define_module_function(m_symengine, "dirichlet_eta", cfunction_dirichlet_eta, 1);
    rb_define_module_function(m_symengine, "zeta", cfunction_zeta, 1);
    rb_define_module_function(m_symengine, "gamma", cfunction_gamma, 1); 

    //NTheory Functions as Module Level Functions
    rb_define_module_function(m_symengine, "gcd", cntheory_gcd, 2);
    rb_define_module_function(m_symengine, "lcm", cntheory_lcm, 2);
    rb_define_module_function(m_symengine, "nextprime", cntheory_nextprime, 1);
    rb_define_module_function(m_symengine, "mod", cntheory_mod, 2);
    rb_define_module_function(m_symengine, "quotient", cntheory_quotient, 2);
    rb_define_module_function(m_symengine, "fibonacci", cntheory_fibonacci, 1);
    rb_define_module_function(m_symengine, "lucas", cntheory_lucas, 1);
    rb_define_module_function(m_symengine, "binomial", cntheory_binomial, 2);

}
