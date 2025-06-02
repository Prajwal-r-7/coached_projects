* Delay Measurement circuit 3 *

.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\nmos4p0.mod"
.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\pmos4p0.mod"
.include "C:\ngspice-44.2_64\Spice64\bin\subtran.sp"
.include "C:\ngspice-44.2_64\Spice64\bin\subinv.sp"

Vpower vdd 0 1v
V1 a1 0 pulse(0 1 0m 1m 1m 10m 20m)
V2 b1 0 pulse(0 1 0m 1m 1m 20m 40m)
V3 s1 0 pulse(0 1 0m 1m 1m 40m 80m)
Vgnd vss 0 0v

Xi1 a1 aout vdd vss inv
Xi2 b1 bout vdd vss inv
Xi3 s1 sout vdd vss inv

Xt1 a1 b1 s1 sout vout1 vss transm
Xt2 aout bout s1 sout vout2 vss transm

Xci vout1 vout2 vdd vss crossinv

.tran 1m 80m

***** 1st part *****
** a1-->vout1 ** 
.measure tran a1-->vout1 TRIG v(a1) VAL=0.5 RISE=1 TARG v(vout1) VAL=0.5 RISE=1
** b1-->vout1 **
.measure tran b1-->vout1 TRIG v(b1) VAL=0.5 RISE=1 TARG v(vout1) VAL=0.5 RISE=1
** s1-->vout1 **
.measure tran s1-->vout1 TRIG v(s1) VAL=0.5 RISE=1 TARG v(vout1) VAL=0.5 RISE=1
** vout1-->vout2 **
.measure tran vout1-->vout2 TRIG v(vout1) VAL=0.5 RISE=1 TARG v(vout2) VAL=0.5 FALL=1

***** 2st part *****
** a1-->vout2 ** 
.measure tran a1-->vout2 TRIG v(a1) VAL=0.5 RISE=1 TARG v(vout2) VAL=0.5 FALL=1
** b1-->vout2 **
.measure tran b1-->vout2 TRIG v(b1) VAL=0.5 RISE=1 TARG v(vout2) VAL=0.5 FALL=1
** s1-->vout2 **
.measure tran s1-->vout2 TRIG v(s1) VAL=0.5 RISE=1 TARG v(vout2) VAL=0.5 FALL=1
** vout2-->vout1 **
.measure tran vout2-->vout1 TRIG v(vout2) VAL=0.5 FALL=1 TARG v(vout1) VAL=0.5 RISE=1

.control
run
plot v(vout2) v(vout1)
.endc
.end






