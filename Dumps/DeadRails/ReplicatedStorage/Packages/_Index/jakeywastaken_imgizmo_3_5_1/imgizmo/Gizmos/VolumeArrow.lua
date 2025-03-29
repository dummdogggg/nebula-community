--[[
    Script: ReplicatedStorage.Packages._Index.jakeywastaken_imgizmo@3.5.1.imgizmo.Gizmos.VolumeArrow
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:17
-- Luau version 6, Types version 3
-- Time taken: 0.001366 seconds

local module_upvr = {}
module_upvr.__index = module_upvr
function module_upvr.Init(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 6
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, module_upvr)
	setmetatable_result1.Ceive = arg1
	setmetatable_result1.Propertys = arg2
	setmetatable_result1.Request = arg3
	setmetatable_result1.Release = arg4
	setmetatable_result1.Retain = arg5
	setmetatable_result1.Register = arg6
	return setmetatable_result1
end
function module_upvr.Draw(arg1, arg2, arg3, arg4, arg5, arg6, arg7) -- Line 27
	local Ceive_2 = arg1.Ceive
	if not Ceive_2.Enabled then
	else
		if arg7 == true then
			local Position = CFrame.lookAt(arg3 - ((arg3 - arg2).Unit) * (arg6 / 2), arg3).Position
			Ceive_2.VolumeCylinder:Draw(CFrame.lookAt((arg2 + Position) / 2, arg3), arg4, (Position - arg2).Magnitude)
		else
			Ceive_2.Ray:Draw(arg2, arg3)
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		Ceive_2.VolumeCone:Draw(CFrame.lookAt(arg3 - ((arg3 - arg2).Unit) * (arg6 / 2), arg3), arg5, arg6)
		arg1.Ceive.ScheduleCleaning()
	end
end
function module_upvr.Create(arg1, arg2, arg3, arg4, arg5, arg6, arg7) -- Line 59
	local module = {}
	module.Origin = arg2
	module.End = arg3
	module.CylinderRadius = arg4
	module.ConeRadius = arg5
	module.Length = arg6
	module.UseCylinder = arg7
	module.AlwaysOnTop = arg1.Propertys.AlwaysOnTop
	module.Transparency = arg1.Propertys.Transparency
	module.Color3 = arg1.Propertys.Color3
	module.Enabled = true
	module.Destroy = false
	arg1.Retain(arg1, module)
	return module
end
function module_upvr.Update(arg1, arg2) -- Line 79
	local Ceive = arg1.Ceive
	Ceive.PushProperty("AlwaysOnTop", arg2.AlwaysOnTop)
	Ceive.PushProperty("Transparency", arg2.Transparency)
	Ceive.PushProperty("Color3", arg2.Color3)
	arg1:Draw(arg2.Origin, arg2.End, arg2.Radius, arg2.Length, arg2.UseCylinder)
end
return module_upvr