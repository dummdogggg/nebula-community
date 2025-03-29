--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide.switch
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:49:20
-- Luau version 6, Types version 3
-- Time taken: 0.001403 seconds

if not game then
	script = require("test/relative-string") -- Setting global
end
local graph = require(script.Parent.graph)
local assert_stable_scope_upvr = graph.assert_stable_scope
local destroy_upvr = graph.destroy
local throw_upvr = require(script.Parent.throw)
local create_node_upvr = graph.create_node
local push_scope_upvr = graph.push_scope
local pop_scope_upvr = graph.pop_scope
local evaluate_node_upvr = graph.evaluate_node
local push_child_to_scope_upvr = graph.push_child_to_scope
return function(arg1) -- Line 17, Named "switch"
	--[[ Upvalues[8]:
		[1]: assert_stable_scope_upvr (readonly)
		[2]: destroy_upvr (readonly)
		[3]: throw_upvr (readonly)
		[4]: create_node_upvr (readonly)
		[5]: push_scope_upvr (readonly)
		[6]: pop_scope_upvr (readonly)
		[7]: evaluate_node_upvr (readonly)
		[8]: push_child_to_scope_upvr (readonly)
	]]
	local assert_stable_scope_upvr_result1_upvr = assert_stable_scope_upvr()
	return function(arg1_2) -- Line 20
		--[[ Upvalues[9]:
			[1]: arg1 (readonly)
			[2]: destroy_upvr (copied, readonly)
			[3]: throw_upvr (copied, readonly)
			[4]: create_node_upvr (copied, readonly)
			[5]: assert_stable_scope_upvr_result1_upvr (readonly)
			[6]: push_scope_upvr (copied, readonly)
			[7]: pop_scope_upvr (copied, readonly)
			[8]: evaluate_node_upvr (copied, readonly)
			[9]: push_child_to_scope_upvr (copied, readonly)
		]]
		local var12_upvw
		local var13_upvw
		local create_node_upvr_result1_upvr = create_node_upvr(assert_stable_scope_upvr_result1_upvr, function(arg1_3) -- Line 24, Named "update"
			--[[ Upvalues[10]:
				[1]: arg1_2 (readonly)
				[2]: arg1 (copied, readonly)
				[3]: var12_upvw (read and write)
				[4]: var13_upvw (read and write)
				[5]: destroy_upvr (copied, readonly)
				[6]: throw_upvr (copied, readonly)
				[7]: create_node_upvr (copied, readonly)
				[8]: assert_stable_scope_upvr_result1_upvr (copied, readonly)
				[9]: push_scope_upvr (copied, readonly)
				[10]: pop_scope_upvr (copied, readonly)
			]]
			local var14 = arg1_2[arg1()]
			if var14 == var12_upvw then
				return arg1_3
			end
			var12_upvw = var14
			if var13_upvw then
				destroy_upvr(var13_upvw)
				var13_upvw = nil
			end
			if var14 == nil then
				return nil
			end
			if type(var14) ~= "function" then
				throw_upvr("map must map a value to a function")
			end
			local create_node_upvr_result1 = create_node_upvr(assert_stable_scope_upvr_result1_upvr, false, false)
			var13_upvw = create_node_upvr_result1
			push_scope_upvr(create_node_upvr_result1)
			local pcall_result1, pcall_result2 = pcall(var14)
			pop_scope_upvr()
			if not pcall_result1 then
				error(pcall_result2, 0)
			end
			return pcall_result2
		end, nil)
		evaluate_node_upvr(create_node_upvr_result1_upvr)
		return function() -- Line 58
			--[[ Upvalues[2]:
				[1]: push_child_to_scope_upvr (copied, readonly)
				[2]: create_node_upvr_result1_upvr (readonly)
			]]
			push_child_to_scope_upvr(create_node_upvr_result1_upvr)
			return create_node_upvr_result1_upvr.cache
		end
	end
end