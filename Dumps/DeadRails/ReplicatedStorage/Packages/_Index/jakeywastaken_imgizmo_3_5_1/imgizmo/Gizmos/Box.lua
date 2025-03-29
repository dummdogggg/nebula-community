--[[
    Script: ReplicatedStorage.Packages._Index.jakeywastaken_imgizmo@3.5.1.imgizmo.Gizmos.Box
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:43:59
-- Luau version 6, Types version 3
-- Time taken: 0.002211 seconds

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
		local function CalculateYFace(arg1_2, arg2_2, arg3_2) -- Line 39
			--[[ Upvalues[3]:
				[1]: Position_upvr (readonly)
				[2]: Ceive_2_upvr (readonly)
				[3]: arg4 (readonly)
			]]
			local var9 = (Position_upvr) + (arg1_2 - arg2_2 + arg3_2)
			local var10 = (Position_upvr) + (arg1_2 + arg2_2 + arg3_2)
			local var11 = (Position_upvr) + (arg1_2 - arg2_2 - arg3_2)
			local var12 = (Position_upvr) + (arg1_2 + arg2_2 - arg3_2)
			Ceive_2_upvr.Ray:Draw(var9, var10)
			Ceive_2_upvr.Ray:Draw(var9, var11)
			Ceive_2_upvr.Ray:Draw(var10, var12)
			if arg4 ~= false then
				Ceive_2_upvr.Ray:Draw(var10, var11)
			end
			Ceive_2_upvr.Ray:Draw(var11, var12)
		end
		local function CalculateZFace(arg1_3, arg2_3, arg3_3) -- Line 56
			--[[ Upvalues[3]:
				[1]: Position_upvr (readonly)
				[2]: Ceive_2_upvr (readonly)
				[3]: arg4 (readonly)
			]]
			local var13 = (Position_upvr) + (arg1_3 - arg2_3 + arg3_3)
			local var14 = (Position_upvr) + (arg1_3 + arg2_3 + arg3_3)
			local var15 = (Position_upvr) + (-arg1_3 - arg2_3 + arg3_3)
			local var16 = (Position_upvr) + (-arg1_3 + arg2_3 + arg3_3)
			Ceive_2_upvr.Ray:Draw(var13, var14)
			Ceive_2_upvr.Ray:Draw(var13, var15)
			Ceive_2_upvr.Ray:Draw(var14, var16)
			if arg4 ~= false then
				Ceive_2_upvr.Ray:Draw(var14, var15)
			end
			Ceive_2_upvr.Ray:Draw(var15, var16)
		end
		local function CalculateXFace(arg1_4, arg2_4, arg3_4) -- Line 73
			--[[ Upvalues[3]:
				[1]: Position_upvr (readonly)
				[2]: Ceive_2_upvr (readonly)
				[3]: arg4 (readonly)
			]]
			local var17 = (Position_upvr) + (arg1_4 - arg2_4 - arg3_4)
			local var18 = (Position_upvr) + (arg1_4 - arg2_4 + arg3_4)
			local var19 = (Position_upvr) + (-arg1_4 - arg2_4 - arg3_4)
			local var20 = (Position_upvr) + (-arg1_4 - arg2_4 + arg3_4)
			Ceive_2_upvr.Ray:Draw(var17, var18)
			Ceive_2_upvr.Ray:Draw(var17, var19)
			Ceive_2_upvr.Ray:Draw(var18, var20)
			if arg4 ~= false then
				Ceive_2_upvr.Ray:Draw(var18, var19)
			end
			Ceive_2_upvr.Ray:Draw(var19, var20)
		end
		CalculateXFace(var6, var7, var8)
		CalculateXFace(var6, -var7, var8)
		CalculateYFace(var6, var7, var8)
		CalculateYFace(-var6, var7, var8)
		CalculateZFace(var6, var7, var8)
		CalculateZFace(var6, var7, -var8)
	end
end
function module_2_upvr.Create(arg1, arg2, arg3, arg4) -- Line 106
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
function module_2_upvr.Update(arg1, arg2) -- Line 123
	local Ceive = arg1.Ceive
	Ceive.PushProperty("AlwaysOnTop", arg2.AlwaysOnTop)
	Ceive.PushProperty("Transparency", arg2.Transparency)
	Ceive.PushProperty("Color3", arg2.Color3)
	arg1:Draw(arg2.Transform, arg2.Size, arg2.DrawTriangles)
end
return module_2_upvr