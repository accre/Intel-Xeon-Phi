# Set MKL threads if Revolution R Open or Revolution R Enterprise is available

# Benchmarks taken from:
#     http://blog.revolutionanalytics.com/2014/10/revolution-r-open-mkl.html

#if(require("RevoUtilsMath")){
#  setMKLthreads(4)
#}


# Initialization

set.seed (1)
m <- 40000
n <- 40000
A <- matrix (runif (m*n),m,n)

# Matrix multiply
system.time (B <- crossprod(A))

# Cholesky Factorization
system.time (C <- chol(B))

# Singular Value Decomposition
m <- 20000
n <- 20000
A <- matrix (runif (m*n),m,n)
system.time (S <- svd (A,nu=0,nv=0))

# Principal Components Analysis
m <- 20000
n <- 20000
A <- matrix (runif (m*n),m,n)
system.time (P <- prcomp(A))
