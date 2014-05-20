sliceCARD Overview
==================

2 Axis Joystick
---------------

The joystick on the Mixed Signal sliceCARD has two potentiometer axes, along with a centre button. The potentiometers are configured as a bridge, giving a voltage output from 0 to 3.3V, with 1.65V being the approximate centre point. The voltages from the joystick are fed to ADC inputs of the attached core board.

The centre button is attached to a 1b I/O port of the attached core board, with a pull-up resistor, giving a low (0V) signal when the button is depressed.

Thermistor
----------

A 1k NTC thermistor forms part of a linearisation network, the output of which is fed to one of the ADC inputs of the attached core board.

The voltage output of the linearised circuit with reference to temperature can be seen in the table below:

+------------+--------+
|Temperature |Voltage |
+============+========+
|-50         |3.16    |
+------------+--------+
|-40         |3.11    |
+------------+--------+
|-30         |3.04    |
+------------+--------+
|-20         |2.91    |
+------------+--------+
|-10         |2.72    |
+------------+--------+
|0           |2.47    |
+------------+--------+
|10          |2.15    |
+------------+--------+
|20          |1.80    |
+------------+--------+
|30          |1.45    |
+------------+--------+
|40          |1.13    |
+------------+--------+
|50          |0.87    |
+------------+--------+
|60          |0.65    |
+------------+--------+
|70          |0.49    |
+------------+--------+
|80          |0.37    |
+------------+--------+
|90          |0.28    |
+------------+--------+
|100         |0.21    |
+------------+--------+
|110         |0.16    |
+------------+--------+
|120         |0.12    |
+------------+--------+
|130         |0.09    |
+------------+--------+
|140         |0.07    |
+------------+--------+
|150         |0.06    |
+------------+--------+

LDR
---

An LDR is available on the sliceCARD, it can be connected to a comparator, or as part of a voltage divider to an ADC input of the core board. The comparator output can be connected to the wake-up input to the core board for use as an external input to bring the xCORE device on the core board out of suspend.

In order to connect the LDR to the comparator a jumper should be installed on J7 at the end marked ``LDR_COMP``, the output of the comparator should go high when the LDR is in shade. This output can be connected to the wake input of the core board by installing a jumper on J6.

In order to connect the LDR as a voltage divider to an ADC input of the core board a jumper should be installed on J7 at the end marked ``ADC0``. The voltage of the divider will approach 0V in shade and will increase with the illumination of the LDR.

PWM DAC
-------

Two 1b I/Os from the core board are connected to filters, which are then connected to operational amplifiers to create a simple 2 channel PWM DAC. The cut off of the filters is set to 20kHz, so a PWM frequency below this figure should be selected.

Push Buttons
------------

There are two push buttons available on the sliceCARD, SW1 is connected to a 1b I/O on the core board, the other is connected to the wake input of the core board, allowing the user to override the comparator circuit and bring the xCORE device out of suspend.
