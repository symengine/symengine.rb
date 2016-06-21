#ifndef SYMENGINE_H_
#define SYMENGINE_H_

#include <ruby/ruby.h>
#include <ruby/intern.h>

// variable name for a module starts with m
VALUE m_symengine;

// variable names for classes begin with c
VALUE c_basic;
VALUE c_symbol;
VALUE c_integer;
VALUE c_real_double;
VALUE c_rational;
VALUE c_complex;
VALUE c_complex_double;
#ifdef HAVE_SYMENGINE_MPFR
VALUE c_real_mpfr;
#endif // HAVE_SYMENGINE_MPFR
#ifdef HAVE_SYMENGINE_MPC
VALUE c_complex_mpc;
#endif // HAVE_SYMENGINE_MPC
VALUE c_constant;
VALUE c_subs;
VALUE c_add;
VALUE c_mul;
VALUE c_pow;
VALUE c_function;
VALUE c_function_symbol;
VALUE c_trig_function;
VALUE c_hyperbolic_function;
VALUE c_lambertw;
VALUE c_dirichlet_eta;
VALUE c_zeta;
VALUE c_gamma;
VALUE c_abs;
VALUE c_sin;
VALUE c_cos;
VALUE c_tan;
VALUE c_csc;
VALUE c_sec;
VALUE c_cot;
VALUE c_asin;
VALUE c_acos;
VALUE c_atan;
VALUE c_acsc;
VALUE c_asec;
VALUE c_acot;
VALUE c_sinh;
VALUE c_cosh;
VALUE c_tanh;
VALUE c_csch;
VALUE c_sech;
VALUE c_coth;
VALUE c_asinh;
VALUE c_acosh;
VALUE c_atanh;
VALUE c_acsch;
VALUE c_asech;
VALUE c_acoth;
VALUE c_matrix_base;
VALUE c_dense_matrix;
VALUE c_sparse_matrix;

#endif // SYMENGINE_H_
