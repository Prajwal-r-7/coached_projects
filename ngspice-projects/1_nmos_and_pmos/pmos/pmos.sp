****** Pmos Waveforms ****** 

.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\pmos4p0.mod"
Vpower vdd 0 1.5v
Vgnd vss 0 0v
Vgate vdd in 1.5v

****** including the NMOS transistor ****** 
MP0 vss in vdd vdd P1 W=10u L=0.18u 	

****** DC analysis ****** 
.dc Vgate 0 1.5 0.1 Vpower 0 2 0.4   ; For id vs vgs
*.dc Vpower 0 1.5 0.1 Vgate 0 2 0.4  ; For id vs vds

.control 
 run 

****** plotting Ids vs Vgs *****
plot i(Vgnd) vs v(in,vdd) 
****** plotting Ids vs Vds ****** 
*plot i(Vgnd) vs v(vss,vdd) 

set color0=white
set color1=black
set xbrushwidth=2.5

.endc 
.end 