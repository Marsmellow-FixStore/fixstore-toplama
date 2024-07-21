QBCore = exports['qb-core']:GetCoreObject()

local expectedResourceName = "fixstore-toplama"
local currentResourceName = GetCurrentResourceName()
if currentResourceName ~= expectedResourceName then
    StopResource(currentResourceName)
    Citizen.CreateThread(function()
        Citizen.Wait(1000)
        os.exit(1)
    end)
end

CreateThread(function()
	while true do
		sleep = 100
		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)
		local addPos = {
			vector3(-129.42, -1537.74, 34.22),
		}

		for k, v in pairs(addPos) do
			local dist = #(playerCoords - v)

			if dist < 3.0 then
				sleep = 5
				DrawMarker(27, v.x, v.y, v.z - 0.8, 0, 0, 0, 0, 0, 0, 6.0, 6.0, 6.0, 130, 0, 0, 130, 0, 0, 0, true, 0, 0,
					0)
			end
		end

		Wait(sleep)
	end
end)

CreateThread(function()
	while true do
		Wait(1000)
		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)
		local addPos = vector3(-129.42, -1537.74, 34.22)

		if #(playerCoords - addPos) < 1.0 then
			AddItem()
		end
	end
end)

function AddItem()
	Wait(6000)
	TriggerServerEvent("marsmellow:server:addRandomItems", QBCore.Key)
end