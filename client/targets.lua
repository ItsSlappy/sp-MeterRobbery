-- Screw Driver Set (REPLACE ME LATER) --
exports['qb-target']:AddTargetModel(Config.ParkingMeterProps,  {
    options = {
      {
        type = 'client',
        event = 'sp-MeterRobbery:client:UnscrewBackplate',
        icon = Config.MeterIcon,
        label = Config.MeterLabel,
        item = Config.RequiredItem,
      },
    },
    distance = 2.5,
})