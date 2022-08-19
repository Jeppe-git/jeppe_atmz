RegisterNUICallback('close', function(data, cb)
	SetNuiFocus(false, false)
end)

RegisterNetEvent('jeppe_atmz:open')
AddEventHandler('jeppe_atmz:open', function()
	ESX.TriggerServerCallback('esx:getPlayerData', function(data)
    SetNuiFocus(true, true)
	SendNUIMessage({
		type = 'OPEN',
		player = {
			money = data.money,
			accounts = data.accounts,
			}
		})
	end)
end)

RegisterNUICallback('withdrawz', function(data, cb)
	TriggerServerEvent('jeppe_atmz:withdrawz', data.amount)
    cb('ok')
end)

RegisterNUICallback('depositz', function(data, cb)
	TriggerServerEvent('jeppe_atmz:depositz', data.amount)
    cb('ok')
end)

RegisterCommand('openatmz', function()
    TriggerEvent('jeppe_atmz:open')
end)