** AND Gate **

.SUBCKT and inp inn aout vdd vss
.include "C:\ngspice-44.2_64\Spice64\bin\subinv.sp"
.include "C:\ngspice-44.2_64\Spice64\bin\subcktnand.sp"

Xnand inp inn aout1 vdd vss nandsub
Xinv aout1 aout vdd vss inv 

.ENDS and





