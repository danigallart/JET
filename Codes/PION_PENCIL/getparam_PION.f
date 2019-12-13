
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

      ! Parameter
      logical getparam

      ! Function 
      integer iargc
      integer searchchar, endstr

      ! Variables
      integer       ia
      CHARACTER*128 arg
      
      if (iargc().gt.1) then
         getparam = .FALSE.
      else
         getparam = .TRUE.
         call getarg ( 1, INPUT_FILE )
         TEST_NAME = INPUT_FILE( searchchar(INPUT_FILE,'_')+1:
     &                           endstr(INPUT_FILE) )
      endif
 
      if (getparam) then
         write (*,('AA')) " INPUT  file = ", INPUT_FILE
         write (*,('AA')) " OUTPUT file = ", TEST_NAME
         write (*,*)  " "
      else
         call getarg( 0, arg )
         write (*,*) "Param: ", arg, " -h | [input_file]"
         write (*,*) "  -h : help (list of parameters)"
         write (*,*) "  input file from the nbp2 application"
         write (*,*)  " "
      endif
     
      end 
