--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide.effect
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:12
-- Luau version 6, Types version 3
-- Time taken: 0.000484 seconds

if not game then
	script = require("test/relative-string") -- Setting global
end
local graph = require(script.Parent.graph)
local create_node_upvr = graph.create_node
local assert_stable_scope_upvr = graph.assert_stable_scope
local evaluate_node_upvr = graph.evaluate_node
return function(arg1, arg2) -- Line 8, Named "effect"
	--[[ Upvalues[3]:
		[1]: create_node_upvr (readonly)
		[2]: assert_stable_scope_upvr (readonly)
		[3]: evaluate_node_upvr (readonly)
	]]
	evaluate_node_upvr(create_node_upvr(assert_stable_scope_upvr(), arg1, arg2))
end