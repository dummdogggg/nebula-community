--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.AttributeValue
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:49
-- Luau version 6, Types version 3
-- Time taken: 0.002167 seconds

local module_upvr = {
	ClassName = "AttributeValue";
}
module_upvr.__index = module_upvr
function module_upvr.new(arg1, arg2, arg3) -- Line 37
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var4
	if typeof(arg1) ~= "Instance" then
		var4 = false
	else
		var4 = true
	end
	assert(var4, "Bad object")
	if type(arg2) ~= "string" then
		var4 = false
	else
		var4 = true
	end
	assert(var4, "Bad attributeName")
	local tbl_2 = {}
	tbl_2._object = arg1
	tbl_2._attributeName = arg2
	tbl_2._defaultValue = arg3
	if arg3 ~= nil then
		var4 = tbl_2._object:GetAttribute(tbl_2._attributeName)
		if var4 == nil then
			var4 = tbl_2._object:SetAttribute
			var4(rawget(tbl_2, "_attributeName"), arg3)
		end
	end
	var4 = setmetatable(tbl_2, module_upvr)
	return var4
end
local var6_upvr = require(script.Parent.loader).load(script)("RxAttributeUtils")
function module_upvr.Observe(arg1) -- Line 58
	--[[ Upvalues[1]:
		[1]: var6_upvr (readonly)
	]]
	return var6_upvr.observeAttribute(arg1._object, arg1._attributeName, rawget(arg1, "_defaultValue"))
end
function module_upvr.__index(arg1, arg2) -- Line 75
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if arg2 == "Value" then
		local attribute = arg1._object:GetAttribute(rawget(arg1, "_attributeName"))
		if attribute == nil then
			return rawget(arg1, "_defaultValue")
		end
		return attribute
	end
	if arg2 == "Changed" then
		return arg1._object:GetAttributeChangedSignal(arg1._attributeName)
	end
	if module_upvr[arg2] then
		return module_upvr[arg2]
	end
	error("%q is not a member of AttributeValue":format(tostring(arg2)))
end
function module_upvr.__newindex(arg1, arg2, arg3) -- Line 93
	if arg2 == "Value" then
		arg1._object:SetAttribute(rawget(arg1, "_attributeName"), arg3)
	else
		error("%q is not a member of AttributeValue":format(tostring(arg2)))
	end
end
return module_upvr