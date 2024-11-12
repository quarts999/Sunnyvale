--------------------------------------------------------------------------------------------
-- If you have any problem, please put this to true and open a ticket on PATAMODS Discord --
--------------------------------------------------------------------------------------------
DEBUG = false
ENABLECOMMAND = false

-- aff("debug.lua")
						-- aff("hjsuzhogho")
function aff(text)
	if DEBUG then
		print(text)
	end
end

function affError(text)
	print("^1"..text.."^7")
end

function affWarning(text)
	print("^2"..text.."^7")
end

function consoleDisplay(text)
	-- if DEBUG then
		aff(text)
	-- end
end

if DEBUG then

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(2)
			-- if IsControlJustReleased(1, 85) then
				-- local a,b,c = table.unpack(GetEntityCoords(PlayerPedId()))
				-- local head = GetEntityHeading(PlayerPedId())
				
				-- print("x= "..tostring(a)..", y= "..tostring(b)..", z= "..tostring(c)..", h= "..tostring(head))
			-- end
			
			-- print(IsMinimapRendering())
		end
	end)
end