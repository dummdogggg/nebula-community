--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide.context
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:00
-- Luau version 6, Types version 3
-- Time taken: 0.002366 seconds

if not game then
	script = require("test/relative-string") -- Setting global
end
local graph = require(script.Parent.graph)
local var2_upvw = 0
local get_scope_upvr = graph.get_scope
local newproxy_result1_upvr = newproxy()
local throw_upvr = require(script.Parent.throw)
local create_node_upvr = graph.create_node
local set_context_upvr = graph.set_context
local push_scope_upvr = graph.push_scope
local pop_scope_upvr = graph.pop_scope
return function(...) -- Line 17, Named "context"
	--[[ Upvalues[8]:
		[1]: var2_upvw (read and write)
		[2]: get_scope_upvr (readonly)
		[3]: newproxy_result1_upvr (readonly)
		[4]: throw_upvr (readonly)
		[5]: create_node_upvr (readonly)
		[6]: set_context_upvr (readonly)
		[7]: push_scope_upvr (readonly)
		[8]: pop_scope_upvr (readonly)
	]]
	var2_upvw += 1
	local var10_upvr
	if 0 >= select('#', ...) then
		var10_upvr = false
	else
		var10_upvr = true
	end
	local var12_upvr = ...
	return function(...) -- Line 24
		--[[ Upvalues[10]:
			[1]: get_scope_upvr (copied, readonly)
			[2]: var2_upvw (readonly)
			[3]: newproxy_result1_upvr (copied, readonly)
			[4]: var10_upvr (readonly)
			[5]: var12_upvr (readonly)
			[6]: throw_upvr (copied, readonly)
			[7]: create_node_upvr (copied, readonly)
			[8]: set_context_upvr (copied, readonly)
			[9]: push_scope_upvr (copied, readonly)
			[10]: pop_scope_upvr (copied, readonly)
		]]
		local var3_result1 = get_scope_upvr()
		local efn
		if select('#', ...) == 0 then
			while var3_result1 do
				local context = var3_result1.context
				if not context then
					var3_result1 = var3_result1.owner
				else
					local var16 = context[var2_upvw]
					if var16 == nil then
						var3_result1 = var3_result1.owner
					else
						if var16 ~= newproxy_result1_upvr then
							return var16
						end
						return nil
					end
				end
			end
			if var10_upvr ~= nil then
				return var12_upvr
			end
			throw_upvr("attempt to get context when no context is set and no default context is set")
		else
			if not var3_result1 then
				return throw_upvr("attempt to set context outside of a vide scope")
			end
			local var17, var18 = ...
			local var6_result1 = create_node_upvr(var3_result1, false, false)
			if var17 == nil then
				efn = newproxy_result1_upvr
			else
				efn = var17
			end
			set_context_upvr(var6_result1, var2_upvw, efn)
			push_scope_upvr(var6_result1)
			function efn(arg1) -- Line 61
				return debug.traceback(arg1, 3)
			end
			local xpcall_result1, xpcall_result2 = xpcall(var18, efn)
			efn = pop_scope_upvr
			efn()
			if not xpcall_result1 then
				efn = throw_upvr
				efn(`error while running context:\n\n{xpcall_result2}`)
			end
			return xpcall_result2
		end
		return nil
	end
end