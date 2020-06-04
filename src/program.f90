PROGRAM VSCode_Build
  IMPLICIT NONE

  INTEGER :: i, j
  INTEGER :: x, y
  INTEGER :: xyz(5, 10)
  INTEGER :: res

  x = 10
  y = 20
  WRITE(*,*) x ,y

  x = x * 2
  y = y * 3
  WRITE(*,*) x ,y

  res = x + y
  WRITE(*,*) res

  DO i = 1, 5
    DO j = 1, 10
      xyz(i, j) = i * j
    END DO
  END DO
END PROGRAM VSCode_Build