subroutine initialize(n, A, b, Ab)
! Modify values in the function to change A, b
! 
! n = 3
!          | 5 -2  3 |
! A(n*n) = | 3  9 -5 |
!          | 3 -2  7 |
!
!          |  27 |
! b(n*1) = | -11 |
!          |  51 |
!
!               | 5 -2  3  27|
! Ab(n*(n+1)) = | 3  9 -5 -11|
!               | 3 -2  7  51|

    implicit none
    integer, intent(in) :: n 
    real, dimension(n, n), intent(out) :: A
    real, dimension(n, 1), intent(out) :: b
    real, dimension(n, n + 1), intent(out) :: Ab

    A = reshape((/ 5, 3, 3, -2, 9, -2, 3, -5, 7 /), shape(A))
    b = reshape((/ 27, -11, 51 /), shape(b))

    ! Another example
    ! A = reshape((/ 1, 0, 0, -1, 0, 2, 2, -1, -1 /), shape(A))
    ! b = reshape((/ -8, -4, 6 /), shape(b))
    
    Ab(1:n, 1:n)  = A
    Ab(:, n + 1:n + 1) = b
end subroutine initialize


subroutine printMatrix(matrix, dims)
! Utility subroutine to print a matrix

    implicit none
    integer, dimension(2), intent(in) :: dims
    real, dimension(dims(1), dims(2)), intent(in) :: matrix
    integer :: i, j

    10 format(f9.3)
    do i = 1, dims(1)
        do j = 1, dims(2)
            write(*, 10, advance='no') matrix(i,j)
        end do
        write(*, *)
    end do
    write(*, *)    
end subroutine printMatrix


subroutine pivot(Ab, n, j)
! Swap row `j` with another `row`  
    implicit none
    integer, intent(in) :: n, j
    real, dimension(n, n + 1), intent(inout) :: Ab
    integer :: i, k
    real, dimension(n + 1) :: t

    k = j
    do i = j, n
        ! Swapping with the row having largest pivot
        if(abs(Ab(i, j)) > abs(Ab(k,j))) k = i
    end do

    ! Swap rows of `Ab`
    t = Ab(j, :)
    Ab(j, :) = Ab(k, :)
    Ab(k, :) = t
end subroutine


subroutine gaussianElimination(n, Ab, x)
    implicit none
    integer, intent(in) :: n
    real, dimension(n, n + 1), intent(inout) :: Ab
    real, dimension(n, 1), intent(out) :: x

    integer :: i, j
    real :: b_i

    ! Making `Ab` lower trianguar matrix
    do i = 1, n
        ! Pivot element is zero
        if (Ab(i, i) .eq. 0) call pivot(Ab, n, i)
        do j = i + 1, n
            Ab(j, :) = Ab(j, :)-Ab(i, :)*Ab(j, i)/Ab(i, i)
        end do
    end do

    ! Backsweep
    do i = n, 1, -1
        b_i = Ab(i, n + 1)
        do j = i + 1, n
            b_i = b_i - Ab(i, j) * x(j, 1)
        end do
        x(i, 1) = b_i / Ab(i, i)
    end do

end subroutine gaussianElimination


program mainProgram
    implicit none
    integer, parameter :: n = 3    
    real, dimension(n, n) :: A
    real, dimension(n, 1) :: b, x
    real, dimension(n, n + 1) :: Ab

    call initialize(n, A, b, Ab)
    call gaussianElimination(n, Ab, x)

    print *, "Input:"
    print *, "A = "
    call printMatrix(A, shape(A))

    print *, "b = "
    call printMatrix(b, shape(b))

    print *, "Output:"
    print *, "x = "
    call printMatrix(x, shape(x))

    print *, "Modified A = "
    call printMatrix(Ab(1:n, 1:n), shape(A))

    print *, "Modified b = "
    call printMatrix(Ab(:, n + 1:n + 1), shape(b))
end program mainProgram