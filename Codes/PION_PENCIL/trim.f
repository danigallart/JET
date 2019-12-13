
!********************************************************
      function endstr (str)
!********************************************************
      ! Parameters
      character*(*) str
      integer       endstr
 
      ! Variables
      integer       len


      do endstr = len(str), 1, -1
         if (str(endstr:endstr) .ne. ' ') return
      end do

      end 

!********************************************************
      function jumpchar (str, c)
!********************************************************

      ! Parameters
      character*(*) str
      character     c
      integer       searchchar
 
      ! Variables
      integer     i, endstr
      logical     found

      lenstr = endstr(str)
      found = .FALSE.

      i = 1
      do while ((i.LT.lenstr) .AND. (.NOT.found))
         if (str(i:i).EQ.c) then
             i = i + 1
         else
             found = .TRUE.
         endif
      enddo

      searchchar = i

      end 

!*******************************************************
      function beginstr (str)
!*******************************************************

      ! Parameters
      character*(*) str
      integer       beginstr
 
      beginstr = jumpchar(str,' ')

      end 

!*******************************************************
      function searchchar (str, c)
!*******************************************************

      ! Parameters
      character*(*) str
      character     c
      integer       searchchar
 
      ! Variables
      integer     i, endstr
      logical     found

      lenstr = endstr(str)
      found = .FALSE.

      i = 1
      do while ((i.LT.lenstr) .AND. (.NOT.found))
         if (str(i:i).EQ.c) then
             found = .TRUE.
         else
             i = i + 1
         endif
      enddo

      searchchar = i

      end 

