!**********************************************************************
!*           COMPUTE FAST ION TEMPERATURE SCREENING AS IN             *
!*     F.J. Casson Plasma Ph. Control. Fusion 57 (2015) 014031        *
!**********************************************************************
      implicit none
      real temp(2,20), dens_fast(2,20), gradtemp(19), screening(19),  &
          pos(20), dens_therm(2,20), temp_therm(2,20),                & 
          gradtemp_therm(19), screening_therm(19)
      integer i,j,k
      
      OPEN(UNIT = 1,  FILE = 'Teff_92314.data')
      OPEN(UNIT = 2,  FILE = '92314_DD.dat')
      OPEN(UNIT = 3,  FILE = '92314_screening2.dat')
      OPEN(UNIT = 4,  FILE = '92314_fastd.dat')
      OPEN(UNIT = 10, FILE = '92314_Te.dat')
! COMPUTE THE GRADIENT
      
      do j = 1,20
       read(1,*) (temp(i,j), i = 1,2)
      enddo
      
      close(1)
      
      do j = 1, 20
       pos(j) = temp(1,j)
      enddo
      
      do j = 1,20
       read(4,*) (dens_fast(i,j), i = 1,2)
      enddo
      
      close(4)

      do j = 1,20
       read(2,*) (dens_therm(i,j), i = 1,2)
      enddo      
      
      close(2)
      
      do j = 1,20
       read(10,*) (temp_therm(i,j), i = 1,2)
      enddo
      
      close(10)
      
!      do j = 1,20
!       write(6,*) (temp(i,j), i = 1,2)
!      enddo
      
      do j = 1,19
       gradtemp(j) = (temp(2,j+1) - temp(2,j))/(temp(1,j+1)-temp(1,j))
      enddo
      
      do j = 1,19
       gradtemp_therm(j) = (temp_therm(2,j+1) - temp_therm(2,j))/     &
       (temp_therm(1,j+1)-temp_therm(1,j))
      enddo
      
      
!      do j = 1, 19
!       write(6,*) gradtemp(j)
!      enddo
      
! COMPUTE THE SCALING OF THE SCREENING AS n_iT_i^(-1/2)1/L_Ti
      
      do j = 1,19
        screening(j) = dens_fast(2,j)*temp(2,j+1)**(-1.5)*gradtemp(j)
      enddo
      
      do j = 1,19
        screening_therm(j) = dens_therm(2,j)*temp_therm(2,j+1)**(-1.5)&
      *gradtemp_therm(j)
      enddo
      
      do j = 1,19
       write(3,*) pos(j), screening(j), screening_therm(j),           &
       screening(j)/screening_therm(j)
      enddo
      
      close(3)
               
      end
