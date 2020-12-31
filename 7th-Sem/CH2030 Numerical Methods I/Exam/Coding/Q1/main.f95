subroutine initialize(x, tolerance)

    implicit none
    real, dimension(2), intent(out) :: x
    real, intent(out) :: tolerance

    x = (/ 0.1, 0.8 /)
    tolerance = 0.0000001

    print *, "Input:"
    print *, "x = ", x
    print *, "Tolerance =", tolerance

end subroutine initialize

real function f(x)
    implicit none
    real, dimension(2), intent(in) :: x
    f = 100 * (((x(1)**2) - x(2))**2) + (1 - x(1))**2
end function f

real function f1(x)
    implicit none
    real, dimension(2), intent(in) :: x
    f1 = 400 * (x(1)**2 - x(2)) * x(1) + 2 * (x(1) - 1)
end function f1


real function f2(x)
    implicit none
    real, dimension(2), intent(in) :: x
    f2 = 200 * (x(2) - x(1)**2)
end function f2


real function df1_x1(x)
    implicit none
    real, dimension(2), intent(in) :: x
    df1_x1 = 1200 * x(1)**2 - 400 * x(2) + 2
end function df1_x1


real function df1_x2(x)
    implicit none
    real, dimension(2), intent(in) :: x
    df1_x2 = -400 * x(1)
end function df1_x2


real function df2_x1(x)
    implicit none
    real, dimension(2), intent(in) :: x
    df2_x1 = -400 * x(1)
end function df2_x1


real function df2_x2(x)
    implicit none
    real, dimension(2), intent(in) :: x
    df2_x2 = 200
end function df2_x2

subroutine matrixMultiplication(a, b, shape_a, shape_b, result)
    implicit none
    integer, dimension(2), intent(in) :: shape_a, shape_b
    real, dimension(shape_a(1), shape_a(2)) :: a
    real, dimension(shape_b(1), shape_b(2)) :: b
    real, dimension(shape_a(1), shape_b(2)) :: result
    integer :: i, j, k

    if (shape_a(2) /= shape_b(1)) then
        print *, "Matrices non compatiable"
        stop
    end if

    do i = 1, shape_a(1)
        do j = 1, shape_b(2)
            result(i, j) = 0
            do k = 1, shape_a(2)
                result(i, j) = result(i, j) + a(i, k) * b(k, j)
            end do
        end do
    end do
end subroutine matrixMultiplication

subroutine JacobianInverse(x, j_inverse)
    implicit none
    real, dimension(2), intent(in) :: x
    real, dimension(2, 2), intent(out) :: j_inverse
    real, external :: df1_x1, df1_x2, df2_x1, df2_x2
    real :: a, b, c, d

    a = df1_x1(x)
    b = df2_x1(x)
    c = df1_x2(x)
    d = df2_x2(x)

    j_inverse = reshape([d, -b, -c, a], shape(j_inverse))
    j_inverse = j_inverse / (a * d - b * c)
end subroutine JacobianInverse


logical function is_inf_or_nan(x)
    ! Returns true if the array has Infinity or NAN value
    implicit none
    real, dimension(2), intent(in) :: x
    is_inf_or_nan =  (maxval(abs(x)) > huge(0.0)) .or. any(x /= x)
end function is_inf_or_nan


subroutine update(x)
    ! Update step for newtonRaphson 
    implicit none
    real, dimension(2), intent(inout) :: x
    real, external :: f1, f2
    real, dimension(2) :: x_old
    real, dimension(2, 2) :: j_inverse
    real, dimension(2, 1) :: FX, ans

    call JacobianInverse(x, j_inverse)
    FX = reshape([f1(x), f2(x)], shape(FX))
    call matrixMultiplication(j_inverse, FX, shape(j_inverse), shape(FX), ans)

    x_old = x
    x(1) = x_old(1) - ans(1, 1)
    x(2) = x_old(2) - ans(2, 1)
end subroutine update


subroutine newtonRaphson(x, tolerance, max_iterations)
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
end subroutine newtonRaphson


program mainProgram
    implicit none
    real, dimension(2) :: x
    real, external :: f
    real :: tolerance

    call initialize(x, tolerance)
    call newtonRaphson(x, tolerance, 50)


    print *, "Minima found at:"
    print *, "x = ", x

    print *, "Function value:"
    print *, "f(x) = ", f(x)


end program mainProgram