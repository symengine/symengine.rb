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


VALUE cmatrix_dense_get(VALUE self, VALUE r, VALUE c)
{
    CDenseMatrix *this;
    Data_Get_Struct(self, CDenseMatrix, this);
    
    basic_struct *cresult;
    VALUE result;

    unsigned long cbasic_r;
    cbasic_r = NUM2ULONG(r);
    unsigned long cbasic_c;
    cbasic_c = NUM2ULONG(c);

    cresult = basic_new_heap();
    
    dense_matrix_get_basic(cresult, this, cbasic_r, cbasic_c);
    result = Data_Wrap_Struct(Klass_of_Basic(cresult), NULL, basic_free_heap,
                              cresult);
    return result;
}

VALUE cmatrix_dense_set(VALUE self, VALUE r, VALUE c, VALUE operand)
{
    CDenseMatrix *this;
    Data_Get_Struct(self, CDenseMatrix, this);
    
    basic cbasic_operand;
    basic_new_stack(cbasic_operand);
    sympify(operand, cbasic_operand);
    
    unsigned long cbasic_r;
    cbasic_r = NUM2ULONG(r);
    unsigned long cbasic_c;
    cbasic_c = NUM2ULONG(c);
    
    dense_matrix_set_basic(this, cbasic_r, cbasic_c, cbasic_operand);
    
    basic_free_stack(cbasic_operand);
    
    return self;
}


VALUE cmatrix_dense_det(VALUE self)
{
    CDenseMatrix *this;
    Data_Get_Struct(self, CDenseMatrix, this);
    
    basic_struct *cresult;
    VALUE result;

    cresult = basic_new_heap();
    
    dense_matrix_det(cresult, this);
    result = Data_Wrap_Struct(Klass_of_Basic(cresult), NULL, basic_free_heap,
                              cresult);
    return result;
}
VALUE cmatrix_dense_inv(VALUE self)
{
    CDenseMatrix *this;
    Data_Get_Struct(self, CDenseMatrix, this);
    
    CDenseMatrix *cresult;
    VALUE result;

    cresult = dense_matrix_new();
    
    dense_matrix_inv(cresult, this);
    result = Data_Wrap_Struct(c_dense_matrix, NULL, dense_matrix_free,
                              cresult);
    return result;
}

VALUE cmatrix_dense_transpose(VALUE self)
{
    CDenseMatrix *this;
    Data_Get_Struct(self, CDenseMatrix, this);
    
    CDenseMatrix *cresult;
    VALUE result;

    cresult = dense_matrix_new();
    
    dense_matrix_transpose(cresult, this);
    result = Data_Wrap_Struct(c_dense_matrix, NULL, dense_matrix_free,
                              cresult);
    return result;
}

VALUE cmatrix_dense_submatrix(VALUE self, VALUE r1, VALUE c1, VALUE r2, VALUE c2, VALUE r_, VALUE c_)
{
    CDenseMatrix *this;
    Data_Get_Struct(self, CDenseMatrix, this);
    
    CDenseMatrix *cresult;
    VALUE result;
    
    unsigned long cbasic_r1;
    cbasic_r1 = NUM2ULONG(r1);
    unsigned long cbasic_c1;
    cbasic_c1 = NUM2ULONG(c1);
    
    unsigned long cbasic_r2;
    cbasic_r2 = NUM2ULONG(r2);
    unsigned long cbasic_c2;
    cbasic_c2 = NUM2ULONG(c2);
    
    unsigned long cbasic_r;
    cbasic_r = NUM2ULONG(r_);
    unsigned long cbasic_c;
    cbasic_c = NUM2ULONG(c_);

    cresult = dense_matrix_new();
    
    dense_matrix_submatrix(cresult, this, cbasic_r1, cbasic_c1, cbasic_r2, cbasic_c2, cbasic_r, cbasic_c);
    result = Data_Wrap_Struct(c_dense_matrix, NULL, dense_matrix_free,
                              cresult);
    return result;
}

VALUE cmatrix_dense_rows(VALUE self)
{
    CDenseMatrix *this;
    Data_Get_Struct(self, CDenseMatrix, this);
    return ULONG2NUM( dense_matrix_rows(this));
}


VALUE cmatrix_dense_cols(VALUE self)
{
    CDenseMatrix *this;
    Data_Get_Struct(self, CDenseMatrix, this);
    return ULONG2NUM( dense_matrix_cols(this));
}

VALUE cmatrix_dense_add(VALUE self, VALUE operand)
{
    CDenseMatrix *this;
    Data_Get_Struct(self, CDenseMatrix, this);
    
    CDenseMatrix *cresult;
    VALUE result;

    cresult = dense_matrix_new();
    
    char *s = rb_obj_classname(operand);
    
    if(strcmp(s, "SymEngine::DenseMatrix") == 0) {
    // Matrix Addition
        CDenseMatrix *coperand;
        Data_Get_Struct(operand, CDenseMatrix, coperand);
        
        dense_matrix_add_matrix(cresult, this, coperand);
        
        result = Data_Wrap_Struct(c_dense_matrix, NULL, dense_matrix_free,
                              cresult);
                              
        dense_matrix_free(coperand);
    } else {
    // Scalar Addition
        basic_struct *coperand = basic_new_heap();
        sympify(operand, coperand);
        
        dense_matrix_add_scalar(cresult, this, coperand);
        result = Data_Wrap_Struct(c_dense_matrix, NULL, dense_matrix_free,
                              cresult);
        basic_free_heap(coperand);
    }
    
    return result;
}

VALUE cmatrix_dense_mul(VALUE self, VALUE operand)
{
    CDenseMatrix *this;
    Data_Get_Struct(self, CDenseMatrix, this);
    
    CDenseMatrix *cresult;
    VALUE result;

    cresult = dense_matrix_new();
    
    char *s = rb_obj_classname(operand);
    
    if(strcmp(s, "SymEngine::DenseMatrix") == 0) {
    // Matrix Multiplication
        CDenseMatrix *coperand;
        Data_Get_Struct(operand, CDenseMatrix, coperand);
        
        dense_matrix_mul_matrix(cresult, this, coperand);
        
        result = Data_Wrap_Struct(c_dense_matrix, NULL, dense_matrix_free,
                              cresult);
                              
        dense_matrix_free(coperand);
    } else {
    // Scalar Multiplication
        basic_struct *coperand = basic_new_heap();
        sympify(operand, coperand);
        
        dense_matrix_mul_scalar(cresult, this, coperand);
        result = Data_Wrap_Struct(c_dense_matrix, NULL, dense_matrix_free,
                              cresult);
        basic_free_heap(coperand);
    }
    
    return result;
}
