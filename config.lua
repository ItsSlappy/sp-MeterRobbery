Config = {}

-- Parking Meter Config --
Config.HeistCooldown = (60000 * 2) -- Parking Meter Cooldown

Config.RequiredPolice = 0 -- Parking Meter Required Police

Config.RequiredItem = 'screwdriverset' -- RequiredItem to rob Parking Meter

Config.ProgressBarInteger = 10000 -- Length for all Progress Bars

-- Parking Meter Props -- 
Config.ParkingMeterProps = {
    'prop_parknmeter_01',
    'prop_parknmeter_02'
}

-- Parking Meter Third-Eye / Rewards --
Config.MeterLabel = 'Unscrew Backplate' -- Third-Eye Label
Config.MeterIcon = 'fas fa-parking-circle' -- Third-Eye Icon

Config.RewardMoney = math.random(500, 2000) -- Reward Money ($500 - $2,000)