--[[
    Script: ReplicatedStorage.Client.LocalPlayerObjectsContainer
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:46
-- Luau version 6, Types version 3
-- Time taken: 0.001150 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local module_upvr = {
	_objects = {};
}
local PlayerDataController_upvr = require(ReplicatedStorage.Client.Controllers.PlayerDataController)
local CharacterLoadedWrapper_upvr = require(ReplicatedStorage.Packages.CharacterLoadedWrapper)
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local PlayerClassData_upvr = require(ReplicatedStorage.Shared.PlayerClassData)
function module_upvr.registerLocalPlayer() -- Line 28
	--[[ Upvalues[5]:
		[1]: PlayerDataController_upvr (readonly)
		[2]: module_upvr (readonly)
		[3]: CharacterLoadedWrapper_upvr (readonly)
		[4]: LocalPlayer_upvr (readonly)
		[5]: PlayerClassData_upvr (readonly)
	]]
	local Data = PlayerDataController_upvr.getPlayerDataReplica().Data
	module_upvr._objects = {
		_characterLoadedWrapper = CharacterLoadedWrapper_upvr.new(LocalPlayer_upvr);
		_playerClassData = PlayerClassData_upvr.new(Data.currentClass, Data.classData);
	}
end
function module_upvr.waitForRegisteredAsync() -- Line 37
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	while not next(module_upvr._objects) do
		task.wait()
	end
end
function module_upvr.getCharacterLoadedWrapper() -- Line 43
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr._objects._characterLoadedWrapper
end
function module_upvr.getPlayerClassData() -- Line 47
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr._objects._playerClassData
end
return module_upvr