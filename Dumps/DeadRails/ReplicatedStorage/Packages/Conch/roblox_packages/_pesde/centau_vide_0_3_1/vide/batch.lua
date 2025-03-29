--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide.batch
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:49:00
-- Luau version 6, Types version 3
-- Time taken: 0.000874 seconds

if not game then
	script = require("test/relative-string") -- Setting global
end
local flags_upvr = require(script.Parent.flags)
local graph_upvr = require(script.Parent.graph)
local throw_upvr = require(script.Parent.throw)
return function(arg1) -- Line 7, Named "batch"
	--[[ Upvalues[3]:
		[1]: flags_upvr (readonly)
		[2]: graph_upvr (readonly)
		[3]: throw_upvr (readonly)
	]]
	local batch = flags_upvr.batch
	local var5
	if not batch then
		flags_upvr.batch = true
		var5 = graph_upvr.get_update_queue_length()
	end
	local pcall_result1, pcall_result2 = pcall(arg1)
	if not batch then
		flags_upvr.batch = false
		graph_upvr.flush_update_queue(var5)
	end
	if not pcall_result1 then
		throw_upvr(`error occured while batching updates: {pcall_result2}`)
	end
end