#include "ruby_utils.h"

VALUE cutils_sympify(VALUE self, VALUE operand)
{

    VALUE result;
    const char *s = rb_obj_classname(operand);

    if (strcmp(s, "Array") == 0) {

        CDenseMatrix *mat_result;
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
            s = rb_obj_classname(row);
            if (strcmp(s, "Array") != 0) {
                rb_raise(rb_eTypeError, "2D Array is required");
            }

            if (cols == -1) {
                cols = RARRAY_LEN(row);
                // Checking all rows for same col length
            } else if (cols != RARRAY_LEN(row)) {
                rb_raise(rb_eTypeError,
                         "2D Array's rows contain different column counts");
            }

            for (j = 0; j < cols; j++) {
                sympify(rb_ary_shift(row), x);
                vecbasic_push_back(cargs, x);
                counter++;
            }
        }

        mat_result = dense_matrix_new_vec(rows, cols, cargs);

        basic_free_stack(x);
        vecbasic_free(cargs);

        result = Data_Wrap_Struct(c_dense_matrix, NULL, dense_matrix_free,
                                  mat_result);
    } else {

        basic_struct *cbasic_operand;
        cbasic_operand = basic_new_heap();

        sympify(operand, cbasic_operand);
        result = Data_Wrap_Struct(Klass_of_Basic(cbasic_operand), NULL,
                                  cbasic_free_heap, cbasic_operand);
    }
    return result;
}
