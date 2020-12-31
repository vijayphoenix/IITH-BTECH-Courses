subroutine initialize(n, A, b, Abi)
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
!                 | 5 -2  3  27 1 0 0|
! Abi(n*(2n+1)) = | 3  9 -5 -11 0 1 0|
!                 | 3 -2  7  51 0 0 1|

    implicit none
    integer, intent(in) :: n 
    real, dimension(n, n), intent(out) :: A
    real, dimension(n, 1), intent(out) :: b
    real, dimension(n, 2*n + 1), intent(out) :: Abi
    real, dimension(n, n) :: eye
    integer :: i

    A = reshape((/ 5, 3, 3, -2, 9, -2, 3, -5, 7 /), shape(A))
    b = reshape((/ 27, -11, 51 /), shape(b))

    ! Another example
    ! A = reshape((/ 1, 0, 0, -1, 0, 2, 2, -1, -1 /), shape(A))
    ! b = reshape((/ -8, -4, 6 /), shape(b))

    eye = 0
    do i = 1, n
        eye(i, i) = 1
    end do

    Abi(1:n, 1:n) = A
    Abi(:, n+1:n+1) = b
    Abi(:, n + 2:) = eye
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


subroutine pivot(Abi, n, j)
! Swap row `j` with another `row`  
    implicit none
    integer, intent(in) :: n, j
    real, dimension(n, 2*n + 1), intent(inout) :: Abi
    integer :: i, k
    real, dimension(2*n + 1) :: t

    k = j
    do i = j, n
        ! Swapping with the row having largest pivot
        if(abs(Abi(i, j)) > abs(Abi(k,j))) k = i
    end do

    ! Swap rows of `Ab`
    t = Abi(j, :)
    Abi(j, :) = Abi(k, :)
    Abi(k, :) = t
end subroutine


subroutine gaussJordan(n, Abi)
    implicit none
    integer, intent(in) :: n
    real, dimension(n, 2*n + 1), intent(inout) :: Abi

    integer :: i, j
    real :: b_i

    do i = 1, n
        ! Pivot element is zero
        if (Abi(i, i) .eq. 0) call pivot(Abi, n, i)
        do j = 1, n
            if (j .ne. i) Abi(j, :) = Abi(j, :)-Abi(i, :)*Abi(j, i)/Abi(i, i)
        end do
        Abi(i, :) = Abi(i, :)/Abi(i, i)
    end do

end subroutine gaussJordan


program mainProgram
    implicit none
    integer, parameter :: n = 3    
    real, dimension(n, n) :: A
    real, dimension(n, 1) :: b
    real, dimension(n, 2*n + 1) :: Abi

    call initialize(n, A, b, Abi)

    print *, "Input:"
    print *, "A = "
    call printMatrix(A, shape(A))

    print *, "b = "
    call printMatrix(b, shape(b))

    call gaussJordan(n, Abi)

    print *, "Output:"
    print *, "x = "
    call printMatrix(Abi(:, n + 1), shape(b))

    print *, "Inverse(A) = "
    call printMatrix(Abi(n + 1:, n + 1:), shape(A))

end program mainProgram