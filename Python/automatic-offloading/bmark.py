
# examples taken from:
# https://dpinte.wordpress.com/2010/01/15/numpy-performance-improvement-with-the-mkl/

import numpy as np
import time

def test_eigenvalue():
    ''' Does not appear to support Automatic Offloading '''

    print "Running test_eigenvalue()..."
    time1 = time.clock()
    i= 500
    data = np.random.rand(i,i)
    result = np.linalg.eig(data)
    time2 = time.clock()
    print time2-time1

def test_svd():
    ''' Appears to support at least some Automatic Offloading '''

    print "Running test_svd()..."
    time1 = time.clock()
    i = 20000
    data = np.random.rand(i,i)
    result = np.linalg.svd(data)
    result = np.linalg.svd(data, full_matrices=False)
    time2 = time.clock()
    print time2-time1

def test_inv():
    ''' Appears to support at least some Automatic Offloading '''

    print "Running test_inv()..."
    time1 = time.clock()
    i = 20000
    data = np.random.rand(i,i)
    result = np.linalg.inv(data)
    time2 = time.clock()
    print time2-time1

def test_det():
    ''' At moderately sized matrices I get overflow warnings... '''

    print "Running test_det()..."
    time1 = time.clock()
    i=10000
    data = np.random.rand(i,i)
    result = np.linalg.det(data)
    time2 = time.clock()
    print time2-time1

def test_dot():
    ''' Appears to support at least some Automatic Offloading '''

    print "Running test_dot()..."
    time1 = time.clock()
    i = 20000
    a = np.random.rand(i,i)
    b = np.linalg.inv(a)
    result = np.dot(a, b) - np.eye(i)
    time2 = time.clock()
    print time2-time1

if __name__ == '__main__':

    test_list = [test_svd(), test_inv(), test_dot()]

    for itest,test in enumerate(test_list):
        test
