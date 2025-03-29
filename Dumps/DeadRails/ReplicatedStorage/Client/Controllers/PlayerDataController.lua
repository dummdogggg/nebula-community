--[[
    Script: ReplicatedStorage.Client.Controllers.PlayerDataController
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:58
-- Luau version 6, Types version 3
-- Time taken: 0.001001 seconds

local module_upvr = {
	_replica = nil;
}
function module_upvr.isPlayerDataLoaded() -- Line 11
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr.hasLoaded()
end
function module_upvr.getPlayerDataReplica() -- Line 15
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr.getReplica()
end
function module_upvr.hasLoaded() -- Line 20
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var2
	if module_upvr._replica == nil then
		var2 = false
	else
		var2 = true
	end
	return var2
end
function module_upvr.waitForDataLoadAsync() -- Line 24
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	while not module_upvr.isPlayerDataLoaded() do
		task.wait()
	end
end
function module_upvr.getReplica() -- Line 30
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if not module_upvr.isPlayerDataLoaded() then
		error("Cannot getPlayerDataReplica; Player data is not loaded!")
	end
	return module_upvr._replica
end
return module_upvr