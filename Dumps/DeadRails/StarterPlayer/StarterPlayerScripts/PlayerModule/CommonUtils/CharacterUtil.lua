--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CommonUtils.CharacterUtil
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:27
-- Luau version 6, Types version 3
-- Time taken: 0.002527 seconds

local Players_upvr = game:GetService("Players")
local module_upvr = {
	LOCAL_PLAYER = "LOCAL_PLAYER";
	ON_LOCAL_PLAYER = "ON_LOCAL_PLAYER";
	CHARACTER_ADDED = "CHARACTER_ADDED";
	ON_CHARACTER = "ON_CHARACTER";
	CHARACTER_CHILD_ADDED = "CHARACTER_CHILD_ADDED";
}
local module_upvr_2 = {
	_connectionUtil = require(script.Parent:WaitForChild("ConnectionUtil")).new();
	_boundEvents = {};
	getLocalPlayer = function() -- Line 53, Named "getLocalPlayer"
		--[[ Upvalues[1]:
			[1]: Players_upvr (readonly)
		]]
		return Players_upvr.LocalPlayer
	end;
}
function module_upvr_2.onLocalPlayer(arg1) -- Line 57
	--[[ Upvalues[3]:
		[1]: module_upvr_2 (readonly)
		[2]: module_upvr (readonly)
		[3]: Players_upvr (readonly)
	]]
	local any_getLocalPlayer_result1 = module_upvr_2.getLocalPlayer()
	if any_getLocalPlayer_result1 then
		arg1(any_getLocalPlayer_result1)
	end
	module_upvr_2._connectionUtil:trackConnection(module_upvr.LOCAL_PLAYER, Players_upvr:GetPropertyChangedSignal("LocalPlayer"):Connect(function() -- Line 66
		--[[ Upvalues[2]:
			[1]: module_upvr_2 (copied, readonly)
			[2]: module_upvr (copied, readonly)
		]]
		local any_getLocalPlayer_result1_2 = module_upvr_2.getLocalPlayer()
		assert(any_getLocalPlayer_result1_2)
		module_upvr_2._getOrCreateBoundEvent(module_upvr.LOCAL_PLAYER):Fire(any_getLocalPlayer_result1_2)
	end))
	return module_upvr_2._getOrCreateBoundEvent(module_upvr.LOCAL_PLAYER).Event:Connect(arg1)
end
function module_upvr_2.getCharacter() -- Line 77
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local any_getLocalPlayer_result1_3 = module_upvr_2.getLocalPlayer()
	if not any_getLocalPlayer_result1_3 then
		return nil
	end
	return any_getLocalPlayer_result1_3.Character
end
function module_upvr_2.onCharacter(arg1) -- Line 85
	--[[ Upvalues[2]:
		[1]: module_upvr_2 (readonly)
		[2]: module_upvr (readonly)
	]]
	module_upvr_2._connectionUtil:trackConnection(module_upvr.ON_LOCAL_PLAYER, module_upvr_2.onLocalPlayer(function(arg1_2) -- Line 89
		--[[ Upvalues[3]:
			[1]: module_upvr_2 (copied, readonly)
			[2]: arg1 (readonly)
			[3]: module_upvr (copied, readonly)
		]]
		local any_getCharacter_result1 = module_upvr_2.getCharacter()
		if any_getCharacter_result1 then
			arg1(any_getCharacter_result1)
		end
		module_upvr_2._connectionUtil:trackConnection(module_upvr.CHARACTER_ADDED, arg1_2.CharacterAdded:Connect(function(arg1_3) -- Line 98
			--[[ Upvalues[2]:
				[1]: module_upvr_2 (copied, readonly)
				[2]: module_upvr (copied, readonly)
			]]
			assert(arg1_3)
			module_upvr_2._getOrCreateBoundEvent(module_upvr.CHARACTER_ADDED):Fire(arg1_3)
		end))
	end))
	return module_upvr_2._getOrCreateBoundEvent(module_upvr.CHARACTER_ADDED).Event:Connect(arg1)
end
function module_upvr_2.getChild(arg1, arg2) -- Line 110
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local any_getCharacter_result1_2 = module_upvr_2.getCharacter()
	if not any_getCharacter_result1_2 then
		return nil
	end
	local SOME = any_getCharacter_result1_2:FindFirstChild(arg1)
	if SOME and SOME:IsA(arg2) then
		return SOME
	end
	return nil
end
function module_upvr_2.onChild(arg1, arg2, arg3) -- Line 122
	--[[ Upvalues[2]:
		[1]: module_upvr_2 (readonly)
		[2]: module_upvr (readonly)
	]]
	module_upvr_2._connectionUtil:trackConnection(module_upvr.ON_CHARACTER, module_upvr_2.onCharacter(function(arg1_4) -- Line 126
		--[[ Upvalues[5]:
			[1]: module_upvr_2 (copied, readonly)
			[2]: arg1 (readonly)
			[3]: arg2 (readonly)
			[4]: arg3 (readonly)
			[5]: module_upvr (copied, readonly)
		]]
		local any_getChild_result1 = module_upvr_2.getChild(arg1, arg2)
		if any_getChild_result1 then
			arg3(any_getChild_result1)
		end
		module_upvr_2._connectionUtil:trackConnection(module_upvr.CHARACTER_CHILD_ADDED, arg1_4.ChildAdded:Connect(function(arg1_5) -- Line 135
			--[[ Upvalues[4]:
				[1]: arg1 (copied, readonly)
				[2]: arg2 (copied, readonly)
				[3]: module_upvr_2 (copied, readonly)
				[4]: module_upvr (copied, readonly)
			]]
			if arg1_5.Name == arg1 and arg1_5:IsA(arg2) then
				module_upvr_2._getOrCreateBoundEvent(module_upvr.CHARACTER_CHILD_ADDED..arg1..arg2):Fire(arg1_5)
			end
		end))
	end))
	return module_upvr_2._getOrCreateBoundEvent(module_upvr.CHARACTER_CHILD_ADDED..arg1..arg2).Event:Connect(arg3)
end
function module_upvr_2._getOrCreateBoundEvent(arg1) -- Line 149
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	if not module_upvr_2._boundEvents[arg1] then
		module_upvr_2._boundEvents[arg1] = Instance.new("BindableEvent")
	end
	return module_upvr_2._boundEvents[arg1]
end
return module_upvr_2