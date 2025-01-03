M117 ;Used for adaptive mesh to identify where gcode starts
G90 ; use absolute coordinates
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
; M190 S{first_layer_bed_temperature[0]}
M118 Detected print area: minX: {first_layer_print_min[0]}, minY: {first_layer_print_min[1]}, maxX: {first_layer_print_max[0]}, maxY: {first_layer_print_max[1]}
;Decide how long to wait, depending on where on the build plate we will print, edges takes longer to stabilize
{if first_layer_print_min[1] < 110 or first_layer_print_max[1] > 310 or first_layer_print_min[0] < 110 or first_layer_print_max[0] > 310}
  M118 First layer is starting outside the center 200x200mm
  M118 Heating the bed to 25% above initial layer temp (max 100 C) to reduce wait time (i.e. warm faster)
  {if (first_layer_bed_temperature[0] * 1.25) > 100}
    M118 Initially heating bed to 100 C (max)
    M190 S100
  {else}
    M118 Initially heating bed to {first_layer_bed_temperature[0] * 1.25} C
    M190 S{first_layer_bed_temperature[0] * 1.25}
  {endif}
  M118 Stabilization temperature reached. Stabilizing heatbed. 10 minute wait initiated.
  G4 P600000 ; Wait 10 minutes, adjust to whatever you feel you need
  M118 Setting correct heat bed temperature to {first_layer_bed_temperature[0]} C
  M190 S{first_layer_bed_temperature[0]}
  M118 Heatbed sensor at correct temp. Wait 1 more minute to stabilize.
  G4 P60000 ; Wait 1 more minute, adjust to whatever you feel you need
{else}
  M118 First layer is starting within the center 200x200mm
  M118 Heating to first layer temperature
  M190 S{first_layer_bed_temperature[0]}
  M118 Heatbed sensor at correct temp. Wait 3 more minutes to stabilize.
  G4 P180000 ; Wait 3 minutes, adjust to whatever you feel you need
{endif}
M118 Heatbed stabilized! Heating nozzle to {first_layer_temperature[0]-60} C to prevent oozing
M109 S{first_layer_temperature[0]-60} ; set temporary nozzle temp to prevent oozing during homing
G28 ;home
BED_MESH_CALIBRATE
G1 Z10 F240
G1 X2 Y10 F3000
M118 Heating nozzle to {first_layer_temperature[0]} C to start printing
M109 S{first_layer_temperature[0]} ; wait for nozzle temp to stabilize
G92 E0 ;Reset Extruder
G1 Z0.45 F300
G1 X1.5 Y20 F5000.0 ;Move to start position for priming
G1 Y120.0 F600.0 E15 ;Draw the first priming line - No Z hop.
G1 X0.5 F1000.0 ;Move to side a little for priming
G1 Y20 F600 E30 ;Draw the second priming line - No Z hop
G92 E0 ;Reset Extruder
