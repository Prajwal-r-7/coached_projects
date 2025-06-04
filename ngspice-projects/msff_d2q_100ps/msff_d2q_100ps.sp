** MSFF setup + clk to q : 100ps **

.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\nmos4p0.mod"
.include "C:\ngspice-44.2_64\Spice64\examples\soi\bsim4soi\pmos4p0.mod"

vpower vdd 0 1
vclk clk vss pulse (0 1 1n 100ps 100ps 0.5ns 1ns)
vin in vss pulse(0 1 0.88n 200ps 200ps 5n 10ns)
vgnd vss 0 0

***************************************************
****CLK to CLKB****
MNC clkb clk vss vss N1 w=10u l=0.18u
MPC clkb clk vdd vdd P1 W=10u l=0.18u

****TRANSMISSION GATE1****
MN1 in clkb out2 vss N1 w=80u l=0.18u 
MP1 out2 clk in vdd P1 w=80u l=0.18u

****TRISTATE KEEPER1****
MN2 OUT3 out2 vss vss N1 W=10u l=0.18u 
MP2 OUT3 out2 vdd vdd P1 W=10u l=0.18u

MP3 net1 clkb vdd vdd P1 w=2u l=0.18u
MP4 out2 OUT3 net1 vdd p1 w=4u l=0.18u
MN3 out2 OUT3 net2 vss N1 w=4u l=0.18u
MN4 net2 clk vss vss N1 W=2u l=0.18u

****TRANSMISSION GATE2****
MN5 out3 clk out4 vss N1 w=10u l=0.18u 
MP5 out4 clkB out3 vdd P1 w=10u l=0.18u

****TRISTATE KEEPER2****
MN6 OUT5 out4 vss vss N1 W=5u l=0.18u 
MP6 OUT5 out4 vdd vdd P1 W=5u l=0.18u 

MP7 net3 clk vdd vdd P1 w=2u l=0.18u
MP8 out4 OUT5 net3 vdd p1 w=4u l=0.18u
MN7 out4 OUT5 net4 vss N1 w=4u l=0.18u
MN8 net4 clk vss vss N1 W=2u l=0.18u
***************************************************

.tran 100p 15n
.control
run

meas tran Ptotal AVG i(vpower) from=1n to=11n

plot v(in) v(clk) v(out5)

meas tran DtoC TRIG v(in) VAL=0.5 RISE=1 TARG v(clk) VAL=0.5 RISE=1
meas tran CtoQ TRIG v(clk) VAL=0.5 RISE=1 TARG v(out5) VAL=0.5 RISE=1 
meas tran DtoQ TRIG v(in) VAL=0.5 RISE=1 TARG v(out5) VAL=0.5 RISE=1

set color0=white
set color1=black
set xbrushwidth=2.5

.endc
.end