*subcircuit  tristate inverter
.SUBCKT trist in out pin nin vdd vss
.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\nmos4p0.mod"
.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\pmos4p0.mod"

mp1 pds pin vdd vdd P1 w=10u l=0.18u
mp2 out in pds vdd P1 w=10u l=0.18u
mn1 out in nsd vss N1 w=10u l=0.18u
mn2 nsd nin vss vss N1 w=10u l=0.18u

.ENDS trist
