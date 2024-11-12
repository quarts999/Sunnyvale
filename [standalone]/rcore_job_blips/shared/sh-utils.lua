local prefixes = {
    ['error'] = '^1[%s:error] ^7',
    ['warn'] = '^3[%s:warn] ^7',
    ['info'] = '^2[%s:info] ^7',
    ['load'] = '^3[%s:load] ^7',
    ['debug'] = '^5[%s:debug] ^7',
}

log = {}

for name, prefix in pairs(prefixes) do
    if name == 'debug' and not Config.Debug then
        log.debug = function(content, ...)
        end
    else
        log[name] = function(content, ...)
            print(prefix:format(GetCurrentResourceName()) .. content:format(...))
        end
    end
end

function log.table(_table, debug)
    if debug and not Config.Debug then return end

    if type(_table) ~= 'table' then return end

    print(json.encode(_table, { indent = true }))
end

function isResourceLoaded(resource)
    if resource == NONE_RESOURCE then return true end

    local state = GetResourceState(resource)
    return state == 'started' or state == 'starting'
end

function isBridgeLoaded(type, resource)
    return Bridge[type] == resource
end
