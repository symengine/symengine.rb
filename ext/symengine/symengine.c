#include <symengine/cwrapper.h>
#include "ruby_basic.h"
#include "ruby_symbol.h"
#include "ruby_integer.h"
#include "ruby_rational.h"
#include "ruby_constant.h"
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

}
