local function serializeKvpString(prefix, suffix)
    return string.format('%s:%s', prefix, suffix)
end

local function deserializeKvpString(kvpString)
    local prefix, suffix = string.match(kvpString, '([^:]*):([^:]*)')
    return prefix, suffix
end

function getPlayerPrefixSuffix(identifier)
    local kvpString = GetResourceKvpString(string.format(PREFIX_SUFFIX_KVP_KEY, identifier))

    local prefix = ''
    local suffix = ''

    if Config.UseQBCallsigns and isBridgeLoaded('Framework', Framework.QBCore) then
        prefix = Framework.getCallsign(identifier) or ''
    end

    if kvpString ~= nil then
        prefix, suffix = deserializeKvpString(kvpString)
    end

    return prefix, suffix
end

function setPlayerPrefixSuffix(identifier, prefix, suffix, client)
    local kvpString = serializeKvpString(prefix, suffix)
    SetResourceKvp(string.format(PREFIX_SUFFIX_KVP_KEY, identifier), kvpString)
    if client ~= nil then
        initializePlayer(client)
    end
end

function removePlayerPrefixSuffix(identifier)
    SetResourceKvp(string.format(PREFIX_SUFFIX_KVP_KEY, identifier), '')
end

AddEventHandler('rcore_job_blips:prefix_suffix:set', setPlayerPrefixSuffix)
AddEventHandler('rcore_job_blips:prefix_suffix:remove', removePlayerPrefixSuffix)

exports('getPlayerPrefixSuffix', getPlayerPrefixSuffix)
