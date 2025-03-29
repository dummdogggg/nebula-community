--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide.untrack
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:49:22
-- Luau version 6, Types version 3
-- Time taken: 0.000673 seconds

if not game then
	script = require("test/relative-string") -- Setting global
end
local get_scope_upvr = require(script.Parent.graph).get_scope
return function(arg1) -- Line 7, Named "untrack"
	--[[ Upvalues[1]:
		[1]: get_scope_upvr (readonly)
	]]
	local get_scope_upvr_result1 = get_scope_upvr()
	if get_scope_upvr_result1 then
		get_scope_upvr_result1.effect = false
		local pcall_result1, pcall_result2 = pcall(arg1)
		get_scope_upvr_result1.effect = get_scope_upvr_result1.effect
		if not pcall_result1 then
			error(pcall_result2, 0)
		end
		return pcall_result2
	end
	return arg1()
end