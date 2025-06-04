** Hi-Latch **

.SUBCKT hilatch in out clk vdd vss
.include "C:\ngspice-44.2_64\Spice64\bin\subinv.sp"
.include "C:\ngspice-44.2_64\Spice64\bin\subtrist.sp"
.include "C:\ngspice-44.2_64\Spice64\bin\subtnp.sp"


Xin2 clk clkbar vdd vss inv

Xinv1 out out1 vdd vss inv
Xtri2 out1 out clk clkbar vdd vss trist

Xt1 in clk clkbar out vdd vss trp 

.ENDS hilatch


