* Inverter Subcircuit

*** Pins of subcircuit ***
.SUBCKT inv in out vdd vss

*** Include the path of NMOS and PMOS modules ***
.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\nmos4p0.mod"  
.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\pmos4p0.mod"   

*** Inverter Connection ***
mn out in vss vss N1 w=10u l=0.18u
mp out in vdd vdd P1 w=10u l=0.18u

.ENDS inv
	
