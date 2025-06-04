* three input NAND circuit

.include "C:\ngspice-44.2_64\Spice64\bin\subnor3.sp"

Vpower vdd 0 1
Vgnd vss 0 0 
Vgate1 in1 vss PULSE(0 1 1n 100p 100p 0.5n 1n)  
Vgate2 in2 vss PULSE(0 1 1n 100p 100p 0.5n 1n)  
Vgate3 in3 vss PULSE(0 1 1n 100p 100p 0.5n 1n)  

Xinv1 in1 in2 in3 vout vdd vss nor3
Xinv2 vout vout vout out1 vdd vss nor3
Xinv3 vout vout vout out2 vdd vss nor3
Xinv4 vout vout vout out3 vdd vss nor3
Xinv5 vout vout vout out4 vdd vss nor3

.tran 100p 10n

.measure tran trise TRIG v(vout) VAL=0.2 RISE=2 TARG v(vout) VAL=0.8 RISE=2
.measure tran tfall TRIG v(vout) VAL=0.8 FALL=2 TARG v(vout) VAL=0.2 FALL=2

.measure tran delayrise1 TRIG v(in1) VAL=0.5 FALL=2 TARG v(vout) VAL=0.5 RISE=2
.measure tran delayfall1 TRIG v(in1) VAL=0.5 RISE=2 TARG v(vout) VAL=0.5 FALL=2

.control 
 run 

plot  v(in1) v(vout)
.endc
.end