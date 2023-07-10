-- AR Googles OS
-- Requires Advanced Peripherals and CC: Tweaked

-- Required modules
local ar = peripheral.find("arController")

function openglassesos()
	ar.clear()
	ar.drawString("Welcome to OpenGlassesOS by Meteor!", -10, 10, 255, 147, 0)
end
openglassesos()
