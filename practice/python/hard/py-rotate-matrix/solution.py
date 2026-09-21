# Xom Data · Rotate image
# Problem: https://xomdata.com/practice/py-rotate-matrix
# Solved: 2026-09-21

def rotate_90(matrix):
    if not matrix:
        return []
    n = len(matrix)
    return [[matrix[n - 1 - j][i] for j in range(n)] for i in range(n)]
