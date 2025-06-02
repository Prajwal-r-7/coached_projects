* Delay measurement circuit 1 *

*** Include path of Inverter and Transmission gate subcircuits ***
.include "C:\ngspice-44.2_64\Spice64\bin\subinv.sp"
.include "C:\ngspice-44.2_64\Spice64\bin\subtnp.sp"

Vpower vdd 0 1v
V1 a1 0 pulse(0 1 0m 1m 1m 10m 20m)
V2 b1 0 pulse(0 1 0m 1m 1m 20m 40m)
V3 s1 0 pulse(0 1 0m 1m 1m 40m 80m)
Vgnd vss 0 0v

Xi1 s1 sout vdd vss inv
Xi2 o1 oout vdd vss inv

Xt1 a1 s1 sout o1 vdd vss trp
Xt2 b1 sout s1 o1 vdd vss trp

.tran 1m 80m

** inverter delay: s1 --> sout **
.measure tran s1-->sout: TRIG v(s1) VAL=0.5 RISE=1 TARG v(sout) VAL=0.5 FALL=1

** 1st transmission gate delay: a1 --> o1 **
.measure tran a1-->o1 TRIG v(a1) VAL=0.5 RISE=1 TARG v(o1) VAL=0.5 RISE=1

** 2nd transmission gate delay: b1 --> o1 **
.measure tran b1-->o1 TRIG v(b1) VAL=0.5 RISE=1 TARG v(o1) VAL=0.5 RISE=1

** s1 --> o1 **
.measure tran s1-->o1 TRIG v(s1) VAL=0.5 RISE=1 TARG v(o1) VAL=0.5 RISE=1

** o1 --> oout **
.measure tran o1-->oout TRIG v(o1) VAL=0.5 RISE=1 TARG v(oout) VAL=0.5 FALL=1

** a1 --> oout **
.measure tran a1-->oout TRIG v(a1) VAL=0.5 RISE=1 TARG v(oout) VAL=0.5 FALL=1

** b1 --> oout **
.measure tran b1-->oout TRIG v(b1) VAL=0.5 RISE=1 TARG v(oout) VAL=0.5 FALL=1

** s1 --> oout **
.measure tran s1-->oout TRIG v(s1) VAL=0.5 RISE=1 TARG v(oout) VAL=0.5 FALL=1

.control
run
plot v(s1) v(oout)
.endc
.end






