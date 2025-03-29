--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide.cleanup
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:49:03
-- Luau version 6, Types version 3
-- Time taken: 0.001545 seconds

local var1_upvr
if not var1_upvr then
	var1_upvr = require("test/relative-string")
	script = var1_upvr -- Setting global
end
local function INLINED() -- Internal function, doesn't exist in bytecode
	var1_upvr = typeof
	return var1_upvr
end
if not game or not INLINED() then
	var1_upvr = require("test/mock").typeof
end
local throw_upvr = require(script.Parent.throw)
local graph = require(script.Parent.graph)
local function helper_upvr(arg1) -- Line 9, Named "helper"
	--[[ Upvalues[2]:
		[1]: var1_upvr (readonly)
		[2]: throw_upvr (readonly)
	]]
	if var1_upvr(arg1) == "RBXScriptConnection" then
		return function() -- Line 11
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:Disconnect()
		end
	end
	if var1_upvr(arg1) == "Instance" then
		return function() -- Line 12
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:Destroy()
		end
	end
	if arg1.destroy then
		return function() -- Line 13
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:destroy()
		end
	end
	if arg1.disconnect then
		return function() -- Line 14
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:disconnect()
		end
	end
	if arg1.Destroy then
		return function() -- Line 15
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:Destroy()
		end
	end
	if arg1.Disconnect then
		return function() -- Line 16
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:Disconnect()
		end
	end
	return throw_upvr("cannot cleanup given object")
end
local get_scope_upvr = graph.get_scope
local push_cleanup_upvr = graph.push_cleanup
return function(arg1) -- Line 20, Named "cleanup"
	--[[ Upvalues[4]:
		[1]: get_scope_upvr (readonly)
		[2]: throw_upvr (readonly)
		[3]: push_cleanup_upvr (readonly)
		[4]: helper_upvr (readonly)
	]]
	local get_scope_upvr_result1 = get_scope_upvr()
	if not get_scope_upvr_result1 then
		throw_upvr("cannot cleanup outside a stable or reactive scope")
	end
	assert(get_scope_upvr_result1)
	if type(arg1) == "function" then
		push_cleanup_upvr(get_scope_upvr_result1, arg1)
	else
		push_cleanup_upvr(get_scope_upvr_result1, helper_upvr(arg1))
	end
end