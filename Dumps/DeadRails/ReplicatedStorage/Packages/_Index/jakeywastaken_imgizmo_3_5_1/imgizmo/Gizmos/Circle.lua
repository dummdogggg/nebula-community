--[[
    Script: ReplicatedStorage.Packages._Index.jakeywastaken_imgizmo@3.5.1.imgizmo.Gizmos.Circle
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:06
-- Luau version 6, Types version 3
-- Time taken: 0.002290 seconds

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
function module_upvr.Draw(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 25
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local Ceive_2 = arg1.Ceive
	local var8
	if not Ceive_2.Enabled then return end
	local var9
	var8 = 0
	for i = 0, arg5, math.floor(arg5 / arg4) do
		local var10 = (arg2.Position) + ((arg2.UpVector) * (math.cos(math.rad(i)) * arg3) + (arg2.RightVector) * (math.sin(math.rad(i)) * arg3))
		if var9 == nil then
			var8 = i
		else
			Ceive_2.Ray:Draw(var10, var10)
			var8 = i
		end
	end
	if var8 ~= arg5 then
		i = math.rad(arg5)
		i = math.cos(math.rad(arg5))
		i = (arg2.Position) + ((arg2.UpVector) * (i * arg3) + (arg2.RightVector) * (math.sin(i) * arg3))
		Ceive_2.Ray:Draw(var10, i)
	end
	if arg6 ~= false then
		i = var10
		Ceive_2.Ray:Draw(i, var10)
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return var10
end
function module_upvr.Create(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 81
	local module = {}
	module.Transform = arg2
	module.Radius = arg3
	module.Subdivisions = arg4
	module.Angle = arg5
	module.ConnectToStart = arg6
	module.AlwaysOnTop = arg1.Propertys.AlwaysOnTop
	module.Transparency = arg1.Propertys.Transparency
	module.Color3 = arg1.Propertys.Color3
	module.Enabled = true
	module.Destroy = false
	arg1.Retain(arg1, module)
	return module
end
function module_upvr.Update(arg1, arg2) -- Line 100
	local Ceive = arg1.Ceive
	Ceive.PushProperty("AlwaysOnTop", arg2.AlwaysOnTop)
	Ceive.PushProperty("Transparency", arg2.Transparency)
	Ceive.PushProperty("Color3", arg2.Color3)
	arg1:Draw(arg2.Transform, arg2.Radius, arg2.Subdivisions, arg2.Angle, arg2.ConnectToStart)
end
return module_upvr