--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.RxAttributeUtils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:15
-- Luau version 6, Types version 3
-- Time taken: 0.001147 seconds

local any_load_result1 = require(script.Parent.loader).load(script)
local module = {}
local var1_result1_upvr_2 = any_load_result1("Observable")
local var1_result1_upvr = any_load_result1("Maid")
function module.observeAttribute(arg1, arg2, arg3) -- Line 20
	--[[ Upvalues[2]:
		[1]: var1_result1_upvr_2 (readonly)
		[2]: var1_result1_upvr (readonly)
	]]
	local var6
	if typeof(arg1) ~= "Instance" then
		var6 = false
	else
		var6 = true
	end
	assert(var6, "Bad instance")
	if type(arg2) ~= "string" then
		var6 = false
	else
		var6 = true
	end
	assert(var6, "Bad attributeName")
	var6 = var1_result1_upvr_2
	function var6(arg1_2) -- Line 24
		--[[ Upvalues[4]:
			[1]: var1_result1_upvr (copied, readonly)
			[2]: arg1 (readonly)
			[3]: arg2 (readonly)
			[4]: arg3 (readonly)
		]]
		local any_new_result1 = var1_result1_upvr.new()
		any_new_result1:GiveTask(arg1:GetAttributeChangedSignal(arg2):Connect(function() -- Line 27, Named "update"
			--[[ Upvalues[4]:
				[1]: arg1 (copied, readonly)
				[2]: arg2 (copied, readonly)
				[3]: arg1_2 (readonly)
				[4]: arg3 (copied, readonly)
			]]
			local attribute = arg1:GetAttribute(arg2)
			if attribute == nil then
				arg1_2:Fire(arg3)
			else
				arg1_2:Fire(attribute)
			end
		end))
		local attribute_2 = arg1:GetAttribute(arg2)
		if attribute_2 == nil then
			arg1_2:Fire(arg3)
			return any_new_result1
		end
		arg1_2:Fire(attribute_2)
		return any_new_result1
	end
	return var6.new(var6)
end
return module