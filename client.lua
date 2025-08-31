local weatherTypes = {
    ["CLEAR"] = "Clear",
    ["EXTRASUNNY"] = "Extra Sunny",
    ["CLOUDS"] = "Clouds",
    ["OVERCAST"] = "Overcast",
    ["RAIN"] = "Raın",
    ["CLEARING"] = "Clearing",
    ["THUNDER"] = "Thunder",
    ["SMOG"] = "Smog",
    ["FOGGY"] = "Foggy",
    ["XMAS"] = "Xmas",
    ["SNOWLIGHT"] = "Snowlight",
    ["BLIZZARD"] = "Blizzard"
}

RegisterCommand("weather", function()
    local weatherHash = GetPrevWeatherTypeHashName()
    local weatherName = "unknown"

    for name, label in pairs(weatherTypes) do
        if GetHashKey(name) == weatherHash then
            weatherName = label
            break
        end
    end

    TriggerEvent('chat:addMessage', {
        color = { 0, 255, 255 },
        multiline = true,
        args = { "Weather", "Current Weather: " .. weatherName }
    })
end, false)

RegisterNetEvent("setWeather")
AddEventHandler("setWeather", function(weather)
    print("[Client] The weather is being changed: " .. weather)
    SetWeatherTypeOvertimePersist(weather, 1.0)
    SetWeatherTypeNowPersist(weather)
    SetWeatherTypeNow(weather)
    ClearOverrideWeather()
end)

RegisterNetEvent("setTime")
AddEventHandler("setTime", function(hour, minute)
    NetworkOverrideClockTime(hour, minute, 0)
end)