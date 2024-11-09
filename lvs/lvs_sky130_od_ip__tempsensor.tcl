# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0
#
# LVS the temperature sensor from magic database source
# Run this with "netgen -batch source lvs_sky130_od_ip__tempsensor.tcl"

# debug on

if {[catch {set PDK_PATH $::env(PDK_PATH)}]} {
    set PDK_PATH /usr/share/pdk
}
if {[catch {set PDK $::env(PDK)}]} {
    set PDK sky130A
}

set circuit1 [readnet spice ../netlist/layout/sky130_od_ip__tempsensor_ext_vp.spice]
set circuit2 [readnet spice ../netlist/schematic/sky130_od_ip__tempsensor_ext_vp.spice]

lvs "$circuit1 sky130_od_ip__tempsensor_ext_vp" "$circuit2 sky130_od_ip__tempsensor_ext_vp" $PDK_PATH/$PDK/libs.tech/netgen/sky130A_setup.tcl sky130_od_ip__tempsensor_ext_vp_comp.out
