--[[
    Script: ReplicatedStorage.Packages.CharacterLoadedWrapper
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:35
-- Luau version 6, Types version 3
-- Time taken: 0.004121 seconds

local Workspace_upvr = game:GetService("Workspace")
local function _(arg1) -- Line 29, Named "isPrimaryPartSet"
	if arg1.PrimaryPart then
		return true
	end
	return false
end
local function _(arg1) -- Line 33, Named "isHumanoidRootPartSet"
	if arg1.RootPart then
		return true
	end
	return false
end
local function _(arg1) -- Line 37, Named "getHumanoid"
	return arg1:FindFirstChildOfClass("Humanoid")
end
local function _(arg1) -- Line 41, Named "isHumanoidAlive"
	local class_Humanoid = arg1:FindFirstChildOfClass("Humanoid")
	local var3
	if not class_Humanoid then
		var3 = false
		return var3
	end
	if class_Humanoid.RootPart then
		var3 = true
	else
		var3 = false
	end
	if var3 then
		if 0 >= class_Humanoid.Health then
			var3 = false
		else
			var3 = true
		end
	end
	return var3
end
local module_upvr = {}
module_upvr.__index = module_upvr
local ._Signal_upvr = require("./Signal")
function module_upvr.new(arg1) -- Line 65
	--[[ Upvalues[2]:
		[1]: ._Signal_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	local module = {
		loaded = ._Signal_upvr.new();
		died = ._Signal_upvr.new();
	}
	module._player = arg1
	module._destroyed = false
	module._connections = {}
	setmetatable(module, module_upvr)
	module:_listenForCharacterAdded()
	return module
end
function module_upvr.isLoaded(arg1, arg2) -- Line 80
	--[[ Upvalues[1]:
		[1]: Workspace_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var7 = arg2
	if not var7 then
		var7 = arg1._player.Character
	end
	if not var7 then
		return false
	end
	if var7.PrimaryPart then
	else
	end
	if false then
		local class_Humanoid_3 = var7:FindFirstChildOfClass("Humanoid")
		if not class_Humanoid_3 then
			local _ = false
		else
			if class_Humanoid_3.RootPart then
			else
			end
			if false then
				if 0 >= class_Humanoid_3.Health then
				else
				end
			end
		end
		if true then
		end
	end
	return var7:IsDescendantOf(Workspace_upvr)
end
function module_upvr._listenForCharacterAdded(arg1) -- Line 95
	task.spawn(function() -- Line 96
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		local Character = arg1._player.Character
		if Character then
			if arg1:isLoaded() then
				arg1:_listenForDeath(Character)
			else
				arg1:_waitForLoadedAsync(Character)
			end
		end
		table.insert(arg1._connections, arg1._player.CharacterAdded:Connect(function(arg1_2) -- Line 108
			--[[ Upvalues[1]:
				[1]: arg1 (copied, readonly)
			]]
			arg1:_waitForLoadedAsync(arg1_2)
		end))
	end)
end
function module_upvr._waitForLoadedAsync(arg1, arg2) -- Line 118
	--[[ Upvalues[1]:
		[1]: Workspace_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [67] 52. Error Block 30 start (CF ANALYSIS FAILED)
	if not arg1:isLoaded(arg2) then
	else
		-- KONSTANTERROR: [67] 52. Error Block 30 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [73] 57. Error Block 29 start (CF ANALYSIS FAILED)
		if arg1._destroyed then return end
		arg1:_listenForDeath(arg2)
		arg1.loaded:Fire(arg2)
		-- KONSTANTERROR: [73] 57. Error Block 29 end (CF ANALYSIS FAILED)
	end
end
function module_upvr._listenForDeath(arg1, arg2) -- Line 169
	--[[ Upvalues[1]:
		[1]: Workspace_upvr (readonly)
	]]
	local class_Humanoid_2 = arg2:FindFirstChildOfClass("Humanoid")
	local var14_upvw = false
	local var15_upvw
	local var16_upvw
	local var17_upvw
	var17_upvw = class_Humanoid_2.Died:Connect(function() -- Line 179, Named "onDied"
		--[[ Upvalues[6]:
			[1]: var14_upvw (read and write)
			[2]: var17_upvw (read and write)
			[3]: var15_upvw (read and write)
			[4]: var16_upvw (read and write)
			[5]: arg1 (readonly)
			[6]: arg2 (readonly)
		]]
		if var14_upvw then
		else
			var14_upvw = true
			var17_upvw:Disconnect()
			var15_upvw:Disconnect()
			var16_upvw:Disconnect()
			arg1.died:Fire(arg2)
		end
	end)
	local var18_upvw = var17_upvw
	var16_upvw = class_Humanoid_2.HealthChanged:Connect(function(arg1_3) -- Line 193
		--[[ Upvalues[6]:
			[1]: var14_upvw (read and write)
			[2]: var18_upvw (read and write)
			[3]: var15_upvw (read and write)
			[4]: var16_upvw (read and write)
			[5]: arg1 (readonly)
			[6]: arg2 (readonly)
		]]
		if arg1_3 <= 0 then
			if var14_upvw then return end
			var14_upvw = true
			var18_upvw:Disconnect()
			var15_upvw:Disconnect()
			var16_upvw:Disconnect()
			arg1.died:Fire(arg2)
		end
	end)
	local var20_upvw = var16_upvw
	var15_upvw = arg2.AncestryChanged:Connect(function() -- Line 202
		--[[ Upvalues[7]:
			[1]: arg2 (readonly)
			[2]: Workspace_upvr (copied, readonly)
			[3]: var14_upvw (read and write)
			[4]: var18_upvw (read and write)
			[5]: var15_upvw (read and write)
			[6]: var20_upvw (read and write)
			[7]: arg1 (readonly)
		]]
		if not arg2:IsDescendantOf(Workspace_upvr) then
			if var14_upvw then return end
			var14_upvw = true
			var18_upvw:Disconnect()
			var15_upvw:Disconnect()
			var20_upvw:Disconnect()
			arg1.died:Fire(arg2)
		end
	end)
	table.insert(arg1._connections, var18_upvw)
	table.insert(arg1._connections, var15_upvw)
	table.insert(arg1._connections, var20_upvw)
end
function module_upvr.destroy(arg1) -- Line 213
	arg1.loaded:DisconnectAll()
	arg1.died:DisconnectAll()
	arg1._destroyed = true
	for _, v in pairs(arg1._connections) do
		v:Disconnect()
	end
end
return module_upvr