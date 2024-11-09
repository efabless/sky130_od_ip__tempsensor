v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Drawn by Or Dicker
March 18, 2024
Revision 0
Open sourced under Apache 2.0 license} -920 160 0 0 0.4 0.4 {}
T {CACE testbench Supply Voltage Sensetivity} -310 -550 0 0 0.6 0.6 {}
N -270 -160 -270 -80 {
lab=#net1}
N -270 -160 -20 -160 {
lab=#net1}
N -190 -140 -190 -80 {
lab=#net2}
N -190 -140 -20 -140 {
lab=#net2}
N 280 -160 360 -160 {
lab=Vbe1}
N 280 -140 360 -140 {
lab=Vbe2}
N -290 -20 -40 -20 {
lab=VSUB}
N -40 -100 -40 -80 {
lab=#net3}
N -40 -100 -20 -100 {
lab=#net3}
N -110 -120 -110 -80 {
lab=#net4}
N -110 -120 -20 -120 {
lab=#net4}
C {devices/code_shown.sym} -940 -140 0 0 {name=CONTROL only_toplevel=false value=".control
.func mu(vbe1,vbe2) = 10.7906/(10.7906+vbe1/(vbe2-vbe1))
.func T(mu) = 714.015*mu-259.802
option TEMP=25
op
let ttrim = T(mu(V(vbe1),V(vbe2)))-25

option TEMP=\{temperature\}
op
let tmeas = T(mu(V(vbe1),V(vbe2)))
let terr = abs((tmeas-op1.ttrim)-\{temperature\})/\{temperature\}
set wr_singlescale
echo $&terr > \{simpath\}/\{filename\}_\{N\}.data
quit
.endc
"}
C {devices/code_shown.sym} -940 -530 0 0 {name=SETUP only_toplevel=false value="* CACE gensim simulation file \{filename\}_\{N\}
*Find the current through the temperature sensor 

.include \{DUT_path\}

.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice \{corner\}

.option TEMP=\{temperature\}
* Flag unsafe operating conditions (exceeds models' specified limits)
.option warn=1
"}
C {devices/lab_pin.sym} -290 -20 0 0 {name=p3 sig_type=std_logic lab=VSUB}
C {devices/vsource.sym} -190 -50 0 0 {name=vss1 value="DC \{vss\}" savecurrent=false}
C {devices/lab_wire.sym} 360 -140 0 0 {name=p6 sig_type=std_logic lab=Vbe2}
C {devices/vsource.sym} -270 -50 0 0 {name=vdd1 value="DC \{vdd\}" savecurrent=false}
C {devices/res.sym} -240 10 0 0 {name=RSUB1
value=0.01
device=resistor}
C {devices/gnd.sym} -240 40 0 0 {name=l2 lab=GND}
C {devices/lab_wire.sym} 360 -160 0 0 {name=p7 sig_type=std_logic lab=Vbe1}
C {devices/vsource.sym} -40 -50 0 0 {name=Vena1 value="DC \{ena\}" savecurrent=false}
C {xschem/sky130_od_ip__tempsensor_ext_vp.sym} 130 -130 0 0 {name=x1}
C {devices/vsource.sym} -110 -50 0 0 {name=vbandgap value="DC \{vbg\}" savecurrent=false}
