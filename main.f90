module utilities
  implicit none

contains
real*8 function CMVHMF(i, j, n)
  implicit none
  integer, intent(in)  :: i, j, n
  real*8 :: frm, to, temp

  frm = MAX(0.0 , x(i-1, n), x(j-1, n))
  to = MIN(x(i+1, n), x(j+1, n), 2.0)
  ! print *, i, j, frm, to
  temp = 0.0
  CMVHMF = v(i, temp, n)*v(j, temp, n) - integrals(frm, to, vprim_wprim, i, j, n)

end function CMVHMF

real*8 function vprim_wprim(i, j, value, n)
  implicit none
  real*8, intent(in)  :: value
  integer, intent(in)  :: i, j, n
  real*8 :: output, lv, mv, rv, n2

  lv = x(i-1, n)
  mv = x(i, n)
  rv = x(i+1, n)
  n2 = n

  output = n2**2 /4

  if (lv < value .and. value <= mv) then
    output = output
  else if (mv < value .and. value <= rv) then
    output = output * (-1)
  else
    output = 0.0
  end if

  lv = x(j-1, n)
  mv = x(j, n)
  rv = x(j+1, n)

  if (lv < value .and. value <= mv) then
    output = output
  else if (mv < value .and. value <= rv) then
    output = output * (-1)
  else
    output = 0.0
  end if

  vprim_wprim = output
end function vprim_wprim

real*8 function integrals(a, c, k, i, j, n)
  implicit NONE
  real*8, intent(in)  :: a, c
  integer, intent(in) ::  i, j, n
  real*8, external :: k
  real*8 :: abscissa(2)

  abscissa(1) = -0.577350269189625764509148780502D+00
  abscissa(2) = +0.577350269189625764509148780502D+00

  integrals = ((c-a)/2.0)*( k(i, j, ((c-a)/2.0 * abscissa(1) + (a+c)/2.0), n) + k(i, j, ((c-a)/2.0 * abscissa(2) + (a+c)/2.0), n) )
end function integrals

real*8 function x(i, n)
  implicit none
  integer, intent(in)  :: i, n
  real*8  :: i2, n2
  i2 = i
  n2 = n
  x = 2*i2/n2
end function x

real*8 function v(i, value, n)
  implicit none
  integer, INTENT(IN) :: i, n
  real*8, INTENT(IN) :: value
  real*8 :: n2
  n2 = n
  v = max(1.0 - abs(n2*((value - x(i, n))/2.0)), 0.0)
end function v

real*8 function suma(array, value, n)
  implicit none
  real*8, DIMENSION(:) :: array
  real*8 :: value
  integer, intent(in)  :: n
  integer :: i
  real*8 :: output
  output = 0.0
  i = 1

  do i=1,n
    output = output + (v(i-1, value, n)*array(i))
  end do

  suma = output
end function suma

real*8 function plot(B, n, m)
  use ogpf
  implicit none
  integer :: n, m
  integer :: row
  real*8, DIMENSION(:) :: B
  real*8, dimension(m+1) :: xv, yv
  real*8 :: xi
  TYPE(gpf)::gp

  do row=1,(m+1)
    xi = (2.0*(row-1))/m
    xv(row) = xi
    yv(row) = suma(B,xi,n)
  end do

! Annotation: set title, xlabel, ylabel
  CALL gp%title('Równanie trasportu ciepła')
  CALL gp%xlabel('x')
  CALL gp%ylabel('y')
  Call gp%options('set style data linespoints')
  !Call Plot to draw a vector against a vector of data
  CALL gp%plot(xv, yv)

  plot = 8.0
end function plot

end module
