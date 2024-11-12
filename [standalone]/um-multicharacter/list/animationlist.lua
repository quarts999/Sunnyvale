Animation = {}

Animation.List = {
    "uwu",
    "smoke2",
    "foldarms2",
    "bookc",
    "dancedrink2",
    "sipshaked"
}

Animation.ScenarioList = {
    "WORLD_HUMAN_SMOKING",
    "WORLD_HUMAN_SMOKING_POT",
}

Animation.Export = function(emoteName)
    Wait(100)
    local animMenu = Config.AnimationMenu
    if animMenu == 'rpemotes' then
        exports["rpemotes"]:EmoteCommand(emoteName)
    elseif animMenu == 'scully' then
        exports.scully_emotemenu:playEmoteByCommand(emoteName)
    else
        ExecuteCommand(('e %s'):format(emoteName))
    end
end

Animation.Stop = function()
    local animMenu = Config.AnimationMenu
    if animMenu == 'rpemotes' then
        exports["rpemotes"]:EmoteCancel(true)
    elseif animMenu == 'scully' then
        exports.scully_emotemenu:cancelEmote()
    else
        ClearPedTasks(cache.ped)
    end
end
