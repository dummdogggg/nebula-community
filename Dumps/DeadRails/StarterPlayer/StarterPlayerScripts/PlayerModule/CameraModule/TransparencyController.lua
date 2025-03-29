--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.TransparencyController
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:05
-- Luau version 6, Types version 3
-- Time taken: 0.006279 seconds

local tbl_2_upvr = {"BasePart", "Decal", "Beam", "ParticleEmitter", "Trail", "Fire", "Smoke", "Sparkles", "Explosion"}
local pcall_result1, pcall_result2 = pcall(function() -- Line 27
	return UserSettings():IsUserFeatureEnabled("UserHideCharacterParticlesInFirstPerson")
end)
local module_upvr = {}
module_upvr.__index = module_upvr
function module_upvr.new() -- Line 38
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, module_upvr)
	setmetatable_result1.transparencyDirty = false
	setmetatable_result1.enabled = false
	setmetatable_result1.lastTransparency = nil
	setmetatable_result1.descendantAddedConn = nil
	setmetatable_result1.descendantRemovingConn = nil
	setmetatable_result1.toolDescendantAddedConns = {}
	setmetatable_result1.toolDescendantRemovingConns = {}
	setmetatable_result1.cachedParts = {}
	return setmetatable_result1
end
function module_upvr.HasToolAncestor(arg1, arg2) -- Line 54
	if arg2.Parent == nil then
		return false
	end
	assert(arg2.Parent, "")
	local children = arg2.Parent:IsA("Tool")
	if not children then
		children = arg1:HasToolAncestor(arg2.Parent)
	end
	return children
end
local var8_upvw = pcall_result1 and pcall_result2
function module_upvr.IsValidPartToModify(arg1, arg2) -- Line 60
	--[[ Upvalues[2]:
		[1]: var8_upvw (read and write)
		[2]: tbl_2_upvr (readonly)
	]]
	if var8_upvw then
		for i, v in tbl_2_upvr do
			if arg2:IsA(v) then
				return not arg1:HasToolAncestor(arg2)
			end
		end
	elseif arg2:IsA("BasePart") or arg2:IsA("Decal") then
		i = arg2
		return not arg1:HasToolAncestor(i)
	end
	return false
end
function module_upvr.CachePartsRecursive(arg1, arg2) -- Line 76
	if arg2 then
		if arg1:IsValidPartToModify(arg2) then
			arg1.cachedParts[arg2] = true
			arg1.transparencyDirty = true
		end
		for _, v_2 in pairs(arg2:GetChildren()) do
			arg1:CachePartsRecursive(v_2)
		end
	end
end
function module_upvr.TeardownTransparency(arg1) -- Line 88
	for i_3, _ in pairs(arg1.cachedParts) do
		i_3.LocalTransparencyModifier = 0
	end
	arg1.cachedParts = {}
	arg1.transparencyDirty = true
	arg1.lastTransparency = nil
	if arg1.descendantAddedConn then
		arg1.descendantAddedConn:disconnect()
		arg1.descendantAddedConn = nil
	end
	if arg1.descendantRemovingConn then
		arg1.descendantRemovingConn:disconnect()
		arg1.descendantRemovingConn = nil
	end
	for i_4, v_4 in pairs(arg1.toolDescendantAddedConns) do
		v_4:Disconnect()
		arg1.toolDescendantAddedConns[i_4] = nil
	end
	for i_5, v_5 in pairs(arg1.toolDescendantRemovingConns) do
		v_5:Disconnect()
		arg1.toolDescendantRemovingConns[i_5] = nil
	end
