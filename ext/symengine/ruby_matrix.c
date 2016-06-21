#include "ruby_matrix.h"

void cmatrix_free(void *ptr)
{
    CMatrixBase *mat_ptr = ptr;
    matrix_base_free(mat_ptr);
}

VALUE cmatrix_alloc(VALUE klass)
{
    CMatrixBase *mat_ptr = matrix_base_new();
    return Data_Wrap_Struct(klass, NULL, cmatrix_free, mat_ptr);
}
