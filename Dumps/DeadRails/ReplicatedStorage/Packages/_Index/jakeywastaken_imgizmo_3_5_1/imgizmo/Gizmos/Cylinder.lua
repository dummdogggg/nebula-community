--[[
    Script: ReplicatedStorage.Packages._Index.jakeywastaken_imgizmo@3.5.1.imgizmo.Gizmos.Cylinder
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:08
-- Luau version 6, Types version 3
-- Time taken: 0.002657 seconds

local module_upvr = {}
module_upvr.__index = module_upvr
function module_upvr.Init(arg1, arg2, arg3, arg4, arg5) -- Line 6
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, module_upvr)
	setmetatable_result1.Ceive = arg1
	setmetatable_result1.Propertys = arg2
	setmetatable_result1.Request = arg3
	setmetatable_result1.Release = arg4
	setmetatable_result1.Retain = arg5
	return setmetatable_result1
end
function module_upvr.Draw(arg1, arg2, arg3, arg4, arg5) -- Line 24
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local Ceive_2 = arg1.Ceive
	local var8
	if not Ceive_2.Enabled then
	else
		var8 = arg2.UpVector
		var8 = (arg2.UpVector) * (arg4 / 2)
		var8 = arg2.Position + (var8) * (arg4 / 2)
		var8 = arg2.Position - var8
		var8 = 360 / arg5
		var8 = nil
		for i = 0, 360, math.floor(var8) do
			local var11 = (arg2.LookVector) * (math.cos(math.rad(i)) * arg3) + (arg2.RightVector) * (math.sin(math.rad(i)) * arg3)
			local var12 = CFrame.lookAt(var8, arg2.Position + (var8) * (arg4 / 2) + arg2.UpVector).Position + var11
			local var13 = CFrame.lookAt(var8, arg2.Position - var8 - arg2.UpVector).Position + var11
			Ceive_2.Ray:Draw(var12, var13)
			if not var8 then
				var8 = var12
			else
				Ceive_2.Ray:Draw(var8, var12)
				Ceive_2.Ray:Draw(var13, var13)
				var8 = var12
			end
		end
		Ceive_2.Ray:Draw(var8, var12)
		Ceive_2.Ray:Draw(var13, var13)
	end
end
function module_upvr.Create(arg1, arg2, arg3, arg4, arg5) -- Line 86
	local module = {}
	module.Transform = arg2
	module.Radius = arg3
	module.Length = arg4
	module.Subdivisions = arg5
	module.AlwaysOnTop = arg1.Propertys.AlwaysOnTop
	module.Transparency = arg1.Propertys.Transparency
	module.Color3 = arg1.Propertys.Color3
	module.Enabled = true
	module.Destroy = false
	arg1.Retain(arg1, module)
	return module
end
function module_upvr.Update(arg1, arg2) -- Line 104
	local Ceive = arg1.Ceive
	Ceive.PushProperty("AlwaysOnTop", arg2.AlwaysOnTop)
	Ceive.PushProperty("Transparency", arg2.Transparency)
	Ceive.PushProperty("Color3", arg2.Color3)
	arg1:Draw(arg2.Transform, arg2.Radius, arg2.Length, arg2.Subdivisions)
end
return module_upvr