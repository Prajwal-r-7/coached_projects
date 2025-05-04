** Inverter circuit **

.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\nmos4p0.mod"
.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\pmos4p0.mod" 

Vpower vdd 0 1
Vgnd vss 0 0 
Vgate in vss PULSE(0 1 0m 1m 1m 20m 40m)  ; Only for in vs out waveform 
*Vgate in vss dc 5                        

** Inverter Circuit Connection **
MP0 vout in vdd vdd P1 W=10u L=0.18u 
MN0 vout in vss vss N1 W=10u L=0.18u 
c1 vout 0 1n

*.tran 1m 100m     ; For in vs out waveform
.dc Vgate 0 1 1m

** Measuring Vt for an inverter **
.measure dc Vt FIND v(in) WHEN v(vout)=0.5 

.control 
 run


** plotting Vin vs Vout ** 
*plot v(in) v(vout) 

** plotting Vout vs Vin ** (voltage transfer characteristics)
plot v(vout) vs v(in) 

** plotting Id vs Vgs ** 
*plot i(Vgnd) vs v(in)

.endc
.end