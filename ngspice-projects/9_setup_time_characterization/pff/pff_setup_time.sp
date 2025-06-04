*Pulsed Filp-Flop*

.include "C:\ngspice-44.2_64\Spice64\bin\subpulsegen.sp"
.include "C:\ngspice-44.2_64\Spice64\bin\subhilatch.sp"

Vdd vdd 0 1
Vss vss 0 0
Vclk clk vss PULSE(0 1 2n 1p 1p 5n 10n) 
Vd d vss PWL(0n 0 0.5n 0 0.8n 1 20n 1)   ; vary from 0.5n to 2.5n

Xpulse clk clkb vdd vss pulsegen
Xhilatch d dout clkb vdd vss hilatch

.tran 0.01n 20n

.control
run
meas tran dvalue WHEN v(d)=0.5 
meas tran DtoC TRIG v(d) VAL=0.5 RISE=1 TARG v(clk) VAL=0.5 RISE=1
meas tran CtoQ TRIG v(clk) VAL=0.5 RISE=1 TARG v(dout) VAL=0.5 RISE=1 
meas tran DtoQ TRIG v(d) VAL=0.5 RISE=1 TARG v(dout) VAL=0.5 RISE=1 

plot v(d) v(clk) v(dout)

set color0=white
set color1=black
set xbrushwidth=2.5

.endc
.end