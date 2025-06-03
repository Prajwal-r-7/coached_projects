* nine ring oscillator

.include "C:\ngspice-44.2_64\Spice64\bin\subinv.sp"
.include "C:\ngspice-44.2_64\Spice64\bin\subcktnand.sp"

Vpower vdd 0 1v
Vgnd vss 0 0
Venab in1 vss pwl(0n 0 2n 0 2n 1)


Xnand in1 out9 out1 vdd vss nandsub
Xa1 out1 out2 vdd vss inv
Xa2 out2 out3 vdd vss inv
Xa3 out3 out4 vdd vss inv
Xa4 out4 out5 vdd vss inv
Xa5 out5 out6 vdd vss inv
Xa6 out6 out7 vdd vss inv
Xa7 out7 out8 vdd vss inv
Xa8 out8 out9 vdd vss inv

.tran 1n 8n
.control
run
**** 9-stage inverter ****
meas tran tperiod TRIG v(out1) VAL=0.5 FALL=4 TARG v(out1) VAL=0.5 FALL=5
meas tran pw1 TRIG v(out1) VAL=0.5 FALL=4 TARG v(out1) VAL=0.5 RISE=4
meas tran pw2 TRIG v(out1) VAL=0.5 RISE=4 TARG v(out1) VAL=0.5 FALL=5
*meas tran I_avg AVG i(Vpower)

meas tran I_avg AVG i(Vpower) from=2n to=7n
let power=1*I_avg 
print power

**** 
let tp=pw1+pw2
print tp
let dt=pw2/tp
print dt


plot v(in1) v(out1)
*plot i(Vpower)

set color0=white
set color1=black
set xbrushwidth=2.5
.endc
.end



