if isBridgeLoaded('Framework', Framework.ESX) then
    local ESX = nil

    local success, result = pcall(function()
        ESX = exports[Framework.ESX]:getSharedObject()
    end)

    if not success then
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end

    Framework.object = ESX
end
