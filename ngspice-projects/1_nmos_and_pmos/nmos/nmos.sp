****** NMOS waveforms ****** 

.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\nmos4p0.mod"
Vpower vdd 0 1.5v
Vgnd vss 0 0v 
Vgate in vss 1.5v

****** including the NMOS transistor ****** 
MN0 vdd in vss vss N1 W=10u L=0.18u 

****** DC analysis ****** 
*.dc Vgate 0 1.5 0.1 Vpower 0 1.5 0.4  ; For Id vs Vgs
*.dc Vpower 0 2 0.1 Vgate 0 2 0.4      ; For Id vs Vds

.control  
 run 

****** plotting Ids vs Vgs ******
*plot i(Vgnd) vs v(in) 
****** plotting Ids vs Vds ****** 
*plot i(Vgnd) vs v(vdd) 

set color0=white
set color1=black
set xbrushwidth=2.5

.endc 
.end 