# Start script for Orca Slicer and Neptune 3/4 MAX (Klipper)

A custom start (gcode)script for the Elegoo Neptune MAX (3 and 4) printers for use in Orca Slicer. Lets the heat bed stabilize before printing and waits (semi)dynamically for the bed to be stable.
> Please note that in order to see the messages in the console [respond] needs to be configured as per [https://www.klipper3d.org/Config_Reference.html#respond](https://www.klipper3d.org/Config_Reference.html#respond)

Copy paste from the Orca_Start.gcode file into Orca Slicers start gcode field.
Adjust to your liking

The script identifies objects in three zones. 
- The inner 200x200 for small prints. Not so long stabilizing time.
- The middle 300x300 for medium sized prints. Longer stabilizing time and dual temps.
- The outer full print bed for large sized prints. Really long time to stabilize and dual temps.

The script is fairly verbose in the console in Klipper

Then, probing is initiated as usual.

If you adjust the vaules and find better logic and settings please share.

Enjoy
