# <sp-MeterRobbery>

## Description

- I started do thing becuase I would like to become a future Fivem QBCore script developer.
- I built this project to give back to the community and work on my developing skills.
- With this being my first project I learned a lot about QBCore coding and advanced my skills.

## Prerequisites

* [QBCore Framework](https://github.com/qbcore-framework)
* [ps-ui](https://github.com/Project-Sloth/ps-ui)
* [ps-dispatch](https://github.com/Project-Sloth/ps-dispatch)

## Installation

* Download ZIP
* Drag and drop into `[standalone]` remove `-main` from file name
* Restart your server

## ps-dispatch > client > cl_events.lua
```lua
-- Meter Robbery
local function MeterRobbery(camId)
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "meterrobbery", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-90",
        firstStreet = locationInfo,
        gender = gender,
        camId = camId,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('meterrobbery'), -- message
        job = { "police" } -- jobs that will get the alerts
    })
end

exports('MeterRobbery', MeterRobbery)
```

## ps-dispatch > server > sv_dispatchcodes.lua
```lua
	-- Meter Robbery
	["meterrobbery"] = {displayCode = '10-90', description = "Meter Robbery In Progress", radius = 0, recipientList = {'LEO', 'police'}, blipSprite = 500, clipColour = 1, blipScale = 1.5, blipLength = 2, sound = "Lose_1st", sound2 = "FTAO_FM_Events_Soundset", offset = "false", blipflash = "false"},
```

## ps-dispatch > locales > locales.lua
```lua
        -- Meter Robbery
        ['meterrobbery'] = "Meter Robbery",
```

## Usage

This can be used by anyone that thinks this is a cool idea and it would be a useful thing to implement into their server.

## Prerequisites

* [QBCore Framework](https://github.com/qbcore-framework)
* [ps-ui](https://github.com/Project-Sloth/ps-ui)
* [ps-dispatch](https://github.com/Project-Sloth/ps-dispatch)

# Credits
* [ImMacky](https://github.com/ImMacky) - Introduction and making this Project Possible
