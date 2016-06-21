#include "ruby_matrix.h"

void cmatrix_dense_free(void *ptr)
{
    CDenseMatrix *mat_ptr = ptr;
    dense_matrix_free(mat_ptr);
}

VALUE cmatrix_dense_alloc(VALUE klass)
{
    CDenseMatrix *mat_ptr = dense_matrix_new();
    return Data_Wrap_Struct(klass, NULL, cmatrix_dense_free, mat_ptr);
}


VALUE cmatrix_dense_init(VALUE self)
{
    CDenseMatrix *this;
    Data_Get_Struct(self, CDenseMatrix, this);
    
    dense_matrix(this);
    
    return self;
}
