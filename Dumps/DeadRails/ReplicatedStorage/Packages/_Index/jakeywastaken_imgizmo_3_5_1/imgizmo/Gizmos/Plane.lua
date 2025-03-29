--[[
    Script: ReplicatedStorage.Packages._Index.jakeywastaken_imgizmo@3.5.1.imgizmo.Gizmos.Plane
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:13
-- Luau version 6, Types version 3
-- Time taken: 0.001700 seconds

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
function module_upvr.Draw(arg1, arg2, arg3, arg4) -- Line 23
	local Ceive_2_upvr = arg1.Ceive
	if not Ceive_2_upvr.Enabled then
	else
		local cframe_looking_at = CFrame.lookAt(arg2, arg2 + arg3)
		local var5 = arg4 * Vector3.new(1, 1, 0) / 2
		;(function(arg1_2, arg2_2, arg3_2) -- Line 42, Named "CalculateZFace"
			--[[ Upvalues[2]:
				[1]: arg2 (readonly)
				[2]: Ceive_2_upvr (readonly)
			]]
			local var6 = (arg2) + (arg1_2 - arg2_2 + arg3_2)
			local var7 = (arg2) + (arg1_2 + arg2_2 + arg3_2)
			local var8 = (arg2) + (-arg1_2 - arg2_2 + arg3_2)
			local var9 = (arg2) + (-arg1_2 + arg2_2 + arg3_2)
			Ceive_2_upvr.Ray:Draw(var6, var7)
			Ceive_2_upvr.Ray:Draw(var6, var8)
			Ceive_2_upvr.Ray:Draw(var7, var9)
			Ceive_2_upvr.Ray:Draw(var7, var8)
			Ceive_2_upvr.Ray:Draw(var8, var9)
		end)(cframe_looking_at.UpVector * var5.Y, cframe_looking_at.RightVector * var5.X, cframe_looking_at.LookVector * var5.Z)
	end
end
function module_upvr.Create(arg1, arg2, arg3, arg4) -- Line 66
	local module = {}
	module.Position = arg2
	module.Normal = arg3
	module.Size = arg4
	module.AlwaysOnTop = arg1.Propertys.AlwaysOnTop
	module.Transparency = arg1.Propertys.Transparency
	module.Color3 = arg1.Propertys.Color3
	module.Enabled = true
	module.Destroy = false
	arg1.Retain(arg1, module)
	return module
end
function module_upvr.Update(arg1, arg2) -- Line 83
	local Ceive = arg1.Ceive
	Ceive.PushProperty("AlwaysOnTop", arg2.AlwaysOnTop)
	Ceive.PushProperty("Transparency", arg2.Transparency)
	Ceive.PushProperty("Color3", arg2.Color3)
	arg1:Draw(arg2.Position, arg2.Normal, arg2.Size)
end
return module_upvr