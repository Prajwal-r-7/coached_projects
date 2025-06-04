* inverter circuit

.include "C:\ngspice-44.2_64\Spice64\bin\subinv.sp"


Vpower vdd 0 1
Vgnd vss 0 0 
Vgate in vss PULSE(0 1 1n 100p 100p 0.5n 1n)  

Xinv1 in vout vdd vss inv
Xinv2 vout vout1 vdd vss inv
Xinv3 vout vout2 vdd vss inv
Xinv4 vout vout3 vdd vss inv
Xinv5 vout vout4 vdd vss inv

.tran 100p 10n

.measure tran trise TRIG v(vout) VAL=0.2 RISE=2 TARG v(vout) VAL=0.8 RISE=2
.measure tran tfall TRIG v(vout) VAL=0.8 FALL=2 TARG v(vout) VAL=0.2 FALL=2

.measure tran delayrise TRIG v(in) VAL=0.5 FALL=2 TARG v(vout) VAL=0.5 RISE=2
.measure tran delayfall TRIG v(in) VAL=0.5 RISE=2 TARG v(vout) VAL=0.5 FALL=2

.control 
 run 

plot  v(in) v(vout)
.endc
.end