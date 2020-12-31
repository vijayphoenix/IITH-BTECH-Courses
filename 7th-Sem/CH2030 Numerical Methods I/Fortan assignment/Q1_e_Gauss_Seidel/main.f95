subroutine initialize(n, A, b, x, tolerance)
    
    ! Modify values in the function to change A, b
    ! 
    ! n = 3
    !          | 5 -2  3 |
    ! A(n*n) = | 3  9 -5 |
    !          | 3 -2  7 |
    !
    ! b(n) = | 27, -11, 51 |
    !
    ! x(n) = | 1, 2, 1 |
    ! 
    ! tolerance = 0.00001

    implicit none
    integer, intent(in) :: n 
    real, dimension(n, n), intent(out) :: A
    real, dimension(n), intent(out) :: b, x
    real, intent(out) :: tolerance

    A = reshape((/ 5, 3, 3, -2, 9, -2, 3, -5, 7 /), shape(A))
    b = (/ 27, -11, 51 /)
    x = (/ 1, 2, 1 /)
    tolerance = 0.00001
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


subroutine update(n, A, b, x)
    implicit none
    integer, intent(in) :: n
    real, dimension(n, n), intent(in) :: A
    real, dimension(n), intent(in) :: b
    real, dimension(n), intent(inout) :: x

    integer :: i, j
    real, dimension(n) :: x_new

    do i = 1, n
        x_new(i) = b(i)
        do j = 1, n
            if (i < j) then
                x_new(i) = x_new(i) - a(i, j) * x(j)
            else if (i > j) then
                x_new(i) = x_new(i) - a(i, j) * x_new(j)
            end if
        end do
        x_new(i) = x_new(i) / a(i, i)
    end do
    x = x_new
end subroutine update


subroutine gaussSeidel(n, A, b, x, tolerance, max_iterations)
    implicit none
    integer, intent(in) :: n, max_iterations
    real, dimension(n, n), intent(in) :: A
    real, dimension(n), intent(in) :: b
    real, dimension(n), intent(inout) :: x
    real, intent(in) :: tolerance

    integer :: k = 0

    real, dimension(n) :: x_old

    print *, ""
    print *, "Output:"
    print *, "          i       x1               x2               x3"
    print *, k, x

    do k = 1, max_iterations
        x_old = x
        call update(n, A, b, x)
        print *, k, x
        if (maxval(abs(x - x_old)) < tolerance) exit
    end do
end subroutine gaussSeidel


program mainProgram
    implicit none
    integer, parameter :: n = 3    
    real, dimension(n, n) :: A
    real, dimension(n) :: b, x
    real :: tolerance

    call initialize(n, A, b, x, tolerance)

    print *, "Input:"
    print *, "A = "
    call printMatrix(A, shape(A))

    print *, "b =", b
    print *, "Tolerance =", tolerance

    call gaussSeidel(n, A, b, x, tolerance, 100)

end program mainProgram