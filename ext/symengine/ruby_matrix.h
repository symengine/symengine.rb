#ifndef RUBY_MATRIX_H_
#define RUBY_MATRIX_H_

#include <ruby.h>
#include <symengine/cwrapper.h>

void cmatrix_dense_free(void *ptr);
VALUE cmatrix_dense_alloc(VALUE klass);
VALUE cmatrix_dense_init(VALUE self, VALUE args);
VALUE cmatrix_dense_to_str(VALUE self);

void cmatrix_sparse_free(void *ptr);
VALUE cmatrix_sparse_alloc(VALUE klass);
VALUE cmatrix_sparse_init(VALUE self, VALUE args);
VALUE cmatrix_sparse_to_str(VALUE self);

#endif // RUBY_MATRIX_H_
