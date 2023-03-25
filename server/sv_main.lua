local QBCore = exports['qb-core']:GetCoreObject()

local function updatePlayerPosition(playerId)
    local ped = GetPlayerPed(playerId)
    local coords = GetEntityCoords(ped)
    local playerState = Player(playerId).state

    playerState:set("ps-bling:coords", {
        x = coords.x,
        y = coords.y,
        z = coords.z
    }, true)
end

RegisterNetEvent("ps-bling:server:effects", function(entity, coords)
    for _, player in pairs(QBCore.Functions.GetPlayers()) do
        local playerState = Player(player).state
        local pcoords = QBCore.Functions.GetCoords(ped)

        if pcoords then
            local dist = #(vector3(pcoords.x, pcoords.y, pcoords.z) - coords)
            if dist <= 300 then
                TriggerClientEvent("ps-bling:client:effects", player, entity, coords)
            end
        end
    end
end)