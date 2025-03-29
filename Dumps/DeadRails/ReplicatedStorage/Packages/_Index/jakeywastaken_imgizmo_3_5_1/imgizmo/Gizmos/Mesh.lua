--[[
    Script: ReplicatedStorage.Packages._Index.jakeywastaken_imgizmo@3.5.1.imgizmo.Gizmos.Mesh
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:12
-- Luau version 6, Types version 3
-- Time taken: 0.003245 seconds

local function _(arg1, arg2, arg3, arg4, arg5) -- Line 1, Named "Map"
	return (arg1 - arg2) / (arg3 - arg2) * (arg5 - arg4) + arg4
end
local module_2_upvr = {}
module_2_upvr.__index = module_2_upvr
function module_2_upvr.Init(arg1, arg2, arg3, arg4, arg5) -- Line 10
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
function module_2_upvr.Draw(arg1, arg2, arg3, arg4, arg5) -- Line 28
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local Ceive_2 = arg1.Ceive
	local var28
	if not Ceive_2.Enabled then
	else
		var28 = math.huge
		for _, v in arg4 do
			var28 = math.min(var28, v.x)
			local var29
		end
		for i_2, v_2 in arg4 do
			local var30 = var28
			local minimum = math.min(math.huge, v.y)
			local minimum_2 = math.min(math.huge, v.z)
			arg4[i_2] = arg2 * CFrame.new(Vector3.new((v_2.x - var30) / (var29 - var30) * 1 + -0.5, (v_2.y - minimum) / (math.max((-math.huge), v.y) - minimum) * 1 + -0.5, (v_2.z - minimum_2) / (math.max((-math.huge), v.z) - minimum_2) * 1 + -0.5) * arg3)
			local _
		end
		for _, v_3 in arg5 do
			if #v_3 == 3 then
				local var34 = arg4[v_3[1].v]
				local var35 = arg4[v_3[2].v]
				local var36 = arg4[v_3[3].v]
				Ceive_2.Ray:Draw(var34.Position, var35.Position)
				Ceive_2.Ray:Draw(var35.Position, var36.Position)
				Ceive_2.Ray:Draw(var36.Position, var34.Position)
			else
				local var37 = arg4[v_3[1].v]
				local var38 = arg4[v_3[2].v]
				local var39 = arg4[v_3[3].v]
				local var40 = arg4[v_3[4].v]
				Ceive_2.Ray:Draw(var37.Position, var38.Position)
				Ceive_2.Ray:Draw(var37.Position, var40.Position)
				Ceive_2.Ray:Draw(var40.Position, var38.Position)
				Ceive_2.Ray:Draw(var39.Position, var40.Position)
				Ceive_2.Ray:Draw(var38.Position, var39.Position)
			end
		end
	end
end
function module_2_upvr.Create(arg1, arg2, arg3, arg4, arg5) -- Line 94
	local module = {}
	module.Transform = arg2
	module.Size = arg3
	module.Vertices = arg4
	module.Faces = arg5
	module.AlwaysOnTop = arg1.Propertys.AlwaysOnTop
	module.Transparency = arg1.Propertys.Transparency
	module.Color3 = arg1.Propertys.Color3
	module.Enabled = true
	module.Destroy = false
	arg1.Retain(arg1, module)
	return module
end
function module_2_upvr.Update(arg1, arg2) -- Line 112
	local Ceive = arg1.Ceive
	Ceive.PushProperty("AlwaysOnTop", arg2.AlwaysOnTop)
	Ceive.PushProperty("Transparency", arg2.Transparency)
	Ceive.PushProperty("Color3", arg2.Color3)
	arg1:Draw(arg2.Transform, arg2.Size, arg2.Vertices, arg2.Faces)
end
return module_2_upvr