
aff("sound.lua")
--If you want to use something else than xsound just edit the above func to match the export of your own sound system
function playSoundUrlPos(name,soundFile,volume,coords,loop,options)
	exports.xsound:PlayUrlPos(name,soundFile,volume,coords,loop,options)
	-- TriggerEvent("InteractSound_CL:PlayWithinDistance",coords,15.0,soundFile,volume)
end

function playSoundUrl(name,soundFile,volume,loop,options)
	exports.xsound:PlayUrl(name,soundFile,volume, loop, options)
	-- TriggerEvent("InteractSound_CL:PlayOnOne",soundFile,volume)
end