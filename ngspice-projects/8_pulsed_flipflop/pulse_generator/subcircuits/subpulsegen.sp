** pulse genrator **

.SUBCKT pulsegen clk out vdd vss
.include "C:\ngspice-44.2_64\Spice64\bin\suband.sp"
.include "C:\ngspice-44.2_64\Spice64\bin\subinv.sp"

c1 clk2 0 53f

Xinv1 clk clk1 vdd vss inv
Xinv2 clk1 clk2 vdd vss inv
Xinv3 clk2 clk3 vdd vss inv
Xand clk clk3 out vdd vss and

.ENDS pulsegen
