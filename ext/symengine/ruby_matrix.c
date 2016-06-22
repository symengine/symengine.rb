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


VALUE cmatrix_dense_init(VALUE self, VALUE args)
{
    int argc = RARRAY_LEN(args);
    CDenseMatrix *this;
    Data_Get_Struct(self, CDenseMatrix, this);
    
    if (argc == 0) {
    // SymEngine::DenseMatrix()
        dense_matrix(this);
    } else if (argc == 1) {
    // SymEngine::DenseMatrix(SymEngine::DenseMatrix) OR
    // SymEngine::DenseMatrix(NMatrix) OR
    // SymEngine::DenseMatrix(Array)
        VALUE operand = rb_ary_shift(args);
        char *s = rb_obj_classname(operand);
        printf("class name: %s\n", s);
        if(strcmp(s, "SymEngine::DenseMatrix") == 0) {
        // SymEngine::DenseMatrix(SymEngine::DenseMatrix)
        
        } else if(strcmp(s, "NMatrix") == 0) {
        // SymEngine::DenseMatrix(SymEngine::DenseMatrix)
        
        } else if(strcmp(s, "Array") == 0) {
        // SymEngine::DenseMatrix(SymEngine::DenseMatrix)
        
        } else {
            rb_raise(rb_eTypeError, "Invalid Arguments. No Arguments, a single SymEngine::DenseMatrix, a single NMatrix, a single Array or two Numerics expected.");
        } 
    
    } else if (argc == 2) {
    // SymEngine::DenseMatrix(no_rows, no_cols)
        VALUE val1 = rb_ary_shift(args);
        VALUE val2 = rb_ary_shift(args);
        if((TYPE(val1) == T_FIXNUM || TYPE(val1) == T_BIGNUM) 
            && (TYPE(val2) == T_FIXNUM || TYPE(val2) == T_BIGNUM) ) {
            unsigned long int rows = NUM2ULONG(val1);
            unsigned long int cols = NUM2ULONG(val2);
            dense_matrix_rows_cols(this, rows, cols);
        } else {
            rb_raise(rb_eTypeError, "Invalid Arguments. No Arguments, a single SymEngine::DenseMatrix, a single NMatrix, a single Array or two Numerics expected.");
        }
    } else {
        rb_raise(rb_eTypeError, "Invalid Arguments. No Arguments, a single SymEngine::DenseMatrix, a single NMatrix, a single Array or two Numerics expected.");
    }
    
    return self;
}
