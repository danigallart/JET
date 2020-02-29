!**********************************************************************
! COMPUTE THE AVERAGE ENERGY TO IONS FOR A COMPLETE THERMALIZATION    *
!**********************************************************************
!
!
!**********************************************************************
!           This program solves the integral presented in             *
!                T.H. Stix 1972 Plasma Physics 14 367                 *
!**********************************************************************
      PROGRAM avermax
      implicit none
      
      Real*8 A, B, dw, Wcrit, W, G, variable,  &
             KT, maxw, total, rang, DeltW, A0, B0, AN, BN, result, H, &
             H0, HN, Ecrit, gauss, vari, mu, E_N, E_0
      Integer*4 i, j, k, pp
      
      OPEN(UNIT = 10, FILE = 'avermaxH22.dat')
      OPEN(UNIT = 11, FILE = 'avermaxgauss2.dat')
      
      
      pp     = 2
      W      = 0.0
      total  = 1000.0
      rang   = 10000.0
      Wcrit  = 170.0
      result = 0.0
      DeltW  = 1000.0/rang
      E_0 = 0.0
      E_N = 1000.0

! COMPUTE FOR A MAXWELLIAN DISTRIBUTION
      if(pp .EQ. 1) then
        do i = 1, 1000
          KT = real(i)   
          W  = 0.0
! HERE WE COMPUTE EACH W/Wcrit
!          A0 = G(0.0,Wcrit,total)
          B0 = maxw(E_0,KT)
          H0 = B0
      
!          AN = G(Wcrit*10.0,Wcrit,total)
          AN = G(E_N,Wcrit,total)

!          BN = maxw(Wcrit*10.0,KT)
          BN = maxw(E_N,KT)

          HN = AN*BN
          result = 0.0_8
      
            do j = 1, int(rang)-1      
        
              W = W + DeltW
        
              A = G(W,Wcrit, total)
              B = maxw(W,KT)        
              H = A*B
        
              result = H + result
!              write(10,*) W, B, W/Wcrit, A*100
!              write(10,*) j,result
            enddo 
      
          result = (result + H0/2.0+HN/2.0)*DeltW 
          write(10,*) KT, result
  
!      write(6,*) KT, H0, A0, B0, HN, result*100.0
         enddo
      close(10)
      
      else
! COMPUTE FOR A GAUSSIAN DISTRIBUTION      
        do i = 1, 1000
          KT = real(i)
          vari = KT*0.20   
          W  = 0.0

! HERE WE COMPUTE EACH W/Wcrit
!          A0 = G(0.0,Wcrit,total)
          B0 = gauss(E_0,KT, vari)
          H0 = B0
      
!          AN = G(Wcrit*10.0,Wcrit,total)
          AN = G(E_N,Wcrit,total)

!          BN = maxw(Wcrit*10.0,KT)
          BN = gauss(E_N,KT,vari)

          HN = AN*BN
          write(6,*) KT
          result = 0.0
      
            do j = 1, int(rang)-1      
        
              W = W + DeltW
        
              A = G(W,Wcrit, total)
              B = gauss(W,KT,vari)        
              H = A*B
        
              result = H + result
!              write(10,*) W, B, W/Wcrit, A*100
!              write(10,*) j,result
            enddo 
      
        result = (result + H0/2.0+HN/2.0)*DeltW 
        write(11,*) KT, result
  
!        write(6,*) KT, H0, A0, B0, HN, result*100.0
        enddo
      close(11)
      endif
      end

      
! FUNCTION G(W)      
      Real*8 function G(W,Wcrit, total)
      
      implicit none
      Real*8 dw, Wcrit, W, variable, func0, funcn, linferior, &
             lsuperior, total, rang, DeltW, suma 
      Integer*4 i, j, k
      
      
        linferior = 0.0
        lsuperior = W/Wcrit
      
        dw = (W/Wcrit)/total
      
        func0 = 1.0/(1.0+linferior**(1.5))
        funcn = 1.0/(1.0+lsuperior**(1.5))
      
        variable = dw        
        G     = 0.0
        suma  = 0.0      

! HERE WE INTEGRATE TO OBTAIN G (from Stix) 
      
        do i = 1, int(total)-1
          suma = suma + 1.0/(1.0+(variable)**(1.5))
          variable = variable + dw
        enddo

! G IS THE VALUE FOR A SPECIFIC W
      
        G = Wcrit/W*(func0/2.0 + suma + funcn/2.0)*dw
                 
      return
      end function G



! MAXWELLIAN DISTRIBUTION FUNCTION      
      Real*8 function maxw(E,KT)
      
      implicit none
      Real*8 E, KT, pi
        pi = 3.14
      
        maxw = 2.0*sqrt(E/pi)*(1.0/KT)**(1.5)*exp(-E/KT) 
      return
      end function maxw

! GAUSSIAN DISTRIBUTION FUNCTION      
      Real*8 function gauss(E,mu,vari)
      
      implicit none
      Real*8 E, mu, vari, pi
        pi = 3.14
     
      
        gauss = 1.0/(2.0*pi*vari)**(0.5)*exp(-1.0*(E-mu)**2/(2.0*vari))
      return
      end function gauss          
      
!CRITICAL ENERGY CALCULATION      
      Real*8 function Ecrit(Te)
      implicit none
! k is the number of ion species in the plasma        
      integer*4, parameter :: k = 5 

      Real*8 n(k), ne, Z(k), A(k), E(k), Te, sumacrit
      Integer*4 i, j
        
! Assign values to variables
       
        n(1) = 1.3e18         
        n(2) = 5.7e19
        n(3) = 2.3e18
        n(4) = 7.9e17
        n(5) = 7.9e17
        ne   = 7.7e19

        A(1) = 1.
        A(2) = 2.
        A(3) = 12.              
        A(4) = 9.
        A(5) = 4.
        
        Z(1) = 1.      
        Z(2) = 1.
        Z(3) = 6.
        Z(4) = 4.
        Z(5) = 2.                             
                 
        Te   = 5.8         
                                                
        sumacrit = 0.
        
        do i = 1, k
          sumacrit = sumacrit + n(i)*Z(i)**2/(ne*A(i))
        enddo
        
!        do i = 1, k
          Ecrit = 14.8*A(2)*Te*(sumacrit)**(2/3)
!        enddo
        
!        do i = 1, k
!          write(*,*) 'Critical energy', i, '=', E(i)
!        enddo 
      return
      end function Ecrit      
      
      
      
      
      
      
      
      
      


