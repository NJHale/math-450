function [ T ] = centeredLaplacian( uBound, dBound, lBound, rBound, n )
    %create an n^2 x n^2 coefficient matrix
    A = zeros(n * n);
    %create a solution vector
    b = zeros(n * n, 1);
    for i = 1 : n
        for j = 1 : n
            %check boundary conditions
            %right boundary condition
            if (i + 1 > n)
                %correct index and apply boundary value to b
                b((i - 1) * n + j) = b((i - 1) * n + j) - rBound;
            end
            %left boundary
            if (i - 1 < 1)
                %correct index and apply boundary value to b
                b((i - 1) * n + j) = b((i - 1) * n + j) - lBound;
            end
            %upward boundary
            if (j + 1 > n) 
                %correct index and apply boundary value to b
                b((i - 1) * n + j) = b((i - 1) * n + j) - uBound;
            end
            %downward boundary
            if (i - 1 < 1)
                %correct index and apply boundary value to b
                b((i - 1) * n + j) = b((i - 1) * n + j) - dBound;
            end
            
            %get reindexed row/col of coefficient matrix A
            row = (i - 1) * n + j; 
            %Add each non-boundary part of the linear system to A
            %-4 * T(i,j)
            col = row;
            A(row, col) = -4;
            %1 * T(i+1,j)
            col = i * n + j;
            if (col <= n * n)
                A(row, col) = A(row, col) + 1;
            end
            %1 * T(i-1,j)
            col = (i - 2) * n + j;
            if (col > 0)
                A(row, col) = A(row, col) + 1;
            end
            %1 * T(i,j+1)
            col = (i - 1) * n + (j + 1);
            if (col <= n * n)
                A(row, col) = A(row, col) + 1;
            end
            %1 * T(i,j+1)
            col = (i - 1) * n + (j - 1);
            if (col > 0)
                A(row, col) = A(row, col) + 1;
            end
                 
        end
    end
    x = A \ b;
    %reconsitute solution vector into an n x n topology matrix
    T = zeros(n);%topology matrix
    k = 1;%solution vector index
    for i = 1 : n
        for j = 1 : n
            T(i, j) = x(k);
            k = k + 1;
        end
    end
end

