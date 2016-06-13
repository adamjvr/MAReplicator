
;Basic settings: Layer height: {layer_height} Walls: {wall_thickness} Fill: {fill_density}
;Print time: {print_time}
;Filament used: {filament_amount}m {filament_weight}g
;Filament cost: {filament_cost}
;**** Replicator 1 / Maker Architect start.gcode ****
; WARNING - THIS WILL ONLY WORK WITH GPX
M73 P0 ;AdamJVR's Cura profile {layer_height}mm @{travel_speed}mm/s
M103 ;turn extruder off
;**** begin homing ****
G162 X Y F2500 ;home XY axes maximum
G161 Z F1100 ;home Z axis minimum
M132 X Y Z A B ;load current position from EPROM for XYZAB axis
G1 X130 Y70 Z40 F4000 ;move to holding position
;**** wait for temp ****
M70 P1 ;please wait...
G130 X20 Y20 Z20 A20 B20 ;lower stepper Vrefs while heating
M140 T0 S{print_bed_temperature} ;set bed temperature
M190 T0 ;wait for bed to reach temperature
M104 T0 S{print_temperature} ;set extruder temperature
M116 T0 ;wait for extruder to reach temperature
G130 X127 Y127 Z40 A127 B127 ;set stepper motor Vref to defaults
;**** precision homing ****
G161 Z F1100 ;home Z axis minimum
G92 Z-5 ;set Z to -5
G1 Z0.0 ;move Z to "0"
G161 Z F100 ;home Z axis minimum slowly
M132 Z ;load current position from EPROM for Z axis
;**** pre-prime ****
M107 ;Start Cooling Fan
G1 Z30 F4000 ;drop build plate
G1 X-130 Y-50 ;move to start position
G1 Z0.5 ;position nozzle
G92 E0 ;zero extrusion position
G1 E2 F1200 ;prime (for nylon and pla)
G92 E0 ;zero extrusion position
M108 R5.0 ;set extruder to 5 RPM
M101 ;start extruder
G4 P3000 ;pre-prime extruder
G1 X-125 Y-50 Z0.2 F1100 ;do a slow wipe...
G1 Z0.5 ;...and lift
;@body (marks gcode body for GPX macros)
;**** GCODE_START ****
