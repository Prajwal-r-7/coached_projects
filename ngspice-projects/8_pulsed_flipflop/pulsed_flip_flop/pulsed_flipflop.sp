*Pulsed Filp-Flop*

.include "C:\ngspice-44.2_64\Spice64\bin\subpulsegen.sp"
.include "C:\ngspice-44.2_64\Spice64\bin\subhilatch.sp"

Vdd vdd 0 1
Vss vss 0 0

Vd d vss PULSE(0 1 0n 1p 1p 1.5n 3n)  
Vclk clk vss PULSE(0 1 1n 1p 1p 1n 2n)  

Xpulse clk clkb vdd vss pulsegen
Xhilatch d dout clkb vdd vss hilatch

.tran 0.01n 8n

.control
run

plot v(d) v(clk) v(dout)

set color0=white
set color1=black
set xbrushwidth=2.5

.endc
.end