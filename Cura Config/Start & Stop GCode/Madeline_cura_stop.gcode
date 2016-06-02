
G92 E0 ;zero extrusion position
G1 E-2 F1200 ;suck (for nylon and pla)
M73 P100 ;end build progress
G0 Z155 F1000 ;drop Z axis to bottom of machine
M18 ;disable stepper
M104 S0 T0 ;cool down extruder
G162 X Y F2500 ;home XY endstops
M18 ;disable stepper motors
M107 ; Turn off Cooling Fan
M70 P5 ;We <3 Making Things!
M72 P1 ;play Ta-Da song
; -- end of END GCODE --
