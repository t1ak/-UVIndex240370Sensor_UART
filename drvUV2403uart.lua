-- 306 uart2 drv UV ESP32 --date= 2026-03-22 12:39:18

--[[ LUA driver for DFRobot_UVIndex240370Sensor
    (c) Tadeusz Jedynak 2026 ]]

_DEVICE_ADDR          = 0X23
_INPUTREG_UVS_DATA    = 0x06   -- UVS data
_INPUTREG_UVS_INDEX   = 0x07   -- UVS index
_INPUTREG_RISK_LEVEL  = 0x08   -- RISK LEVEL
_DEVICE_PID           = 0x427c -- PID

-- uart 2
uart.on(2, "data", 7, -- 7 bajtów
  function(x)
    UARTread = x:byte(5)+(256*x:byte(4))
    -- print("receive UV:", UARTread)
  end)

-- uart2 error handler
uart.on(2, "error",
  function(data)
    print("error from uart:", data)
  end)

uart.setup(2, 9600, 8, uart.PARITY_NONE, uart.STOPBITS_1, {tx = 17, rx = 16}) uart.start(2)

-- beginning how to use
--[[
TmrG=tmr.create() --10 000 = 10 sec
TmrG:register(4000, tmr.ALARM_AUTO, --120 tys = 2 minuty
 function(t)
   --uart.write(2,35,4,0x00,0x06,0x00,0x01,0xD7,0x49) -- 0x06 UV mV
   uart.write(2,35,4,0x00,0x07,0x00,0x01,0x86,0x89) -- 0x07 UV index 0 - 11
  end)
TmrG:start() ]]--
