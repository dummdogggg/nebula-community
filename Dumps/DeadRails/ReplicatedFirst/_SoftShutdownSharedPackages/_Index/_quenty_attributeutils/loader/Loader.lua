--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.loader.Loader
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:26
-- Luau version 6, Types version 3
-- Time taken: 0.001171 seconds

local module_2_upvr = {
	ClassName = "Loader";
}
module_2_upvr.__index = module_2_upvr
function module_2_upvr.new(arg1) -- Line 12
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	local module = {}
	module._script = arg1
	return setmetatable(module, module_2_upvr)
end
local function waitForValue_upvr(arg1) -- Line 18, Named "waitForValue"
	local Value = arg1.Value
	if Value then
		return Value
	end
	return arg1.Changed:Wait()
end
function module_2_upvr.__call(arg1, arg2) -- Line 27
	--[[ Upvalues[1]:
		[1]: waitForValue_upvr (readonly)
	]]
	if type(arg2) == "string" then
		local var4 = arg1._script.Parent[arg2]
		if var4:IsA("ObjectValue") then
			return require(waitForValue_upvr(var4))
		end
		return require(var4)
	end
	return require(arg2)
end
function module_2_upvr.__index(arg1, arg2) -- Line 40
	--[[ Upvalues[1]:
		[1]: waitForValue_upvr (readonly)
	]]
	if type(arg2) == "string" then
		local var5 = arg1._script.Parent[arg2]
		if var5:IsA("ObjectValue") then
			return require(waitForValue_upvr(var5))
		end
		return require(var5)
	end
	return require(arg2)
end
return module_2_upvr