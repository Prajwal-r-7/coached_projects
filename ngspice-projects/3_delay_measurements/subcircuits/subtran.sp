*subcircuit transmission gate : Nmos
.SUBCKT transm A1 A2 G1 G2 vout vss
.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\nmos4p0.mod"
m1 A1 G1 vout vss N1 w=10u l=0.18u
m2 A2 G2 vout vss N1 w=10u l=0.18u
.ENDS transm
