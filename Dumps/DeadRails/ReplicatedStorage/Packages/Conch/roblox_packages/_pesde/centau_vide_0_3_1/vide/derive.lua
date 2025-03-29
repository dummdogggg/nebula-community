--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide.derive
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:09
-- Luau version 6, Types version 3
-- Time taken: 0.000741 seconds

if not game then
	script = require("test/relative-string") -- Setting global
end
local graph = require(script.Parent.graph)
local create_node_upvr = graph.create_node
local assert_stable_scope_upvr = graph.assert_stable_scope
local evaluate_node_upvr = graph.evaluate_node
local push_child_to_scope_upvr = graph.push_child_to_scope
return function(arg1) -- Line 9, Named "derive"
	--[[ Upvalues[4]:
		[1]: create_node_upvr (readonly)
		[2]: assert_stable_scope_upvr (readonly)
		[3]: evaluate_node_upvr (readonly)
		[4]: push_child_to_scope_upvr (readonly)
	]]
	local var2_result1_upvr = create_node_upvr(assert_stable_scope_upvr(), arg1, false)
	evaluate_node_upvr(var2_result1_upvr)
	return function() -- Line 14
		--[[ Upvalues[2]:
			[1]: push_child_to_scope_upvr (copied, readonly)
			[2]: var2_result1_upvr (readonly)
		]]
		push_child_to_scope_upvr(var2_result1_upvr)
		return var2_result1_upvr.cache
	end
end