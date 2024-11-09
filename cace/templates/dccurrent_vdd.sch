v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {CACE testbench dccurrent_vdd} -310 -550 0 0 0.6 0.6 {}
T {Drawn by Or Dicker
March 14, 2024
Revision 0
Open sourced under Apache 2.0 license} -920 0 0 0 0.4 0.4 {}
N -380 -20 -330 -20 {
lab=VSUB}
N -120 -160 -20 -160 {
lab=vdd}
N -120 -140 -20 -140 {
lab=vss}
N 280 -140 570 -140 {
lab=Vbe2}
N 370 -80 510 -80 {
lab=VSUB}
N 510 -80 550 -80 {
lab=VSUB}
N 300 -240 590 -240 {
lab=Vbe1}
N 390 -180 530 -180 {
lab=VSUB}
N 530 -180 570 -180 {
lab=VSUB}
N 280 -240 300 -240 {
lab=Vbe1}
N 280 -240 280 -160 {
lab=Vbe1}
N -360 -160 -360 -80 {
lab=vdd}
N -360 -160 -120 -160 {
lab=vdd}
N -280 -140 -280 -80 {
lab=vss}
N -280 -140 -120 -140 {
lab=vss}
N -330 -20 -130 -20 {
lab=VSUB}
N -130 -100 -130 -80 {
lab=#net1}
N -130 -100 -20 -100 {
lab=#net1}
N -200 -120 -200 -80 {
lab=#net2}
N -200 -120 -20 -120 {
lab=#net2}
C {devices/lab_pin.sym} -380 -20 0 0 {name=p1 sig_type=std_logic lab=VSUB}
C {devices/vsource.sym} -280 -50 0 0 {name=vss value="DC \{vss\}" savecurrent=false}
C {devices/lab_wire.sym} -120 -160 0 1 {name=p11 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} -120 -140 0 1 {name=p24 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 570 -140 0 0 {name=p25 sig_type=std_logic lab=Vbe2}
C {devices/res.sym} 370 -110 0 0 {name=Rout
value=\{Rout\}
device=resistor}
C {devices/capa.sym} 510 -110 0 0 {name=Cout
value=\{Cout\}}
C {devices/lab_pin.sym} 550 -80 0 1 {name=p27 sig_type=std_logic lab=VSUB}
C {devices/vsource.sym} -360 -50 0 0 {name=vdd value="DC \{vdd\}" savecurrent=false}
C {devices/code_shown.sym} -930 -180 0 0 {name=CONTROL only_toplevel=false value=".control
op
set wr_singlescale
wrdata \{simpath\}/\{filename\}_\{N\}.data -I(vdd)
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
C {devices/lab_wire.sym} 590 -240 0 0 {name=p2 sig_type=std_logic lab=Vbe1}
C {devices/res.sym} 390 -210 0 0 {name=Rout1
value=\{Rout\}
device=resistor}
C {devices/capa.sym} 530 -210 0 0 {name=Cout1
value=\{Cout\}}
C {devices/lab_pin.sym} 570 -180 0 1 {name=p3 sig_type=std_logic lab=VSUB}
C {devices/vsource.sym} -130 -50 0 0 {name=Vena value="DC \{ena\}" savecurrent=false}
C {xschem/sky130_od_ip__tempsensor_ext_vp.sym} 130 -130 0 0 {name=x1}
C {devices/vsource.sym} -200 -50 0 0 {name=Vbandgap value="DC \{vbg\}" savecurrent=false}
