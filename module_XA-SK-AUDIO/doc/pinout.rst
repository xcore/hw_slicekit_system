XA-SK-AUDIO Functional Pins
+++++++++++++++++++++++++++

This table shows the port mapping for each of the Slice Card Signal IO, and the Slicekit Slot connector pin it is located on.

=================== ========= ======== ======== ======== ====== =================================
Function            STAR      TRIANGLE SQUARE   CIRCLE   PIN    Description
=================== ========= ======== ======== ======== ====== =================================
BCLK                NC        1A       NC       1A       B2     I2S Bit Clock
DAC_DATA0           NC        1D       NC       1D       B4     I2S DAC DATA Channel 0
MCLK                NC        1E       NC       1E       A3     I2S Master Clock
LRCLK               NC        1H       NC       1H       A4     I2S LR Clock
SPDIF_OUT           1C        1K       1C       1K       B10    SPDIF transmit
UART_RX             1G        1I       1G       1I       B15    I2S ADC DATA Channel 0 
I2C_SCL             1F        1L       1F       1L       A15    I2S ADC DATA Channel 1
MIDI_IN             1B        1J       1B       1J       A8     From MIDI Connector
MCLK_FSEL           4A1       4E1      4A1      4E1      B7     MCLK Function Select
CODEC_RST_N         4A2       4E2      4A2      4E2      A6     Codec Reset
LED                 4A3       4E3      4A3      4E3      A7     User LED output
SCL                 4B0       4F0      4B0      4F0      B9     I2C clock for codec configuration
SDA                 4B1       4F1      4B1      4F1      B11    I2C data for codec configuration
DAC_DATA1           4C0       8D0      4C0      1M       B12    I2S DAC DATA Channel 1
PLL_SYNC            4D1       1P       4D0      1P       B18    PLL 
MIDI OIUT           4C3       8D7      4C3      NC       A13    To MIDI connector 
=================== ========= ======== ======== ======== ====== =================================


   
