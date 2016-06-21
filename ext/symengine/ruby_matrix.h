#ifndef RUBY_MATRIX_H_
#define RUBY_MATRIX_H_

#include <ruby.h>
#include <symengine/cwrapper.h>

void cmatrix_free(void *ptr);
VALUE cmatrix_alloc(VALUE klass);

#endif // RUBY_MATRIX_H_
