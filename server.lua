-- DO NOT TOUCH UNLESS YOU KNOW WHAT YOU'RE DOING!

RegisterServerEvent("liam-speedbypass:getPermission")
AddEventHandler("liam-speedbypass:getPermission", function()
    local source = source
    local speedLimit = Config.DefaultSpeedLimit
    local aceLevel = "none"

    for _, level in ipairs(Config.SpeedBypassLevels) do
        if IsPlayerAceAllowed(source, level.ace) then
            speedLimit = level.limit
            aceLevel = level.ace
            break
        end
    end

    print("Player " .. tostring(source) .. " speed limit: " .. tostring(speedLimit) .. ", ACE level: " .. aceLevel)
    TriggerClientEvent("liam-speedbypass:setPermission", source, speedLimit, aceLevel)
end)

RegisterCommand("checkspeedbypass", function(source, args, rawCommand)
    local speedLimit = Config.DefaultSpeedLimit
    local aceLevel = "none"

    for _, level in ipairs(Config.SpeedBypassLevels) do
        if IsPlayerAceAllowed(source, level.ace) then
            speedLimit = level.limit
            aceLevel = level.ace
            break
        end
    end

    TriggerClientEvent('chat:addMessage', source, {
        color = {255, 255, 0},
        multiline = true,
        args = {"Speed Bypass", "Your speed limit: " .. tostring(speedLimit) .. ", ACE level: " .. aceLevel}
    })
end, false)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    print('The resource ' .. resourceName .. ' has been started.')
    print('Current SpeedBypassLevels configuration:')
    for _, level in ipairs(Config.SpeedBypassLevels) do
        print('ACE: ' .. level.ace .. ', Limit: ' .. tostring(level.limit))
    end
end)