#include "ruby_matrix.h"

void cmatrix_dense_free(void *ptr)
{
    CDenseMatrix *mat_ptr = ptr;
    dense_matrix_free(mat_ptr);
}

void cmatrix_sparse_free(void *ptr)
{
    CSparseMatrix *mat_ptr = ptr;
    sparse_matrix_free(mat_ptr);
}

VALUE cmatrix_dense_alloc(VALUE klass)
{
    CDenseMatrix *mat_ptr = dense_matrix_new();
    return Data_Wrap_Struct(klass, NULL, cmatrix_dense_free, mat_ptr);
}

VALUE cmatrix_sparse_alloc(VALUE klass)
{
    CSparseMatrix *mat_ptr = sparse_matrix_new();
    return Data_Wrap_Struct(klass, NULL, cmatrix_sparse_free, mat_ptr);
}

VALUE cmatrix_dense_to_str(VALUE self)
{
    CDenseMatrix *this;
    char *str_ptr;
    VALUE result;

    Data_Get_Struct(self, CDenseMatrix, this);

    str_ptr = dense_matrix_str(this);
    result = rb_str_new_cstr(str_ptr);
    basic_str_free(str_ptr);

    return result;
}

VALUE cmatrix_sparse_to_str(VALUE self)
{
    CSparseMatrix *this;
    char *str_ptr;
    VALUE result;

    Data_Get_Struct(self, CSparseMatrix, this);

    str_ptr = sparse_matrix_str(this);
    result = rb_str_new_cstr(str_ptr);
    basic_str_free(str_ptr);

    return result;
}


VALUE cmatrix_dense_init(VALUE self, VALUE args)
{
    int argc = RARRAY_LEN(args);
    CDenseMatrix *this;
    Data_Get_Struct(self, CDenseMatrix, this);
    
    if (argc == 0) {
    
    // SymEngine::DenseMatrix()
        dense_matrix_init(this);
        
    } else if (argc == 1) {
    // SymEngine::DenseMatrix(SymEngine::DenseMatrix) OR
    // SymEngine::DenseMatrix(NMatrix) OR
    // SymEngine::DenseMatrix(Array)
    
        VALUE operand = rb_ary_shift(args);
        char *s = rb_obj_classname(operand);
        
        if(strcmp(s, "SymEngine::DenseMatrix") == 0) {
        
        // SymEngine::DenseMatrix(SymEngine::DenseMatrix)
            CDenseMatrix *temp;
            Data_Get_Struct(operand, CDenseMatrix, temp);
            dense_matrix_set(this, temp);
            
        } else if(strcmp(s, "NMatrix") == 0) {
        
        // SymEngine::DenseMatrix(NMatrix)
            rb_raise(rb_eTypeError, "TODO");
            
        } else if(strcmp(s, "Array") == 0) {
        
        // SymEngine::DenseMatrix(Array)
            int counter = 0;
        
            int rows = RARRAY_LEN(operand);
            int cols = -1;
            CVecBasic *cargs = vecbasic_new();
            basic x;
            basic_new_stack(x);
            int i;
            for (i = 0; i < rows; i++) {
                int j;
                VALUE row = rb_ary_shift(operand);
                if ( cols == -1 ) {
                    cols = RARRAY_LEN(row); 
                // Checking all rows for same col length
                } else if (cols != RARRAY_LEN(row)) {
                    rb_raise(rb_eTypeError, "2D Array's rows contain different column counts");
                }
                
                for(j = 0; j < cols; j++) {
                    sympify(rb_ary_shift(row), x);
                    vecbasic_push_back(cargs, x);
                    counter++;
                }
            }
            dense_matrix_set_vec(this, rows, cols, cargs);
            
            basic_free_stack(x);
            vecbasic_free(cargs);
            
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

VALUE cmatrix_sparse_init(VALUE self, VALUE args)
{
    int argc = RARRAY_LEN(args);
    CSparseMatrix *this;
    Data_Get_Struct(self, CSparseMatrix, this);
    
    if (argc == 0) {
    
    // SymEngine::SparseMatrix()
        sparse_matrix_init(this);
        
    } else if (argc == 2) {
    
    // SymEngine::SparseMatrix(no_rows, no_cols)
        VALUE val1 = rb_ary_shift(args);
        VALUE val2 = rb_ary_shift(args);
        
        if((TYPE(val1) == T_FIXNUM || TYPE(val1) == T_BIGNUM) 
            && (TYPE(val2) == T_FIXNUM || TYPE(val2) == T_BIGNUM) ) {
            
            unsigned long int rows = NUM2ULONG(val1);
            unsigned long int cols = NUM2ULONG(val2);
            sparse_matrix_rows_cols(this, rows, cols);
            
        } else {
        
            rb_raise(rb_eTypeError, "Invalid Arguments. No Arguments, or two Numerics expected.");
            
        }
    } else {
    
        rb_raise(rb_eTypeError, "Invalid Arguments. No Arguments, or two Numerics expected.");
        
    }
    
    return self;
}
