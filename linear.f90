! ---------------------------------------
! Linear solver per matrici dense (LU)
! Ax=b
!
program linear
  use precision
  implicit none

  real(dp), allocatable :: A(:,:)
  real(dp), allocatable :: b(:), x(:)
  integer :: i, j, N, err
  integer, allocatable :: ipv(:)
  character(64) :: arg

  if (command_argument_count()<1) then
     write(*,*) 'linear N'
     stop
  end if

  call get_command_argument(1,arg)
  read(arg,*) N

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

  !print*,b

  x = b

  call dgesv(N,1,A,N,ipv,x,N,err) 

  !write(*,*) x

end program linear

