** Delay Measurement Circuit 2 **

.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\nmos4p0.mod"
.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\pmos4p0.mod"
.include "C:\ngspice-44.2_64\Spice64\bin\subinv.sp"
.include "C:\ngspice-44.2_64\Spice64\bin\subtran.sp"

Vpower vdd 0 1v
V1 in1 0 pulse(0 1 0m 1m 1m 10m 20m)
V2 in2 0 pulse(0 1 0m 1m 1m 20m 40m)
Vgnd vss 0 0v

Xa in1 out1 vdd vss inv
Xb in2 out2 vdd vss inv
Xc vout out3 vdd vss inv

Xd out1 in1 in2 out2 vout vss transm

mp0 vout out3 vdd vdd P1 w=1u l=0.18u

.tran 0.1m 60m

**** part 1 ****
** in1-->out1 **
.measure tran in1-->out1 TRIG v(in1) VAL=0.5 RISE=1 TARG v(out1) VAL=0.5 FALL=1
** out1-->vout **
.measure tran out1-->vout TRIG v(out1) VAL=0.5 FALL=1 TARG v(vout) VAL=0.5 FALL=1
** in1-->vout **
.measure tran in1-->vout TRIG v(in1) VAL=0.5 RISE=1 TARG v(vout) VAL=0.5 FALL=1

**** part 2 ****
** in2-->out2 **
.measure tran in2-->out2 TRIG v(in2) VAL=0.5 RISE=1 TARG v(out2) VAL=0.5 FALL=1
** out2-->vout **
.measure tran out2-->vout TRIG v(out2) VAL=0.5 FALL=1 TARG v(vout) VAL=0.5 FALL=1
** in2-->vout **
.measure tran in2-->vout TRIG v(in2) VAL=0.5 RISE=1 TARG v(vout) VAL=0.5 FALL=1

**** part 3 ****
** vout-->out3 **
.measure tran vout-->out3 TRIG v(vout) VAL=0.5 FALL=1 TARG v(out3) VAL=0.5 RISE=1

**** A-->Y ****
** in1-->out3 **
.measure tran in1-->out3 TRIG v(in1) VAL=0.5 RISE=1 TARG v(out3) VAL=0.5 RISE=1

**** B-->Y ****
** in2-->out3 **
.measure tran in2-->out3 TRIG v(in2) VAL=0.5 RISE=1 TARG v(out3) VAL=0.5 RISE=1

.control
run
plot v(in2) v(out3) 
.endc
.end






