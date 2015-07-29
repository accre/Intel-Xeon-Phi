version -blas
version -lapack
getenv('MKL_MIC_ENABLE')

% generate random n x n matrix
A = rand(25000);

% Matrix Multiply
tic
B = A * A;
toc

% LU Matrix Factorization
tic
B = lu(A);
toc

