-- AR Googles OS
-- Requires Advanced Peripherals and CC: Tweaked

-- Required modules
local ap = peripheral.find("ap_ar_goggles")

-- Function to display the main menu
local function displayMainMenu()
  term.clear()
  term.setCursorPos(1, 1)
  print("AR Googles OS")
  print("1. View Ore Locations")
  print("2. Enable/Disable X-Ray Vision")
  print("3. Exit")
  write("Enter your choice: ")
end

-- Function to view ore locations
local function viewOreLocations()
  term.clear()
  term.setCursorPos(1, 1)
  print("Ore Locations:")
  local locations = ap.getOreLocations()
  if #locations == 0 then
    print("No ore locations found.")
  else
    for i, location in ipairs(locations) do
      print(i .. ". " .. location.x .. ", " .. location.y .. ", " .. location.z)
    end
  end
  write("Press any key to continue...")
  os.pullEvent("key")
end

-- Function to toggle X-Ray vision
local function toggleXRayVision()
  ap.toggleXRayVision()
  print("X-Ray vision toggled.")
  sleep(1)
end

-- Main function to handle user input and execute commands
local function main()
  while true do
    displayMainMenu()
    local choice = tonumber(read())
    if choice == 1 then
      viewOreLocations()
    elseif choice == 2 then
      toggleXRayVision()
    elseif choice == 3 then
      break
    else
      print("Invalid choice. Please try again.")
      sleep(1)
    end
  end
end

-- Run the main function
main()
