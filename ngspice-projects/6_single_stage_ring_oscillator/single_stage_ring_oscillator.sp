** Single Stage Ring Oscillator : As voltage divider **

.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\nmos4p0.mod" 
.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\pmos4p0.mod" 
 
Vpower vdd 0 1 
Vgnd vss 0 0V 

MP0 in in vdd vdd P1 W=20u L=0.18u  
MN0 in in vss vss N1 W=10u L=0.18u  

* Initial Condition to Kickstart Oscillation 
.ic v(in) = 1 
.tran 1m 50m 
.control 
run 
plot v(in) 
.endc 
.end