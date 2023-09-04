-- QBCore Exports / Variables --
local QBCore = exports['qb-core']:GetCoreObject()
local RecentRobbery = 0, 0, 0

RegisterNetEvent('sp-MeterRobbery:client:UnscrewBackplate', function()
    if RecentRobbery == 0 or GetGameTimer() > RecentRobbery then
        QBCore.Functions.TriggerCallback('sp-MeterRobbery:server:PoliceInteger', function(ReturnStatus)
            if ReturnStatus then
                QBCore.Functions.TriggerCallback('sp-MeterRobbery:server:ScrewDriverSet', function(ItemScan)
                    if ItemScan then
                        QBCore.Functions.Progressbar('Backplate', 'Unscrewing Backplate', Config.ProgressBarInteger, false, true, { -- Name | Label | Time | useWhileDead | canCancel
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                        animDict = 'amb@prop_human_parking_meter@male@idle_a',
                            anim = 'idle_a',
                            flags = 17,
                        }, {}, {}, function() -- Play When Done
                            ClearPedTasks(PlayerPedId())
                            Dispatch()
                            RecentRobbery = GetGameTimer() + Config.HeistCooldown
                            exports['ps-ui']:Circle(function(success)
                                if success then
                                    QBCore.Functions.Progressbar('Backplate', 'Grabbing Cash', Config.ProgressBarInteger, false, true, { -- Name | Label | Time | useWhileDead | canCancel
                                        disableMovement = true,
                                        disableCarMovement = true,
                                        disableMouse = false,
                                        disableCombat = true,
                                    }, {
                                    animDict = 'oddjobs@shop_robbery@rob_till',
                                        anim = 'loop',
                                        flags = 17,
                                    }, {}, {}, function() -- Play When Done
                                        ClearPedTasks(PlayerPedId())
                                        TriggerServerEvent('sp-MeterRobbery:server:AddMoney')
                                    end, function() -- Play When Cancel
                                        ClearPedTasks(PlayerPedId())
                                    end)
                                else
                                    QBCore.Functions.Notify('Wrong Screwdriver', 'error')
                                end
                            end, 2, 20)
                        end, function() -- Play When Cancel
                            ClearPedTasks(PlayerPedId())
                        end)
                    end
                end, Config.RequiredItem)
            end
        end)
    else
        QBCore.Functions.Notify('Come back later', 'error')
    end
end)

-- Meter Robbery alert to Dispatch --
function Dispatch()
    exports['ps-dispatch']:MeterRobbery()
end
