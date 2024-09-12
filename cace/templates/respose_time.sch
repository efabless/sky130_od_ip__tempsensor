v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {CACE testbench respose_time} -310 -550 0 0 0.6 0.6 {}
T {Drawn by Or Dicker
March 14, 2024
Revision 0
Open sourced under Apache 2.0 license} -920 130 0 0 0.4 0.4 {}
N -290 -20 -240 -20 {
lab=VSUB}
N -30 -160 70 -160 {
lab=vdd}
N -30 -140 70 -140 {
lab=vss}
N 370 -140 660 -140 {
lab=Vbe2}
N 370 -160 660 -160 {
lab=Vbe1}
N -270 -160 -270 -80 {
lab=vdd}
N -270 -160 -30 -160 {
lab=vdd}
N -190 -140 -190 -80 {
lab=vss}
N -190 -140 -30 -140 {
lab=vss}
N -240 -20 -20 -20 {
lab=VSUB}
N -20 -100 -20 -80 {
lab=#net1}
N -20 -100 70 -100 {
lab=#net1}
N -110 -120 -110 -80 {
lab=#net2}
N -110 -120 70 -120 {
lab=#net2}
C {devices/lab_pin.sym} -290 -20 0 0 {name=p1 sig_type=std_logic lab=VSUB}
C {devices/vsource.sym} -190 -50 0 0 {name=vss value="DC \{vss\}" savecurrent=false}
C {devices/lab_wire.sym} -30 -160 0 1 {name=p11 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} -30 -140 0 1 {name=p24 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 660 -140 0 0 {name=p25 sig_type=std_logic lab=Vbe2}
C {devices/vsource.sym} -270 -50 0 0 {name=vdd value="DC \{vdd\}" savecurrent=false}
C {devices/code_shown.sym} -940 -130 0 0 {name=CONTROL only_toplevel=false value=".control
* Step function applied at time 100ns, measure respose_time
.func mu(vbe1,vbe2) = 10.7906/(10.7906+vbe1/(vbe2-vbe1))
.func T(mu) = 714.015*mu-259.802
tran 1u 10m
let tmeas = abs(T(mu(V(Vbe1),V(Vbe2)))-\{temperature\})
meas tran tres when tmeas=\{temperature\}*0.1 CROSS=LAST
set wr_singlescale
*plot 714.015*(10.7906/(10.7906+Vbe1/(Vbe2-Vbe1)))-259.802
echo $&tres > \{simpath\}/\{filename\}_\{N\}.data
quit
.endc
"}
C {devices/code_shown.sym} -930 -470 0 0 {name=SETUP only_toplevel=false value="* CACE gensim simulation file \{filename\}_\{N\}
*Find the current through the temperature sensor 

.include \{DUT_path\}

.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice \{corner\}

.option TEMP=\{temperature\}

* Flag unsafe operating conditions (exceeds models' specified limits)
.option warn=1
"}
C {devices/res.sym} -240 10 0 0 {name=RSUB
value=0.01
device=resistor}
C {devices/gnd.sym} -240 40 0 0 {name=l1 lab=GND}
C {devices/lab_wire.sym} 660 -160 0 0 {name=p2 sig_type=std_logic lab=Vbe1}
C {devices/vsource.sym} -20 -50 0 0 {name=VVdiff value="DC 0 PWL(0 0 100n 0 100.1n \{ena\})" savecurrent=false}
C {xschem/sky130_od_ip__tempsensor_ext_vp.sym} 220 -130 0 0 {name=x1}
C {devices/vsource.sym} -110 -50 0 0 {name=vbandgap value="DC \{vbg\}" savecurrent=false}
