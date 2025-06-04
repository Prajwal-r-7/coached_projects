* pulse generator : AND gate *

.include "C:\ngspice-44.2_64\Spice64\bin\subpulsegen.sp"

Vdd vdd 0 1
Vss vss 0 0
Vpin a vss PULSE(0 1 0.2n 0n 0n 0.5n 1n)  

Xpulse a out vdd vss pulsegen

.tran 0.01n 3n

.control
run
meas tran Ton TRIG v(out) VAL=0.5 RISE=1 TARG v(out) VAL=0.5 FALL=1
meas tran Tp TRIG v(out) VAL=0.5 RISE=1 TARG v(out) VAL=0.5 RISE=2

let DC=Ton/Tp
print DC
plot v(a) v(out)

set color0=white
set color1=black
set xbrushwidth=2.5

.endc
.end