
      SUBROUTINE BESI2N(PVN, KN, PINT)

c **********************************************************************     
c
c This subroutine reads the bessel function and interpolates the value     
c for the specific PVN  without the pitch angle integral.    
c
c COMPUTATION: Jn-1*Jn+1
c
c    
c KN: is the order of the bessel function
c
c PVN: is the argument
c
c PINT: is the value of Jn
c
c **********************************************************************
 




      implicit none
     
      integer*4 kn,j,i
     
      Double precision PINT, PVN, ZCON, ZNT, a(1000,9), PINT1, PINT2
     
c Here we read from the file where
c COLUMN 1 = argument of bessel function.
c COLUMN 2-9 = value of the bessel function from order 0 till 7.

      OPEN(UNIT=1111, FILE='dcanaly.dat')
     
      do i=1,1000
      read(1111,*) (a(i,j), j=1,9)
      enddo
     
    
     
      if(KN.EQ.1) then
        i=1
     
        do while (PVN.GT.a(i,1))
          i=i+1
        enddo
        if(i.EQ.1) then
          PINT1=a(1,2)
          PINT2=a(1,4)
          PINT =PINT1*PINT2
        else
c Now the interpolation starts for ORDER = 1

          PINT1=(a(i,2)-a(i-1,2))/(a(i,1)-a(i-1,1))*(PVN-a(i-1,1))+a(i-1,2)
          PINT2=(a(i,4)-a(i-1,4))/(a(i,1)-a(i-1,1))*(PVN-a(i-1,1))+a(i-1,4)
          PINT=PINT1*PINT2
        endif
     
      elseif(KN.EQ.2) then
        i=1
     
        do while (PVN.GT.a(i,1))
          i=i+1
        enddo
      
        if(i.EQ.1) then
          PINT1=a(1,3)
          PINT2=a(1,5)
          PINT =PINT1*PINT2
        else
     
c Now the interpolation starts for ORDER = 2

          PINT1=(a(i,3)-a(i-1,3))/(a(i,1)-a(i-1,1))*(PVN-a(i-1,1))+a(i-1,3)
          PINT2=(a(i,5)-a(i-1,5))/(a(i,1)-a(i-1,1))*(PVN-a(i-1,1))+a(i-1,5)
          PINT=PINT1*PINT2
        endif

      elseif(KN.EQ.3) then
        i=1
     
        do while (PVN.GT.a(i,1))
          i=i+1
        enddo
      
        if(i.EQ.1) then
          PINT1=a(1,4)
          PINT2=a(1,6)
          PINT =PINT1*PINT2
        else
c Now the interpolation starts for ORDER = 3

          PINT1=(a(i,4)-a(i-1,4))/(a(i,1)-a(i-1,1))*(PVN-a(i-1,1))+a(i-1,4)
          PINT2=(a(i,6)-a(i-1,6))/(a(i,1)-a(i-1,1))*(PVN-a(i-1,1))+a(i-1,6)
          PINT=PINT1*PINT2
        endif
      endif
      
	  close(1111)
      return
      end
