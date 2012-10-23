XA-SK-AUDIO Functional Pins
+++++++++++++++++++++++++++

This table shows the port mapping for each of the Slice Card Signal IO, and the Slicekit Slot connector pin it is located on.

=================== ========= ======== ====== =================================
Function            TRIANGLE  CIRCLE   PIN      Description
=================== ========= ======== ====== =================================
BCLK                1A        1A       B2     I2S Bit Clock
DAC_DATA0           1D        1D       B4     I2S DAC DATA Channel 0
MCLK                1E        1E       A3     I2S Master Clock
LRCLK               1H        1H       A4     I2S LR Clock
SPDIF_OUT           1K        1K       B10    SPDIF transmit
UART_RX             1I        1I       B15    I2S ADC DATA Channel 0 
I2C_SCL             1L        1L       A15    I2S ADC DATA Channel 1
MIDI_IN             1J        1J       A8     From MIDI Connector
MCLK_FSEL           4E1       4E1      B7     MCLK Function Select
CODEC_RST_N         4E2       4E2      A6     Codec Reset
LED                 4E3       4E3      A7     User LED output
SCL                 4F0       4F0      B9     I2C clock for codec configuration
SDA                 4F1       4F1      B11    I2C data for codec configuration
DAC_DATA1           8D0       1M       B12    I2S DAC DATA Channel 1
PLL_SYNC            1P        1P       B18    PLL 
MIDI OIUT           8D7       NC       A13    To MIDI connector 
=================== ========= ======== ====== =================================


   
