*Two-Input CMOS NAND Gate subckt

.SUBCKT nandsub in1 in2 out vdd vss
.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\nmos4p0.mod"
.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\pmos4p0.mod"
mp1 out in1 vdd vdd P1 W=10u L=0.18u
mp2 out in2 vdd vdd P1 W=10u L=0.18u
mn1 out in1 vconn vss N1 W=10u L=0.18u
mn2 vconn in2 vss vss N1 W=10u L=0.18u

.ENDS nandsub





