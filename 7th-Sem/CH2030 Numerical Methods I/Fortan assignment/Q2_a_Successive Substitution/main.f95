subroutine initialize(x, tolerance)

    implicit none
    real, dimension(2), intent(out) :: x
    real, intent(out) :: tolerance

    x = (/ 1, 1 /)
    tolerance = 0.0000001

    print *, "Input:"
    print *, "x = ", x
    print *, "Tolerance =", tolerance

    print *, ""
    print *, "F1(x, y) = 2(x^2) - 5(y^3) - 3"
    print *, "F2(x, y) = 3(x^3) - 2(y^2) - 26"
    print *, "f1(x, y) = x + 2(x^2) - 5(y^3) - 3"
    print *, "f2(x, y) = y + 3(x^3) - 2(y^2) - 26"

end subroutine initialize


real function f1(x)
    implicit none
    real, dimension(2), intent(in) :: x
    f1 = x(1) + 2*(x(1)**2) - 5*(x(2)**3) - 3

    ! Converges for the following choice of function
    ! f1 = x(1) - 0.2*(2*(x(1)**2) - 5*(x(2)**3) - 3)
end function f1


real function f2(x)
    implicit none
    real, dimension(2), intent(in) :: x
    f2 = x(2) + 3 * (x(1)**3) + 2 * (x(2)**2) - 26

    ! Converges for the following choice of function
    ! f2 = x(2) - 0.01 * (3*(x(1)**3) + 2*(x(2)**2) - 26)
end function f2


logical function is_inf_or_nan(x)
    ! Returns true if the array has Infinity or NAN value
    implicit none
    real, dimension(2), intent(in) :: x
    is_inf_or_nan =  (maxval(abs(x)) > huge(0.0)) .or. any(x /= x)
end function is_inf_or_nan


subroutine update(x)
    ! Update step for SS 
    implicit none
    real, dimension(2), intent(inout) :: x
    real, external :: f1, f2
    real, dimension(2) :: x_old
    x_old = x
    x(1) = f1(x_old)
    x(2) = f2(x_old) 
end subroutine update


subroutine SS(x, tolerance, max_iterations)
    implicit none
    real, dimension(2), intent(inout) :: x
    real, intent(in) :: tolerance
    integer, intent(in) :: max_iterations
    logical, external :: is_inf_or_nan
    integer :: k = 0
    real, dimension(2) :: x_old

    print *, ""
    print *, "Output:"
    print *, "          i       x1               x2"
    print *, k, x

    do k = 1, max_iterations
        x_old = x
        call update(x)
        if (is_inf_or_nan(x)) then
            print *, "Solution does not converge"
            print *, "x = ", x
            exit
        end if            
        print *, k, x
        if (maxval(abs(x - x_old)) < tolerance) then
            print *, "Solution converges"
            print *, "x = ", x
            exit
        end if
    end do
end subroutine SS


program mainProgram
    implicit none
    real, dimension(2) :: x
    real :: tolerance

    call initialize(x, tolerance)

    call SS(x, tolerance, 50)

end program mainProgram