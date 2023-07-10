local controller = peripheral.find("arController") -- Finds the peripheral if one is connected
 
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
