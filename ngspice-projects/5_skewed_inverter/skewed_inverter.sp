* Skewed inverter *
.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\nmos4p0.mod"
.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\pmos4p0.mod"

Vpower vdd 0 1v
Vgnd vss 0 0v
Vgate in 0 pulse(0 1 0n 1m 1m 20m 40m)

MP0 vout in vdd vdd P1 w=10u l=0.18u
MN0 vout in vss vss N1 w=10u l=0.18u
c1 vout 0 1n

*.tran 1m 100m
.dc Vgate 0 1 1m

.measure dc Vt FIND v(in) WHEN v(vout) = 0.5
.control
run

*plot v(in) v(vout)
plot v(vout) vs v(in)
.endc
.end
