*Two-Input CMOS NOR Gate subckt

.SUBCKT norsub in1 in2 out vdd vss
.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\nmos4p0.mod"
.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\pmos4p0.mod"
mp1 vconn in1 vdd vdd P1 W=20u L=0.18u
mp2 out in2 vconn vdd P1 W=20u L=0.18u
mn1 out in1 vss vss N1 W=10u L=0.18u
mn2 out in2 vss vss N1 W=10u L=0.18u

.ENDS norsub





