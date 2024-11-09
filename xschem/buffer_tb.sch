v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 90 -320 140 -320 {
lab=GND}
N 90 -320 90 -270 {
lab=GND}
N 20 -270 90 -270 {
lab=GND}
N -100 -270 20 -270 {
lab=GND}
N 140 -320 310 -320 {
lab=GND}
N -30 -330 40 -330 {
lab=#net1}
N 40 -330 40 -300 {
lab=#net1}
N -100 -280 -100 -270 {
lab=GND}
N -100 -340 310 -340 {
lab=#net2}
N 40 -280 310 -280 {
lab=#net1}
N 40 -300 40 -280 {
lab=#net1}
N 270 -300 310 -300 {
lab=#net2}
N 270 -340 270 -300 {
lab=#net2}
N 610 -340 680 -340 {
lab=out}
C {devices/code.sym} 110 -130 0 0 {name=s1 only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt"}
C {devices/gnd.sym} 90 -270 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} -100 -310 0 0 {name=V1 value=1.8}
C {devices/vsource.sym} -30 -300 0 0 {name=V2 value=0.6}
C {devices/code.sym} 330 -120 0 0 {name=s2 only_toplevel=false value="
.control
option TEMP=25
op
*** DEBUG - search for linear mode trasistor
set altshow
show > /tmp/tras.txt

dc V2 0 1.8 0.05
plot out

.endc"}
C {buffer.sym} 460 -310 0 0 {name=x1}
C {devices/opin.sym} 680 -340 0 0 {name=p1 lab=out}