end
function module_upvr.SetupTransparency(arg1, arg2) -- Line 114
	arg1:TeardownTransparency()
	if arg1.descendantAddedConn then
		arg1.descendantAddedConn:disconnect()
	end
	arg1.descendantAddedConn = arg2.DescendantAdded:Connect(function(arg1_2) -- Line 118
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
		]]
		if arg1:IsValidPartToModify(arg1_2) then
			arg1.cachedParts[arg1_2] = true
			arg1.transparencyDirty = true
		elseif arg1_2:IsA("Tool") then
			if arg1.toolDescendantAddedConns[arg1_2] then
				arg1.toolDescendantAddedConns[arg1_2]:Disconnect()
			end
			arg1.toolDescendantAddedConns[arg1_2] = arg1_2.DescendantAdded:Connect(function(arg1_3) -- Line 126
				--[[ Upvalues[1]:
					[1]: arg1 (copied, readonly)
				]]
				arg1.cachedParts[arg1_3] = nil
				if arg1_3:IsA("BasePart") or arg1_3:IsA("Decal") then
					arg1_3.LocalTransparencyModifier = 0
				end
			end)
			if arg1.toolDescendantRemovingConns[arg1_2] then
				arg1.toolDescendantRemovingConns[arg1_2]:disconnect()
			end
			arg1.toolDescendantRemovingConns[arg1_2] = arg1_2.DescendantRemoving:Connect(function(arg1_4) -- Line 134
				--[[ Upvalues[2]:
					[1]: arg2 (copied, readonly)
					[2]: arg1 (copied, readonly)
				]]
				wait()
				if arg2 and arg1_4 and arg1_4:IsDescendantOf(arg2) and arg1:IsValidPartToModify(arg1_4) then
					arg1.cachedParts[arg1_4] = true
					arg1.transparencyDirty = true
				end
			end)
		end
	end)
	if arg1.descendantRemovingConn then
		arg1.descendantRemovingConn:disconnect()
	end
	arg1.descendantRemovingConn = arg2.DescendantRemoving:connect(function(arg1_5) -- Line 146
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1.cachedParts[arg1_5] then
			arg1.cachedParts[arg1_5] = nil
			arg1_5.LocalTransparencyModifier = 0
		end
	end)
	arg1:CachePartsRecursive(arg2)
end
function module_upvr.Enable(arg1, arg2) -- Line 157
	if arg1.enabled ~= arg2 then
		arg1.enabled = arg2
	end
end
function module_upvr.SetSubject(arg1, arg2) -- Line 163
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if arg2 and arg2:IsA("Humanoid") then
		local var35
	end
	if arg2 and arg2:IsA("VehicleSeat") and arg2.Occupant then
		var35 = arg2.Occupant.Parent
		local var36 = var35
	end
	if var36 then
		arg1:SetupTransparency(var36)
	else
		arg1:TeardownTransparency()
	end
end
local module_upvr_2 = require(script.Parent:WaitForChild("CameraUtils"))
local VRService_upvr = game:GetService("VRService")
function module_upvr.Update(arg1, arg2) -- Line 178
	--[[ Upvalues[2]:
		[1]: module_upvr_2 (readonly)
		[2]: VRService_upvr (readonly)
	]]
	local CurrentCamera_2 = workspace.CurrentCamera
	if CurrentCamera_2 then
		local var56
		if arg1.enabled then
			var56 = CurrentCamera_2.Focus.p - CurrentCamera_2.CoordinateFrame.p
			local magnitude_2 = var56.magnitude
			local function INLINED_2() -- Internal function, doesn't exist in bytecode
				var56 = 1 - (magnitude_2 - 0.5) / 1.5
				return var56
			end
			if magnitude_2 >= 2 or not INLINED_2() then
				var56 = 0
			end
			if var56 < 0.5 then
				var56 = 0
			end
			if arg1.lastTransparency and var56 < 1 and arg1.lastTransparency < 0.95 then
				local var58 = 2.8 * arg2
				var56 = arg1.lastTransparency + math.clamp(var56 - arg1.lastTransparency, -var58, var58)
			else
				arg1.transparencyDirty = true
			end
			var56 = math.clamp(module_upvr_2.Round(var56, 2), 0, 1)
			if arg1.transparencyDirty or arg1.lastTransparency ~= var56 then
				for i_6, _ in pairs(arg1.cachedParts) do
					if VRService_upvr.VREnabled and VRService_upvr.AvatarGestures then
						if i_6.Parent:IsA("Accessory") and ({
							[Enum.AccessoryType.Hat] = true;
							[Enum.AccessoryType.Hair] = true;
							[Enum.AccessoryType.Face] = true;
							[Enum.AccessoryType.Eyebrow] = true;
							[Enum.AccessoryType.Eyelash] = true;
						})[i_6.Parent.AccessoryType] or i_6.Name == "Head" then
							i_6.LocalTransparencyModifier = var56
						else
							i_6.LocalTransparencyModifier = 0
						end
					else
						i_6.LocalTransparencyModifier = var56
					end
				end
				arg1.transparencyDirty = false
				arg1.lastTransparency = var56
			end
		end
	end
end
return module_upvr