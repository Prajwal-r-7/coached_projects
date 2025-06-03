* Flip-Flop using Two Transmission gate with inverter Keeper circuit *

.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\nmos4p0.mod"
.include "C:\ngspice-44.2_64\Spice64\bin\subinv.sp"
.include "C:\ngspice-44.2_64\Spice64\bin\subtnp.sp"

VDD vdd 0 1
VSS vss 0 0
Vclk clk vss PULSE(0 1 0n 1n 1n 500n 1u)  ; 1 MHz Clock
Vd d vss PULSE(0 1 0n 1n 1n 2u 4u)        ; 250 kHz Data Input

c1 keep1 0 100p

Xin2 clk clkbar vdd vss inv

* 1st Keeper Circuit 
Xinv1 keep1 keepb1 vdd vss inv
Xinv2 keepb1 keep1 vdd vss inv

* 2nd Keeper Circuit 
Xinv3 q qb vdd vss inv
Xinv4 qb q vdd vss inv

* Two Transmission gate in Series  
**** working as ff with width of nmos and pmos is 20u in subcircuit 
Xt1 d clkbar clk keep1 vdd vss trp
Xt2 keep1 clk clkbar q vdd vss trp

.tran 1n 10u
.control
  run

plot v(d) v(clk)
plot  v(keep1) v(q)

set color0=white
set color1=black
set xbrushwidth=2.5

.endc
.end
