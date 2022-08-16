ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('jeppe_atmz:depositz')
AddEventHandler('jeppe_atmz:depositz', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local accountMoney = 0
	accountMoney = xPlayer.getAccount('bank').money
	amount = tonumber(amount)

	if xPlayer.getMoney() >= amount then
	xPlayer.removeMoney(amount)
	xPlayer.addAccountMoney('bank', amount)
	TriggerClientEvent('esx:showNotification', _source, 'Du satte in ~g~' .. amount .. '~w~ SEK')
	else
		TriggerClientEvent('esx:showNotification', _source, 'Någonting gick fel!')
	end
end)

RegisterServerEvent('jeppe_atmz:withdrawz')
AddEventHandler('jeppe_atmz:withdrawz', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local accountMoney = 0
	accountMoney = xPlayer.getAccount('bank').money
	amount = tonumber(amount)

	if accountMoney >= amount then
	xPlayer.removeAccountMoney('bank', amount)
	xPlayer.addMoney(amount)
	TriggerClientEvent('esx:showNotification', _source, 'Du tog ut ~g~' .. amount .. '~w~ SEK')
else
	TriggerClientEvent('esx:showNotification', _source, 'Någonting gick fel!')
	end
end)