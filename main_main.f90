Program test_lu_solver
  USE LU
  use utilities
  implicit none

  real*8, pointer ::  A(:,:)   !real matrix (n x n)
  real*8, pointer ::  B(:)     !real vector (n)
  real*8, pointer ::  temp(:)  !real temporary vector (n+1)
  integer,pointer ::  INDX(:)  !integer vector (n)
  real*8 :: temp2

  integer :: i, d, rc

  integer :: n = 3
  integer :: row, col

  !plots
  integer :: m
  real*8 :: xi, y
  CHARACTER(LEN=12) :: args1

  if (COMMAND_ARGUMENT_COUNT() > 0) then
    call GET_COMMAND_ARGUMENT(1, args1)
    read(args1, *) n
  end if

  m = 1000

  !dynamic allocations
  allocate(A(n,n))
  allocate(B(n))
  allocate(temp(n+1))
  allocate(INDX(n))

  do row=1,n
    do col=1,n
      A(col,row) = CMVHMF(row-1, col-1, n)
    end do
  end do


  ! Vector B
  temp2 = 0.0
  B = temp2
  do row=1,n
    B(row) = 20.0*v(row-1, temp2, n)
  end do

!call LU decomposition routine
  call LUDCMP(A,n,INDX,D,rc)

!call appropriate solver if previous return code is ok
  if (rc.eq.0) then
    call LUBKSB(A,n,INDX,B)
  endif

!print results or error message
  if (rc.eq.1) then
    write(*,*) ' The system matrix is singular, no solution !'
  else
    ! xi = plot(B, n, m)


  end if

end program test_lu_solver

