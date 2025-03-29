--[[
    Script: ReplicatedStorage.Packages._Index.jakeywastaken_imgizmo@3.5.1.imgizmo.Gizmos.VolumeBox
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:19
-- Luau version 6, Types version 3
-- Time taken: 0.001392 seconds

local module_2_upvr = {}
module_2_upvr.__index = module_2_upvr
function module_2_upvr.Init(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 8
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, module_2_upvr)
	setmetatable_result1.Ceive = arg1
	setmetatable_result1.Propertys = arg2
	setmetatable_result1.Request = arg3
	setmetatable_result1.Release = arg4
	setmetatable_result1.Retain = arg5
	setmetatable_result1.Register = arg6
	return setmetatable_result1
end
local Terrain_upvr = workspace.Terrain
function module_2_upvr.Draw(arg1, arg2, arg3) -- Line 25
	--[[ Upvalues[1]:
		[1]: Terrain_upvr (readonly)
	]]
	local Ceive = arg1.Ceive
	if not Ceive.Enabled then
	else
		local any_Request_result1 = arg1.Request("BoxHandleAdornment")
		any_Request_result1.Color3 = arg1.Propertys.Color3
		any_Request_result1.Transparency = arg1.Propertys.Transparency
		any_Request_result1.CFrame = arg2
		any_Request_result1.Size = arg3
		any_Request_result1.AlwaysOnTop = arg1.Propertys.AlwaysOnTop
		any_Request_result1.ZIndex = 1
		any_Request_result1.Adornee = Terrain_upvr
		any_Request_result1.Parent = Terrain_upvr
		Ceive.ActiveInstances += 1
		arg1.Register(any_Request_result1)
		arg1.Ceive.ScheduleCleaning()
	end
end
function module_2_upvr.Create(arg1, arg2, arg3) -- Line 54
	local module = {}
	module.Transform = arg2
	module.Size = arg3
	module.AlwaysOnTop = arg1.Propertys.AlwaysOnTop
	module.Transparency = arg1.Propertys.Transparency
	module.Color3 = arg1.Propertys.Color3
	module.Enabled = true
	module.Destroy = false
	arg1.Retain(arg1, module)
	return module
end
function module_2_upvr.Update(arg1, arg2) -- Line 70
	local Ceive_2 = arg1.Ceive
	Ceive_2.PushProperty("AlwaysOnTop", arg2.AlwaysOnTop)
	Ceive_2.PushProperty("Transparency", arg2.Transparency)
	Ceive_2.PushProperty("Color3", arg2.Color3)
	arg1:Draw(arg2.Transform, arg2.Size)
end
return module_2_upvr