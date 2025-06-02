* Subcircuit of transmission gate: Nmos and Pmos

*** Pins of subcircuit ***
.SUBCKT trp A i1 i2 o1 vdd vss

*** Include the path of NMOS and PMOS modules ***
.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\nmos4p0.mod"
.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\pmos4p0.mod"

*** Transmission gate Connection ***
mn A i1 o1 vss N1 w=10u l=0.18u
mp o1 i2 A vdd P1 w=10u l=0.18u

.ENDS trp
