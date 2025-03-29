--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide.root
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:49:16
-- Luau version 6, Types version 3
-- Time taken: 0.001238 seconds

if not game then
	script = require("test/relative-string") -- Setting global
end
local graph = require(script.Parent.graph)
local create_node_upvr = graph.create_node
local tbl_upvr = {}
local throw_upvr = require(script.Parent.throw)
local destroy_upvr = graph.destroy
local push_scope_upvr = graph.push_scope
local pop_scope_upvr = graph.pop_scope
return function(arg1) -- Line 13, Named "root"
	--[[ Upvalues[6]:
		[1]: create_node_upvr (readonly)
		[2]: tbl_upvr (readonly)
		[3]: throw_upvr (readonly)
		[4]: destroy_upvr (readonly)
		[5]: push_scope_upvr (readonly)
		[6]: pop_scope_upvr (readonly)
	]]
	local var2_result1_upvr = create_node_upvr(false, false, false)
	tbl_upvr[var2_result1_upvr] = true
	local function var9() -- Line 18
		--[[ Upvalues[4]:
			[1]: tbl_upvr (copied, readonly)
			[2]: var2_result1_upvr (readonly)
			[3]: throw_upvr (copied, readonly)
			[4]: destroy_upvr (copied, readonly)
		]]
		if not tbl_upvr[var2_result1_upvr] then
			throw_upvr("root already destroyed")
		end
		tbl_upvr[var2_result1_upvr] = nil
		destroy_upvr(var2_result1_upvr)
	end
	push_scope_upvr(var2_result1_upvr)
	local module = {xpcall(arg1, function(arg1_2) -- Line 26, Named "efn"
		return debug.traceback(arg1_2, 3)
	end, var9)}
	pop_scope_upvr()
	if not module[1] then
		if not tbl_upvr[var2_result1_upvr] then
			throw_upvr("root already destroyed")
		end
		tbl_upvr[var2_result1_upvr] = nil
		destroy_upvr(var2_result1_upvr)
		throw_upvr(`error while running root():\n\n{module[2]}`)
	end
	return var9, unpack(module, 2)
end