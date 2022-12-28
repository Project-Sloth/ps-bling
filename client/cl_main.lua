CreateThread(function()
	while true do
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		local chain = GetPedDrawableVariation(ped, 7)
		if Config.Chains[chain] then
			TriggerServerEvent("ps-bling:server:effects", PedToNet(ped), coords)
		end
		Wait(math.random(Config.BlingTime.Min, Config.BlingTime.Max) * 1000)
	end
end)

RegisterNetEvent("ps-bling:client:effects", function(ped, coords)
	local distance = #(GetEntityCoords(PlayerPedId()) - coords)
	ped = NetToPed(ped)
	if distance <= 300 then
		if DoesEntityExist(ped) and not IsEntityDead(ped) then
			Bling = UseParticleFxAssetNextCall("core")
			Particle = StartParticleFxLoopedOnEntityBone("fire_wrecked_plane_cockpit", ped, 0.35, 0.25, 0.0, 0.0, 0.0, 0.0, GetPedBoneIndex(ped, 23553), 0.01, 0.0, 0.0, 0.0)
			Wait(2800)
			while DoesParticleFxLoopedExist(Bling) do
				StopParticleFxLooped(Bling, 1)
				Wait(0)
			end
			while DoesParticleFxLoopedExist(Particle) do
				StopParticleFxLooped(Particle, 1)
				Wait(0)
			end
			while DoesParticleFxLoopedExist("fire_wrecked_plane_cockpit") do
				StopParticleFxLooped("fire_wrecked_plane_cockpit", 1)
				Wait(0)
			end
			while DoesParticleFxLoopedExist("core" ) do
				StopParticleFxLooped("core" , 1)
				Wait(0)
			end
			Wait(2800*3)
			RemoveParticleFxFromEntity(ped)
		end
	end
end)
