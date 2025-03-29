--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.loader.Utils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:06
-- Luau version 6, Types version 3
-- Time taken: 0.003197 seconds

local module = {}
local function errorOnIndex(arg1, arg2) -- Line 8
	error("Bad index %q":format(tostring(arg2)), 2)
end
local module_2_upvr = {
	__index = errorOnIndex;
	__newindex = errorOnIndex;
}
function module.readonly(arg1) -- Line 17
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	return setmetatable(arg1, module_2_upvr)
end
function module.copyTable(arg1) -- Line 21
	local module_3 = {}
	for i, v in pairs(arg1) do
		module_3[i] = v
	end
	return module_3
end
function module.count(arg1) -- Line 29
	local var15 = 0
	for _, _ in pairs(arg1) do
		var15 += 1
	end
	return var15
end
function module.getOrCreateValue(arg1, arg2, arg3, arg4) -- Line 37
	-- KONSTANTERROR: [0] 1. Error Block 28 start (CF ANALYSIS FAILED)
	local var19
	if typeof(arg1) ~= "Instance" then
		var19 = false
	else
		var19 = true
	end
	assert(var19, "Bad argument 'parent'")
	if type(arg2) ~= "string" then
		var19 = false
		-- KONSTANTWARNING: GOTO [24] #19
	end
	-- KONSTANTERROR: [0] 1. Error Block 28 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 18. Error Block 30 start (CF ANALYSIS FAILED)
	var19 = true
	assert(var19, "Bad argument 'instanceType'")
	if type(arg3) ~= "string" then
		var19 = false
	else
		var19 = true
	end
	assert(var19, "Bad argument 'name'")
	local SOME_3 = arg1:FindFirstChild(arg3)
	if SOME_3 then
		var19 = SOME_3:IsA(arg2)
		if not var19 then
			var19 = warn
			var19("[Utils.getOrCreateValue] - Value of type %q of name %q is of type %q in %s instead":format(arg2, arg3, SOME_3.ClassName, SOME_3:GetFullName()))
		end
		return SOME_3
	end
	var19 = Instance.new(arg2)
	var19.Name = arg3
	var19.Value = arg4
	var19.Parent = arg1
	do
		return var19
	end
	-- KONSTANTERROR: [23] 18. Error Block 30 end (CF ANALYSIS FAILED)
end
function module.getValue(arg1, arg2, arg3, arg4) -- Line 60
	-- KONSTANTERROR: [0] 1. Error Block 28 start (CF ANALYSIS FAILED)
	local var21
	if typeof(arg1) ~= "Instance" then
		var21 = false
	else
		var21 = true
	end
	assert(var21, "Bad argument 'parent'")
	if type(arg2) ~= "string" then
		var21 = false
		-- KONSTANTWARNING: GOTO [24] #19
	end
	-- KONSTANTERROR: [0] 1. Error Block 28 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 18. Error Block 30 start (CF ANALYSIS FAILED)
	var21 = true
	assert(var21, "Bad argument 'instanceType'")
	if type(arg3) ~= "string" then
		var21 = false
	else
		var21 = true
	end
	assert(var21, "Bad argument 'name'")
	local SOME = arg1:FindFirstChild(arg3)
	if SOME then
		var21 = SOME:IsA(arg2)
		if var21 then
			var21 = SOME.Value
			return var21
		end
		var21 = warn
		var21("[Utils.getValue] - Value of type %q of name %q is of type %q in %s instead":format(arg2, arg3, SOME.ClassName, SOME:GetFullName()))
		var21 = nil
		return var21
	end
	do
		return arg4
	end
	-- KONSTANTERROR: [23] 18. Error Block 30 end (CF ANALYSIS FAILED)
end
function module.setValue(arg1, arg2, arg3, arg4) -- Line 79
	-- KONSTANTERROR: [0] 1. Error Block 28 start (CF ANALYSIS FAILED)
	local var23
	if typeof(arg1) ~= "Instance" then
		var23 = false
	else
		var23 = true
	end
	assert(var23, "Bad argument 'parent'")
	if type(arg2) ~= "string" then
		var23 = false
		-- KONSTANTWARNING: GOTO [24] #19
	end
	-- KONSTANTERROR: [0] 1. Error Block 28 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 18. Error Block 30 start (CF ANALYSIS FAILED)
	var23 = true
	assert(var23, "Bad argument 'instanceType'")
	if type(arg3) ~= "string" then
		var23 = false
	else
		var23 = true
	end
	assert(var23, "Bad argument 'name'")
	local SOME_2 = arg1:FindFirstChild(arg3)
	if SOME_2 then
		var23 = SOME_2:IsA(arg2)
		if not var23 then
			var23 = warn
			var23("[Utils.setValue] - Value of type %q of name %q is of type %q in %s instead":format(arg2, arg3, SOME_2.ClassName, SOME_2:GetFullName()))
		end
		SOME_2.Value = arg4
	else
		var23 = Instance.new(arg2)
		var23.Name = arg3
		var23.Value = arg4
		var23.Parent = arg1
		-- KONSTANTERROR: [23] 18. Error Block 30 end (CF ANALYSIS FAILED)
	end
end
function module.getOrCreateFolder(arg1, arg2) -- Line 101
	local SOME_4 = arg1:FindFirstChild(arg2)
	if SOME_4 then
		return SOME_4
	end
	local Folder = Instance.new("Folder")
	Folder.Name = arg2
	Folder.Parent = arg1
	return Folder
end
return module