v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {CACE testbench Temparature Accuracy at nominal Temperature} -310 -550 0 0 0.6 0.6 {}
T {Drawn by Or Dicker
March 14, 2024
Revision 0
Open sourced under Apache 2.0 license} -910 90 0 0 0.4 0.4 {}
N -380 -20 -330 -20 {
lab=VSUB}
N -120 -160 -20 -160 {
lab=vdd}
N -120 -140 -20 -140 {
lab=vss}
N 280 -140 570 -140 {
lab=Vbe2}
N -360 -160 -360 -80 {
lab=vdd}
N -360 -160 -120 -160 {
lab=vdd}
N -280 -140 -280 -80 {
lab=vss}
N -280 -140 -120 -140 {
lab=vss}
N 280 -160 570 -160 {
lab=Vbe1}
N -330 -20 -60 -20 {
lab=VSUB}
N -60 -100 -60 -80 {
lab=#net1}
N -60 -100 -20 -100 {
lab=#net1}
N -180 -120 -180 -80 {
lab=#net2}
N -180 -120 -20 -120 {
lab=#net2}
C {devices/lab_pin.sym} -380 -20 0 0 {name=p1 sig_type=std_logic lab=VSUB}
C {devices/vsource.sym} -280 -50 0 0 {name=vss value="DC \{vss\}" savecurrent=false}
C {devices/lab_wire.sym} -120 -160 0 1 {name=p11 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} -120 -140 0 1 {name=p24 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 570 -140 0 0 {name=p25 sig_type=std_logic lab=Vbe2}
C {devices/vsource.sym} -360 -50 0 0 {name=vdd value="DC \{vdd\}" savecurrent=false}
C {devices/code_shown.sym} -930 -180 0 0 {name=CONTROL only_toplevel=false value=".control
.func mu(vbe1,vbe2) = 10.7906/(10.7906+vbe1/(vbe2-vbe1))
.func T(mu) = 714.015*mu-259.802
option TEMP=25
op
let ttrim = T(mu(V(vbe1),V(vbe2)))-25
print ttrim

option TEMP=\{temperature\}
op
let tmeas = T(mu(V(vbe1),V(vbe2)))
let terr = tmeas-\{temperature\}-op1.ttrim
set wr_singlescale
echo $&terr > \{simpath\}/\{filename\}_\{N\}.data
quit
.endc
"}
C {devices/code_shown.sym} -940 -430 0 0 {name=SETUP only_toplevel=false value="* CACE gensim simulation file \{filename\}_\{N\}
*Find the current through the temperature sensor 

.include \{DUT_path\}

.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice \{corner\}

.option TEMP=\{temperature\}
* Flag unsafe operating conditions (exceeds models' specified limits)
.option warn=1
"}
C {devices/res.sym} -330 10 0 0 {name=RSUB
value=0.01
device=resistor}
C {devices/gnd.sym} -330 40 0 0 {name=l1 lab=GND}
C {devices/lab_wire.sym} 570 -160 0 0 {name=p2 sig_type=std_logic lab=Vbe1}
C {devices/vsource.sym} -60 -50 0 0 {name=Vena value="DC \{ena\}" savecurrent=false}
C {xschem/sky130_od_ip__tempsensor_ext_vp.sym} 130 -130 0 0 {name=x1}
C {devices/vsource.sym} -180 -50 0 0 {name=vbandgap value="DC \{vbg\}" savecurrent=false}
