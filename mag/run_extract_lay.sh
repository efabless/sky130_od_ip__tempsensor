#! /bin/bash

magic -dnull -noconsole -rcfile \$PDK_ROOT/\$PDK/libs.tech/magic/sky130A.magicrc << EOF
#load sky130_od_ip__tempsensor
load sky130_od_ip__tempsensor_ext_vp

select top cell
extract path extfiles
extract all
ext2spice lvs
#ext2spice -p extfiles -o ../netlist/layout/sky130_od_ip__tempsensor.spice
ext2spice -p extfiles -o ../netlist/layout/sky130_od_ip__tempsensor_ext_vp.spice
quit -noprompt
EOF
rm -r extfiles
exit 0

