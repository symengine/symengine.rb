#ifndef RUBY_MATRIX_H_
#define RUBY_MATRIX_H_

#include <ruby.h>
#include <symengine/cwrapper.h>

#include "symengine.h"
#include "ruby_basic.h"
#include "symengine_utils.h"

void cmatrix_dense_free(void *ptr);
VALUE cmatrix_dense_alloc(VALUE klass);
VALUE cmatrix_dense_init(VALUE self, VALUE args);
VALUE cmatrix_dense_to_str(VALUE self);
VALUE cmatrix_dense_get(VALUE self, VALUE r, VALUE c);
VALUE cmatrix_dense_set(VALUE self, VALUE r, VALUE c, VALUE operand);
VALUE cmatrix_dense_det(VALUE self);
VALUE cmatrix_dense_inv(VALUE self);
VALUE cmatrix_dense_transpose(VALUE self);
VALUE cmatrix_dense_submatrix(VALUE self, VALUE r1, VALUE c1, VALUE r2, VALUE c2, VALUE r_, VALUE c_);
VALUE cmatrix_dense_rows(VALUE self);
VALUE cmatrix_dense_cols(VALUE self);
VALUE cmatrix_dense_add(VALUE self, VALUE operand);
VALUE cmatrix_dense_mul(VALUE self, VALUE operand);

void cmatrix_sparse_free(void *ptr);
VALUE cmatrix_sparse_alloc(VALUE klass);
VALUE cmatrix_sparse_init(VALUE self, VALUE args);
VALUE cmatrix_sparse_to_str(VALUE self);

#endif // RUBY_MATRIX_H_
