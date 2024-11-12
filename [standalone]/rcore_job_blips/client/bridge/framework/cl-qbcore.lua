if isBridgeLoaded('Framework', Framework.QBCore) then
    local QBCore = nil

    local success = pcall(function()
        QBCore = exports[Framework.QBCore]:GetCoreObject()
    end)

    if not success then
        success = pcall(function()
            QBCore = exports[Framework.QBCore]:GetSharedObject()
        end)
    end

    if not success then
        local breakPoint = 0
        while not QBCore do
            Wait(100)
            TriggerEvent('QBCore:GetObject', function(obj)
                QBCore = obj
            end)

            breakPoint = breakPoint + 1
            if breakPoint == 25 then
                log.error('Could not load the sharedobject, are you sure it is called \'QBCore:GetObject\'?')
                break
            end
        end
    end

    Framework.object = QBCore

    RegisterNetEvent('QBCore:Client:SetDuty', function(newDuty)
        if not newDuty then
            TriggerServerEvent('rcore_job_blips:changeOffDutyState', true)
            return
        end

        TriggerServerEvent('rcore_job_blips:changeOffDutyState', false)
    end)
end
