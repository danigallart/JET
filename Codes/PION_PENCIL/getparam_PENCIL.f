
      function getparam ()

C**********************************************************************C
C                                                                      C
C      NAME : GETPARAM                                                 C
C                                                                      C
C   PURPOSE : Reading parameters from command line.                    C
C                                                                      C
C     NOTES :                                                          C
C                                                                      C
C   VERSION : 1.0                                                      C
C                                                                      C
C----------------------------------------------------------------------C

      IMPLICIT NONE
      INCLUDE 'param'
      INCLUDE 'comgvl'
      INCLUDE 'comcon'

    ! Parameter
      logical getparam

    ! Function 
      integer iargc
      integer beginstr, endstr

    ! Variables
      integer       ia
      character*20  arg
      CHARACTER*128 filename, num1, num2, num3
      
      if (iargc().ne.7) then
         getparam = .FALSE.
      else
         getparam = .TRUE.

         do ia = 1, iargc()
            call getarg( ia, arg )
            if ((arg(1:1) .ne. '-') .or. (arg(2:2) .eq. 'h'))  then
               getparam = .FALSE.
            else if (arg(2:2) .eq. 's')  then
                     read( arg(3:), '(i10)' ) NSHOT
               else if (arg(2:2) .eq. 'n') then
                     read( arg(3:), '(i10)' ) INAME
                  else if (arg(2:2) .eq. 'u') then
                        read( arg(3:), '(a8)' ) WRIUID 
                     else if (arg(2:2) .eq. 't') then
                           read( arg(3:), '(f)' ) FAC_TEMP_ION 
                        else if (arg(2:2) .eq. 'd') then
                              read( arg(3:), '(f)' ) FAC_DENS_ION 
                           else if (arg(2:2) .eq. 'p') then
                                 read( arg(3:), '(f)' ) FAC_POWER 
                              else if (arg(2:2) .eq. 'e') then
                                    read( arg(3:), '(f)' ) FAC_ENERGY 
                                 else
                                    write (*,*)  " "
                                    write (*,*)  "  ERROR: ",arg(2:2), 
     &                                           " is not recognised!"
                                    write (*,*)  " "
                                    getparam = .FALSE.
                                 endif
         enddo
      endif
 
      if (getparam) then
         write (*,*) " INPUT:"
         write (*,*)  "   shot                   = ", NSHOT
         write (*,*)  "   run                    = ", INAME  
         write (*,*)  "   user id                = ", WRIUID
         write (*,*)  "   ion temperature factor = ", FAC_TEMP_ION
         write (*,*)  "   ion density factor     = ", FAC_DENS_ION
         write (*,*)  "   PINI power factor      = ", FAC_POWER 
         write (*,*)  "   PINI energy factor     = ", FAC_ENERGY

         write (num1,'(F10.2)') FAC_POWER
         write (num2,'(F10.2)') FAC_TEMP_ION
         write (num3,'(F10.2)') FAC_DENS_ION
         filename = 'out_' // num1(beginstr(num1):endstr(num1)) // '_'
     &                     // num2(beginstr(num2):endstr(num2)) // '_'
     &                     // num3(beginstr(num3):endstr(num3)) 
         write (*,('AA')) " OUTPUT                    = ", filename
         write (*,*)  " "
      else
         call getarg( 0, arg )
         write (*,*) "Param: ", arg, 
     &               " -h | -s0 -n0 -u0 -t0 -d0 -p0 -e0"
         write (*,*) "  -h : help (list of parameters)"
         write (*,*) "  -s : shot input"
         write (*,*) "  -n : run input"
         write (*,*) "  -u : user id"
         write (*,*) "  -t : ion temperature factor"
         write (*,*) "  -d : ion density factor"
         write (*,*) "  -p : PINI power factor"
         write (*,*) "  -e : PINI energy factor"
         write (*,*)  " "
      endif
     
      end 
