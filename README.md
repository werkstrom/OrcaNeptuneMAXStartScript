# OrcaNeptuneMAXStartScript
A custom start (gcode)script for the Elegoo Neptune MAX (3 and 4) printers for use in Orca Slicer. Lets the heat bed stabilize before printing and waits (semi)dynamically for the bed to be stable.
> Please note that in order to see the messages in the console [[respond]] needs to be configured as per [https://www.klipper3d.org/Config_Reference.html#respond](https://www.klipper3d.org/Config_Reference.html#respond)

Copy paste from the Orca_Start.gcode file into Orca Slicers start gcode field.
Adjust to your liking

In the example an inner area, in the center of the build plate is defined as the center most 200x200 mm. Everything elsi is the outer area.

The buildplate is checked to see if any object is placed in the outer area

If so, the heatbed is heated to a 25% higher temp than desired for 15 minutes. Then the heatbed temp is set to the desired temp and when that temp is reached a stabilization wait of 1 minute is intitiated. 

If all objects are within the center 200x200 square, the heat bed temp is set to the desired temp and a shorter stabilization time (180 seconds) is initiated.

Then probing is initiated as usual.

If you adjust the vaules and find better logic and settings please share.

Enjoy
