Program FEM1DHeat
  use LU
  use utilities
  implicit none

  real*8, pointer  ::  A(:,:)   !real matrix (n x n)
  real*8, pointer  ::  B(:)     !real vector (n)
  ! temp and indx are for LUDCMP and LUBKSB
  real*8, pointer  ::  temp(:)  !real temporary vector (n+1)
  integer, pointer ::  INDX(:)  !integer vector (n)
  integer          ::  d, rc !rc is return code, d i dont really use

  integer          ::  row, col !used in loops
  integer          ::  n = 3 !main N parameter, default here, immutable

  !plots
  integer          ::  m !nu of points in plot
  real*8, parameter::  temp0 = 0.0d+00 !temporary 0.0d+00 value

  !argument
  character(LEN=12)::  args1
  if (COMMAND_ARGUMENT_COUNT() > 0) then
    call GET_COMMAND_ARGUMENT(1, args1)
    read(args1, *) n
  end if
  !end argument

  m = 1000 ! num of points in plot

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
  B = temp0
  do row=1,n
    B(row) = 20.0*v(row-1, temp0, n)
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

    temp(0) = plot(B, n, m) ! temp(0) is not really used

  end if

end program FEM1DHeat

