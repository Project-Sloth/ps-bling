local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("ps-bling:server:effects", function(entity, coords)
	for _, player in pairs(QBCore.Functions.GetPlayers()) do
        local ped = GetPlayerPed(player)
        local pcoords = GetEntityCoords(ped)
        local dist = #(pcoords - coords)
        if dist <= 300 then
            TriggerClientEvent("ps-bling:client:effects", player, entity, coords)
        end
    end
end)