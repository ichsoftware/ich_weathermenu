-- Geçerli hava türleri listesi
local validWeatherTypes = {
    CLEAR = true,
    EXTRASUNNY = true,
    CLOUDS = true,
    OVERCAST = true,
    RAIN = true,
    CLEARING = true,
    THUNDER = true,
    SMOG = true,
    FOGGY = true,
    XMAS = true,
    SNOWLIGHT = true,
    BLIZZARD = true
}

RegisterCommand("setweather", function(source, args)
    if #args < 1 then
        TriggerClientEvent('chat:addMessage', source, {
            color = { 255, 0, 0 },
            args = { "use", "/setweather [CLEAR | RAIN | THUNDER | XMAS vb.]" }
        })
        return
    end

    local weatherType = string.upper(args[1])

    if not validWeatherTypes[weatherType] then
        TriggerClientEvent('chat:addMessage', source, {
            color = { 255, 0, 0 },
            args = { "Mistake", "Invalid weather type: " .. weatherType }
        })
        return
    end

    TriggerClientEvent("setWeather", -1, weatherType)
    print(("The weather has been changed: %s"):format(weatherType))

    TriggerClientEvent('chat:addMessage', -1, {
        color = { 0, 255, 0 },
        args = { "Weather", "New weather: " .. weatherType }
    })
end, true)

RegisterCommand("settime", function(source, args)
    local hour = tonumber(args[1])
    local minute = tonumber(args[2])

    if not hour or hour < 0 or hour > 23 then
        TriggerClientEvent('chat:addMessage', source, {
            color = { 255, 0, 0 },
            args = { "Mistake", "Invalid time value! Time must be between 0 and 23." }
        })
        return
    end

    if not minute or minute < 0 or minute > 59 then
        TriggerClientEvent('chat:addMessage', source, {
            color = { 255, 0, 0 },
            args = { "Mistake", "Invalid minute value! Minute must be between 0 and 59." }
        })
        return
    end

    TriggerClientEvent("setTime", -1, hour, minute)
    print(("Time has been changed: %02d:%02d"):format(hour, minute))

    TriggerClientEvent('chat:addMessage', -1, {
        color = { 0, 255, 0 },
        args = { "Time", ("New time: %02d:%02d"):format(hour, minute) }
    })
end, true)