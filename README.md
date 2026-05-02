# UVIndex240370Sensor_UART
UART driver for DFRobot UV Sensor writen in LUA

# Dependencies

drvUV2403.lua have been tested with Lua 5.1.4 on ESP-IDF v3.3-beta1 integer build They require the following modules. i2c and UART functionalities

# Output

driver returns two values: UVdata [mV] and UVI (UVindex)

# mysterious codes

Communication via UART is simple, but knowledge of the communication codes is necessary. I couldn't find a description documenting the communication protocol for this sensor. Using reverse engineering, I found the necessary codes:

## To obtain a UV reading in mV, send the following codes: 
   uart.write(2,35,4,0x00,0x06,0x00,0x01,0xD7,0x49) -- result UV mV
## To obtain a index UV send the following codes: 
   uart.write(2,35,4,0x00,0x07,0x00,0x01,0x86,0x89) -- result UV index 0 - 11

