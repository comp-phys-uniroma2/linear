program linear
  use precision
  implicit none

  real(dp), allocatable :: A(:,:)
  real(dp), allocatable :: b(:), x(:)
  integer :: i, j, N, err
  integer, allocatable :: ipv(:)

  N = 10

  allocate(A(N,N))
  allocate(b(N))
  allocate(x(N))
  allocate(ipv(N))

  do i = 1, N
    do j = 1, N
      call random_number(A(i,j))
    end do 
    call random_number(b(i))
  end do

  print*,b

  x = b

  call dgesv(N,1,A,N,ipv,x,N,err) 

  write(*,*) x

end program linear

