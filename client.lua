-- DO NOT TOUCH UNLESS YOU KNOW WHAT YOU'RE DOING!

local speedLimit = Config.DefaultSpeedLimit
local aceLevel = "none"

Citizen.CreateThread(function()
    TriggerServerEvent("liam-speedbypass:getPermission")
end)

RegisterNetEvent("liam-speedbypass:setPermission")
AddEventHandler("liam-speedbypass:setPermission", function(limit, ace)
    speedLimit = limit
    aceLevel = ace
    print("Received speed limit: " .. tostring(speedLimit) .. " mph, ACE level: " .. aceLevel)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local player = PlayerPedId()
        if IsPedInAnyVehicle(player, false) then
            local vehicle = GetVehiclePedIsIn(player, false)
            if GetPedInVehicleSeat(vehicle, -1) == player then
                local maxSpeed = speedLimit * 0.44704
                SetVehicleMaxSpeed(vehicle, maxSpeed)
            end
        end
    end
end)