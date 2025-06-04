* two input NAND circuit

.include "C:\ngspice-44.2_64\Spice64\bin\subcktnand.sp"

Vpower vdd 0 1
Vgnd vss 0 0 
Vgate1 in1 vss PULSE(0 1 1n 100p 100p 0.5n 1n)  
Vgate2 in2 vss PULSE(0 1 1n 100p 100p 0.5n 1n)  

Xinv1 in1 in2 vout vdd vss nandsub
Xinv2 vout vout out1 vdd vss nandsub
Xinv3 vout vout out2 vdd vss nandsub
Xinv4 vout vout out3 vdd vss nandsub
Xinv5 vout vout out4 vdd vss nandsub

.tran 100p 10n

.measure tran trise TRIG v(vout) VAL=0.2 RISE=2 TARG v(vout) VAL=0.8 RISE=2
.measure tran tfall TRIG v(vout) VAL=0.8 FALL=2 TARG v(vout) VAL=0.2 FALL=2

.measure tran delayrise1 TRIG v(in1) VAL=0.5 FALL=2 TARG v(vout) VAL=0.5 RISE=2
.measure tran delayfall1 TRIG v(in1) VAL=0.5 RISE=2 TARG v(vout) VAL=0.5 FALL=2

.measure tran delayrise2 TRIG v(in2) VAL=0.5 FALL=2 TARG v(vout) VAL=0.5 RISE=2
.measure tran delayfall2 TRIG v(in2) VAL=0.5 RISE=2 TARG v(vout) VAL=0.5 FALL=2

.control 
 run 

plot  v(in1) v(in2) v(vout)
.endc
.end