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
N -380 -20 -330 -20 {
lab=VSUB}
N -120 -160 -20 -160 {
lab=vdd}
N -120 -140 -20 -140 {
lab=vss}
N 280 -140 570 -140 {
lab=Vbe1}
N -330 -20 -200 -20 {
lab=VSUB}
N -360 -160 -360 -80 {
lab=vdd}
N -360 -160 -120 -160 {
lab=vdd}
N -280 -140 -280 -80 {
lab=vss}
N -280 -140 -120 -140 {
lab=vss}
N -200 -120 -200 -80 {
lab=#net1}
N -200 -120 -20 -120 {
lab=#net1}
N 280 -160 570 -160 {
lab=Vbe2}
N -380 -20 -330 -20 {
lab=VSUB}
N -120 -160 -20 -160 {
lab=vdd}
N -120 -140 -20 -140 {
lab=vss}
N 280 -140 570 -140 {
lab=Vbe1}
N -330 -20 -200 -20 {
lab=VSUB}
N -360 -160 -360 -80 {
lab=vdd}
N -360 -160 -120 -160 {
lab=vdd}
N -280 -140 -280 -80 {
lab=vss}
N -280 -140 -120 -140 {
lab=vss}
N -200 -120 -200 -80 {
lab=#net1}
N -200 -120 -20 -120 {
lab=#net1}
N 280 -160 570 -160 {
lab=Vbe2}
C {devices/lab_pin.sym} -380 -20 0 0 {name=p1 sig_type=std_logic lab=VSUB}
C {devices/vsource.sym} -280 -50 0 0 {name=vss value="DC \{vss\}" savecurrent=false}
C {devices/lab_wire.sym} -120 -160 0 1 {name=p11 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} -120 -140 0 1 {name=p24 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 570 -140 0 0 {name=p25 sig_type=std_logic lab=Vbe1}
C {devices/vsource.sym} -360 -50 0 0 {name=vdd value="DC \{vdd\}" savecurrent=false}
C {devices/code_shown.sym} -940 -200 0 0 {name=CONTROL only_toplevel=false value=".control
.func mu(vbe1,vbe2) = 9.326/(9.326+vbe1/(vbe2-vbe1))
.func T(mu) = 771.323*mu-267.772
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
C {devices/code_shown.sym} -940 -450 0 0 {name=SETUP only_toplevel=false value="* CACE gensim simulation file \{filename\}_\{N\}
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
C {xschem/sky130_od_ip__tempsensor.sym} 130 -140 0 0 {name=x1}
C {devices/lab_wire.sym} 570 -160 0 0 {name=p2 sig_type=std_logic lab=Vbe2}
C {devices/vsource.sym} -200 -50 0 0 {name=Vena value="DC \{ena\}" savecurrent=false}
C {devices/lab_pin.sym} -380 -20 0 0 {name=p3 sig_type=std_logic lab=VSUB}
C {devices/vsource.sym} -280 -50 0 0 {name=vss1 value="DC \{vss\}" savecurrent=false}
C {devices/lab_wire.sym} -120 -160 0 1 {name=p4 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} -120 -140 0 1 {name=p5 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 570 -140 0 0 {name=p6 sig_type=std_logic lab=Vbe1}
C {devices/vsource.sym} -360 -50 0 0 {name=vdd1 value="DC \{vdd\}" savecurrent=false}
C {devices/res.sym} -330 10 0 0 {name=RSUB1
value=0.01
device=resistor}
C {devices/gnd.sym} -330 40 0 0 {name=l2 lab=GND}
C {xschem/sky130_od_ip__tempsensor.sym} 130 -140 0 0 {name=x2}
C {devices/lab_wire.sym} 570 -160 0 0 {name=p7 sig_type=std_logic lab=Vbe2}
C {devices/vsource.sym} -200 -50 0 0 {name=Vena1 value="DC \{ena\}" savecurrent=false}
