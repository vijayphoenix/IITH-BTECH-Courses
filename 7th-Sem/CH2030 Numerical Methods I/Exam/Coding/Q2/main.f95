subroutine initialize(x, tolerance)

    implicit none
    real, dimension(2), intent(out) :: x
    real, intent(out) :: tolerance

    x = (/ 0.1, 0.8 /)
    tolerance = 0.0000001

    print *, "Input:"
    print *, "x = ", x
    print *, "Tolerance =", tolerance

    print *, ""

end subroutine initialize

real function f(x)
    implicit none
    real, dimension(2), intent(in) :: x
    f = 100 * (((x(1)**2) - x(2))**2) + (1 - x(1))**2
end function f

real function df_x1(x)
    implicit none
    real, dimension(2), intent(in) :: x
    df_x1 = 400 * ((x(1)**2) - x(2)) * x(1)  - 2 * (1 - x(1))
end function df_x1

real function df_x2(x)
    implicit none
    real, dimension(2), intent(in) :: x
    df_x2 = 200 * (x(2) - (x(1)**2))
end function df_x2

subroutine update(x)
    implicit none
    real, dimension(2), intent(inout) :: x
    real, external :: f, df_x1, df_x2
    real, dimension(2) :: x_old, S

    S(1) = -1 * df_x1(x)
    S(2) = -1 * df_x2(x)

    x_old = x
    x(1) = x_old(1) + 0.001 * S(1) 
    x(2) = x_old(2) + 0.001 * S(2) 
end subroutine update


subroutine steepDescent(x, tolerance, max_iterations)
    implicit none
    real, dimension(2), intent(inout) :: x
    real, intent(in) :: tolerance
    integer, intent(in) :: max_iterations
    integer :: k = 0
    real, dimension(2) :: x_old

    print *, ""
    print *, "Output:"
    print *, "          i       x1               x2"
    print *, k, x

    do k = 1, max_iterations
        x_old = x
        call update(x)
        print *, k, x
        if (maxval(abs(x - x_old)) < tolerance) then
            print *, "Solution converges"
            print *, "x = ", x
            exit
        end if
    end do
end subroutine steepDescent


program mainProgram
    implicit none
    real, dimension(2) :: x
    real :: tolerance
    real, external :: f

    call initialize(x, tolerance)
    call steepDescent(x, tolerance, 1000)

    print *, "Final Answer after 1000 iterations"
    print *, "x = ", x

    print *, "Function value:"
    print *, "f(x) = ", f(x)

end program mainProgram