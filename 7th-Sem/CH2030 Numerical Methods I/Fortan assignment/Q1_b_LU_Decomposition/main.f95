subroutine initialize(n, A, b)
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

    implicit none
    integer, intent(in) :: n 
    real, dimension(n, n), intent(out) :: A
    real, dimension(n, 1), intent(out) :: b

    A = reshape((/ 5, 3, 3, -2, 9, -2, 3, -5, 7 /), shape(A))
    b = reshape((/ 27, -11, 51 /), shape(b))

    ! Another example

    ! A = reshape((/ 2, -4, -4, -1, 6, -2, -2, 3, 8 /), shape(A))
    ! b = reshape((/ -1, 5, 2 /), shape(b))
    
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


subroutine LU(n, A, L, U)
    implicit none
    integer, intent(in) :: n
    real, dimension(n, n), intent(in) :: A
    real, dimension(n, n), intent(out) :: L, U
    integer :: i, j, k
    real :: sum

    L = 0
    U = A
    do k = 1, n
        ! Diagonal elements are unity
        L(k, k)=1
        do i = k+1, n
            L(i, k) = U(i, k)/U(k, k)
            do j = 1, n
                U(i, j) = U(i, j)-L(i, k)*U(k, j)
            end do
        end do
    end do
end subroutine LU

subroutine fowardSweep(n, L, y, b)
    implicit none
    integer, intent(in) :: n
    real, dimension(n, n), intent(in) :: L
    real, dimension(n, 1), intent(inout) :: y, b
    integer :: i, j

    do i = 1, n
        do j = 1, i-1
            b(i, 1) = b(i, 1) - L(i, j) * y(j, 1)
        end do
        y(i, 1) = b(i, 1) / L(i, i)
    end do


end subroutine fowardSweep

subroutine revereseSweep(n, U, x, y)
    implicit none
    integer, intent(in) :: n
    real, dimension(n, n), intent(in) :: U
    real, dimension(n, 1), intent(inout) :: x, y
    integer :: i, j

    do i = n, 1, -1
        do j = i + 1, n
            y(i, 1) = y(i, 1) - U(i, j)*x(j, 1)
        end do
        x(i, 1) = y(i, 1) / U(i, i)
    end do

end subroutine revereseSweep


program mainProgram
    implicit none
    integer, parameter :: n = 3
    real, dimension(n, n) :: A, L, U
    real, dimension(n, 1) :: b, x, y

    call initialize(n, A, b)

    print *, "Input:"
    print *, "A = "
    call printMatrix(A, shape(A))

    print *, "b = "
    call printMatrix(b, shape(b))

    ! A = LU
    call LU(n, A, L, U)
    ! Ly = b
    call fowardSweep(n, L, y, b)
    ! Ux = y
    call revereseSweep(n, U, x, y)


    print *, "Output:"
    print *, "x = "
    call printMatrix(x, shape(x))

    print *, "L = "
    call printMatrix(L, shape(L))

    print *, "U = "
    call printMatrix(U, shape(U))

    print *, "y = "
    call printMatrix(y, shape(y))
    
    print *, "Modified b = "
    call printMatrix(b, shape(b))

end program mainProgram