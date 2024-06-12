#! /bin/bash

xschem -n -s -r -x -q --tcl "set lvs_netlist 1" --rcfile $PDK_ROOT/$PDK/libs.tech/xschem/xschemrc -o ../netlist/schematic -N sky130_od_ip__tempsensor_ext_vp.spice sky130_od_ip__tempsensor_ext_vp.sch


