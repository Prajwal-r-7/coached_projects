** D-ff ** 

.include "C:\ngspice-44.2_64\Spice64\bin\subinv.sp" 
.include "C:\ngspice-44.2_64\Spice64\bin\subtnp.sp" 
.include "C:\ngspice-44.2_64\Spice64\bin\subtrist.sp" 

VDD vdd 0 1v 
VSS vss 0 0 
Vclk clk 0 pulse(0 1 0n 0n 0n 5n 10n) 
vd d 0 pwl(0n 0v 8n 0v 8.3n 1v 30n 1v)  ; vary from 8n to 12n

Xd d dbar vdd vss inv 
Xclk clk clkbar vdd vss inv 
Xtran dbar clkbar clk tranout vdd vss trp 
Xin1 tranout tranoutb vdd vss inv 
Xtri1 tranoutb tranout clkbar clk vdd vss trist 
Xtri2 tranoutb trio clkbar clk vdd vss trist 
Xin2 trio triob vdd vss inv 
Xtri3 triob trio clk clkbar vdd vss trist 
Xq trio q vdd vss inv 

.tran 0.1n 22n 
.control 
run  

meas tran dvalue WHEN v(d)=0.5 
meas tran DtoC TRIG v(d) VAL=0.5 RISE=1 TARG v(clk) VAL=0.5 RISE=2 
meas tran CtoQ TRIG v(clk) VAL=0.5 RISE=2 TARG v(q) VAL=0.5 RISE=1 
meas tran DtoQ TRIG v(d) VAL=0.5 RISE=1 TARG v(q) VAL=0.5 RISE=1 

plot v(d) v(clk) v(q) 
.endc 
.end