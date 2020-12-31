subroutine initialize(n, A, b, x, tolerance, weight)
    
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
    ! 
    ! weight = 1.5

    implicit none
    integer, intent(in) :: n 
    real, dimension(n, n), intent(out) :: A
    real, dimension(n), intent(out) :: b, x
    real, intent(out) :: tolerance, weight

    A = reshape((/ 5, 3, 3, -2, 9, -2, 3, -5, 7 /), shape(A))
    b = (/ 27, -11, 51 /)
    x = (/ 1, 2, 1 /)
    tolerance = 0.00001
    weight = 1.5

    ! Another example
    ! A = reshape((/ 10, 4, 1, -5, -10, 6, -2, 1, 10 /), shape(A))
    ! b = (/ 3, -3, -3 /)
    ! x = (/ 0, 0, 0 /)
    ! tolerance = 0.001
    ! weight = 1.4

    ! Another example
    ! A = reshape((/ 2, 1, 0, 1, 2, 1, 0, 1, 1 /), shape(A))
    ! b = (/ 1, 2, 4 /)
    ! x = (/ 1, 2, 1 /)
    ! tolerance = 0.001
    ! weight = 1.5


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


subroutine update(n, A, b, x, weight)
    ! Update step for SOR 
    implicit none
    integer, intent(in) :: n
    real, dimension(n, n), intent(in) :: A
    real, dimension(n), intent(in) :: b
    real, dimension(n), intent(inout) :: x
    real, intent(in) :: weight
    integer :: i, j
    real, dimension(n) :: x_new, x_sor

    do i = 1, n
        x_new(i) = b(i)
        do j = 1, n
            if (i < j) then
                x_new(i) = x_new(i) - a(i, j) * x(j)
            else if (i > j) then
                x_new(i) = x_new(i) - a(i, j) * x_new(j)
            end if
        end do
        ! SOR according to wikipedia 
        ! (To run this SOR, uncomment line 78 & 84 and comment out line 81 & 87)
        ! x_new(i) = (1 - weight) * x(i) + weight * x_new(i) / a(i, i)

        ! SOR according to slides
        x_new(i) = x_new(i) / a(i, i)
    end do
    ! SOR according to wikipedia
    ! x = x_new

    ! SOR according to slides
    x = weight * x_new + (1 - weight) * x
end subroutine update


subroutine SOR(n, A, b, x, tolerance, weight, max_iterations)
    implicit none
    integer, intent(in) :: n, max_iterations
    real, dimension(n, n), intent(in) :: A
    real, dimension(n), intent(in) :: b
    real, dimension(n), intent(inout) :: x
    real, intent(in) :: tolerance, weight

    integer :: k = 0
    real, dimension(n) :: x_old

    print *, ""
    print *, "Output:"
    print *, "          i       x1               x2               x3"
    print *, k, x

    do k = 1, max_iterations
        x_old = x
        call update(n, A, b, x, weight)
        print *, k, x
        if (maxval(abs(x - x_old)) < tolerance) exit
    end do
end subroutine SOR


program mainProgram
    implicit none
    integer, parameter :: n = 3    
    real, dimension(n, n) :: A
    real, dimension(n) :: b, x
    real :: tolerance, weight

    call initialize(n, A, b, x, tolerance, weight)

    print *, "Input:"
    print *, "A = "
    call printMatrix(A, shape(A))

    print *, "b =", b
    print *, "Tolerance =", tolerance
    print *, "Weight =", weight

    call SOR(n, A, b, x, tolerance, weight, 100)

end program mainProgram