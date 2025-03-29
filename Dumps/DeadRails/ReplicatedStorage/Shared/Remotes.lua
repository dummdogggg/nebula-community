--[[
    Script: ReplicatedStorage.Shared.Remotes
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:41
-- Luau version 6, Types version 3
-- Time taken: 0.001032 seconds

local RunService_upvr = game:GetService("RunService")
local function getOrCreateEventAsync(arg1, arg2) -- Line 6
	--[[ Upvalues[1]:
		[1]: RunService_upvr (readonly)
	]]
	local any_IsServer_result1 = RunService_upvr:IsServer()
	if any_IsServer_result1 then
		if arg2 then
			any_IsServer_result1 = Instance.new("UnreliableRemoteEvent")
		else
			any_IsServer_result1 = Instance.new("RemoteEvent")
		end
		any_IsServer_result1.Name = arg1
		any_IsServer_result1.Parent = script
		return any_IsServer_result1
	end
	return script:WaitForChild(arg1)
end
return {
	Events = {
		RequestStartDrag = getOrCreateEventAsync("RequestStartDrag");
		UpdateDrag = getOrCreateEventAsync("UpdateDrag", true);
		RequestStopDrag = getOrCreateEventAsync("RequestStopDrag");
		RequestWeld = getOrCreateEventAsync("RequestWeld");
		RequestUnweld = getOrCreateEventAsync("RequestUnweld");
		AttachRope = getOrCreateEventAsync("AttachRope");
		RagdollFlop = getOrCreateEventAsync("RagdollFlop");
		EatCorpse = getOrCreateEventAsync("EatCorpse");
		DropAmmo = getOrCreateEventAsync("DropAmmo");
		DropEquipment = getOrCreateEventAsync("DropEquipment");
		TEMP_PlayMeleeAttack = getOrCreateEventAsync("TEMP_PlayMeleeAttack", true);
		DisplayGameMode = getOrCreateEventAsync("DisplayGameMode");
	};
	Promises = {
		InteractWithObject = require(game:GetService("ReplicatedStorage").Packages.RemotePromise).new("InteractWithObject");
	};
}