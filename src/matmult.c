#include "cblas.h"

void
matmult_nat(int m, int n, int k, double **A, double **B, double **C) {
    for(int i = 0; i < m; i++) {
        for(int j = 0; j < n; j++) {
            C[i][j] = 0;
            for(int l = 0; l < k; l++) {
                C[i][j] += A[i][l] * B[l][j];
            }
        }  
    }  
}

void
matmult_lib(int m, int n, int k, double **A, double **B, double**C) {
    double alpha = 1.0;
    double beta = 0.0;
    
    cblas_dgemm(CblasRowMajor, 
    CblasNoTrans,
    CblasNoTrans,
    m, n, k, alpha, *A, k, *B, n, beta, *C, n);
}

void 
matmult_mnk(int m,int n,int k,double **A,double **B,double **C) {
    // work here
}

void 
matmult_mkn(int m,int n,int k,double **A,double **B,double **C) {
    // work here
}

void 
matmult_nmk(int m,int n,int k,double **A,double **B,double **C) {
    // work here
}

void 
matmult_nkm(int m,int n,int k,double **A,double **B,double **C) {
    // work here
}

void 
matmult_kmn(int m,int n,int k,double **A,double **B,double **C) {
    // work here
}

void 
matmult_knm(int m,int n,int k,double **A,double **B,double **C) {
    // work here
}

void 
matmult_blk(int m,int n,int k,double **A,double **B,double **C) {
    // work here
}