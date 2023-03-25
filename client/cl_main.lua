CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local chain = GetPedDrawableVariation(playerPed, 7)

        if Config.Chains[chain] then
            TriggerServerEvent("ps-bling:server:effects", PedToNet(playerPed), coords)
        end

        Wait(math.random(Config.BlingTime.Min, Config.BlingTime.Max) * 1000)

        local distance = #(GetEntityCoords(playerPed) - coords)
        if distance <= 300 then
            if DoesEntityExist(playerPed) and not IsEntityDead(playerPed) then
                Bling = UseParticleFxAssetNextCall("core")
                Particle = StartParticleFxLoopedOnEntityBone("fire_wrecked_plane_cockpit", playerPed, 0.35, 0.25, 0.0, 0.0, 0.0, 0.0, GetPedBoneIndex(playerPed, 23553), 0.01, 0.0, 0.0, 0.0)
                Wait(2800)
                StopParticleFxLooped(Bling, 1)
                StopParticleFxLooped(Particle, 1)
                StopParticleFxLooped("fire_wrecked_plane_cockpit", 1)
                StopParticleFxLooped("core", 1)
                Wait(2800 * 3)
                RemoveParticleFxFromEntity(playerPed)
            end
        end
    end
end)