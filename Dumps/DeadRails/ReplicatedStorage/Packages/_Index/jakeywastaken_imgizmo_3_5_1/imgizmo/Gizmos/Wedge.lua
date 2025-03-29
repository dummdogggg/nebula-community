--[[
    Script: ReplicatedStorage.Packages._Index.jakeywastaken_imgizmo@3.5.1.imgizmo.Gizmos.Wedge
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:27
-- Luau version 6, Types version 3
-- Time taken: 0.001947 seconds

local module_2_upvr = {}
module_2_upvr.__index = module_2_upvr
function module_2_upvr.Init(arg1, arg2, arg3, arg4, arg5) -- Line 6
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, module_2_upvr)
	setmetatable_result1.Ceive = arg1
	setmetatable_result1.Propertys = arg2
	setmetatable_result1.Request = arg3
	setmetatable_result1.Release = arg4
	setmetatable_result1.Retain = arg5
	return setmetatable_result1
end
function module_2_upvr.Draw(arg1, arg2, arg3, arg4) -- Line 23
	local Ceive_2_upvr = arg1.Ceive
	if not Ceive_2_upvr.Enabled then
	else
		local Position_upvr = arg2.Position
		local var5 = arg3 / 2
		local var6 = arg2.UpVector * var5.Y
		local var7 = arg2.RightVector * var5.X
		local var8 = arg2.LookVector * var5.Z
		local var9_upvw
		local var10_upvw
		local var11_upvw
		local var12_upvw
		;(function(arg1_2, arg2_2, arg3_2) -- Line 45, Named "CalculateYFace"
			--[[ Upvalues[5]:
				[1]: Position_upvr (readonly)
				[2]: var9_upvw (read and write)
				[3]: var10_upvw (read and write)
				[4]: Ceive_2_upvr (readonly)
				[5]: arg4 (readonly)
			]]
			local var13 = (Position_upvr) + (arg1_2 - arg2_2 + arg3_2)
			local var14 = (Position_upvr) + (arg1_2 + arg2_2 + arg3_2)
			local var15 = (Position_upvr) + (arg1_2 - arg2_2 - arg3_2)
			local var16 = (Position_upvr) + (arg1_2 + arg2_2 - arg3_2)
			var9_upvw = var13
			var10_upvw = var14
			Ceive_2_upvr.Ray:Draw(var13, var14)
			Ceive_2_upvr.Ray:Draw(var13, var15)
			Ceive_2_upvr.Ray:Draw(var14, var16)
			if arg4 ~= false then
				Ceive_2_upvr.Ray:Draw(var14, var15)
			end
			Ceive_2_upvr.Ray:Draw(var15, var16)
		end)(-var6, var7, var8)
		;(function(arg1_3, arg2_3, arg3_3) -- Line 65, Named "CalculateZFace"
			--[[ Upvalues[5]:
				[1]: Position_upvr (readonly)
				[2]: var11_upvw (read and write)
				[3]: var12_upvw (read and write)
				[4]: Ceive_2_upvr (readonly)
				[5]: arg4 (readonly)
			]]
			local var17 = (Position_upvr) + (arg1_3 - arg2_3 + arg3_3)
			local var18 = (Position_upvr) + (arg1_3 + arg2_3 + arg3_3)
			local var19 = (Position_upvr) + (-arg1_3 - arg2_3 + arg3_3)
			local var20 = (Position_upvr) + (-arg1_3 + arg2_3 + arg3_3)
			var11_upvw = var17
			var12_upvw = var18
			Ceive_2_upvr.Ray:Draw(var17, var18)
			Ceive_2_upvr.Ray:Draw(var17, var19)
			Ceive_2_upvr.Ray:Draw(var18, var20)
			if arg4 ~= false then
				Ceive_2_upvr.Ray:Draw(var18, var19)
			end
			Ceive_2_upvr.Ray:Draw(var19, var20)
		end)(var6, var7, -var8)
		Ceive_2_upvr.Ray:Draw(var9_upvw, var11_upvw)
		Ceive_2_upvr.Ray:Draw(var10_upvw, var12_upvw)
		if arg4 ~= false then
			Ceive_2_upvr.Ray:Draw(var10_upvw, var11_upvw)
		end
	end
end
function module_2_upvr.Create(arg1, arg2, arg3, arg4) -- Line 102
	local module = {}
	module.Transform = arg2
	module.Size = arg3
	module.DrawTriangles = arg4
	module.AlwaysOnTop = arg1.Propertys.AlwaysOnTop
	module.Transparency = arg1.Propertys.Transparency
	module.Color3 = arg1.Propertys.Color3
	module.Enabled = true
	module.Destroy = false
	arg1.Retain(arg1, module)
	return module
end
function module_2_upvr.Update(arg1, arg2) -- Line 119
	local Ceive = arg1.Ceive
	Ceive.PushProperty("AlwaysOnTop", arg2.AlwaysOnTop)
	Ceive.PushProperty("Transparency", arg2.Transparency)
	Ceive.PushProperty("Color3", arg2.Color3)
	arg1:Draw(arg2.Transform, arg2.Size, arg2.DrawTriangles)
end
return module_2_upvr