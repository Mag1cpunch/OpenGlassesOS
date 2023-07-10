local controller = peripheral.find("arController") -- Finds the peripheral if one is connected
local c = controller.canvas()
local w,h = c.getSize()
local out = c.addText({9, h - 16}, "NO TPS")
 
if controller == nil then error("arController not found") end
 
controller.setRelativeMode(true, 1600, 900) -- Convenient Aspect ratio for most screens
while true do
  local timer = os.startTimer(1)
  local event, id
  repeat
    event, id = os.pullEvent("timer")
  until id == timer
  controller.clear() -- If you don't do this, the texts will draw over each other
  controller.drawRightboundString(os.date(), -10, 10, 0xffffff)
  controller.drawRightboundString("Welcome to OpenGlassesOS by Meteor!", -650, 10, 0xff8a57)
end

while true do
    local game_time_start = os.epoch "utc"
    sleep(1)
    local game_time_end = os.epoch "utc"
    local utc_elapsed_seconds = (game_time_end - game_time_start) / 1000
    _G.tps = 20 / utc_elapsed_seconds
    out.setText(string.format("TPS: %.2f", tps))
    local c
    if tps > 19 then c = 0x00FF00FF
    elseif tps > 15 then c = 0xFFFF00FF
    elseif tps > 10 then c = 0xFF8800FF
    else c = 0xFF0000FF end
    out.setColor(c)
    
    sleep(1)
end
