ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

Citizen.CreateThread(function()
	sleepThread = 100
	isInArea = false
	while true do
		for k, v in pairs(Config.Locations) do
			if Vdist(v.x, v.y, v.z, GetEntityCoords(PlayerPedId())) < 0.8 and not isInArea then
				isInArea = true
				sleepThread = 5
				ESX.ShowHelpNotification('Tryck ~INPUT_CONTEXT~ för att använda bankomaten!')

				if IsControlJustReleased(0, 51) then
					TriggerEvent('jeppe_atmz:open')
					isInArea = false
				end
			else
				isInArea = false
			end
		end
		Citizen.Wait(sleepThread)
	end
end)