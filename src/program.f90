program nonesense
  implicit none

  real(8) :: r_I(4), s_I(4)

  call get_natural_coordinates_quadrilateral(r_I, s_I)

  if (r_I(1) >= 0.d0) then
    write(*, *) r_I(4)
  else if (all(r_I(:) /= 0.d0)) then
    write(*, *) r_I(3)
  end if
end program nonesense


subroutine get_natural_coordinates_quadrilateral(r_I, s_I)
  ! 2005, Zienkiewicz, 'The Finite Element Method, Its Basis & Fundamentals', 6th Edition, p.157
  implicit none

  real(8), intent(out) :: r_I(4), s_I(4)

  r_I = [-1.d0, +1.d0, +1.d0, -1.d0]
  s_I = [-1.d0, -1.d0, +1.d0, +1.d0]
end subroutine get_natural_coordinates_quadrilateral