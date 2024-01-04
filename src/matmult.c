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