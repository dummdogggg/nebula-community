--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide.graph
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:14
-- Luau version 6, Types version 3
-- Time taken: 0.010208 seconds

if not game then
	script = require("test/relative-string") -- Setting global
end
local throw_upvr = require(script.Parent.throw)
local flags_upvr = require(script.Parent.flags)
local tbl_3_upvr = {
	n = 0;
}
local function ycall_upvr(arg1, arg2) -- Line 27, Named "ycall"
	local coroutine_create_result1 = coroutine.create(xpcall)
	local coroutine_resume_result1, coroutine_resume_result2, coroutine_resume_result3 = coroutine.resume(coroutine_create_result1, arg1, function(arg1_2) -- Line 29, Named "efn"
		return debug.traceback(arg1_2, 3)
	end, arg2)
	assert(coroutine_resume_result1)
	if coroutine.status(coroutine_create_result1) ~= "dead" then
		return false, debug.traceback(coroutine_create_result1, "attempt to yield in reactive scope")
	end
	return coroutine_resume_result2, coroutine_resume_result3
end
local function flush_cleanups_upvr(arg1) -- Line 83, Named "flush_cleanups"
	--[[ Upvalues[1]:
		[1]: throw_upvr (readonly)
	]]
	if arg1.cleanups then
		for _, v in next, arg1.cleanups do
			local pcall_result1_2, pcall_result2_2 = pcall(v)
			if not pcall_result1_2 then
				throw_upvr(`cleanup error: {pcall_result2_2}`)
			end
		end
		table.clear(arg1.cleanups)
	end
end
local function _(arg1, arg2) -- Line 94, Named "find_and_swap_pop"
	local len_4 = #arg1
	arg1[table.find(arg1, arg2)] = arg1[len_4]
	arg1[len_4] = nil
end
local function _(arg1) -- Line 101, Named "unparent"
	local parents_4 = arg1.parents
	for i_2, v_2 in parents_4 do
		local len_2 = #v_2
		v_2[table.find(v_2, arg1)] = v_2[len_2]
		v_2[len_2] = nil
		parents_4[i_2] = nil
	end
end
local function destroy_upvr(arg1) -- Line 110, Named "destroy"
	--[[ Upvalues[2]:
		[1]: flush_cleanups_upvr (readonly)
		[2]: destroy_upvr (readonly)
	]]
	flush_cleanups_upvr(arg1)
	local parents_7 = arg1.parents
	for i_3, v_3 in parents_7 do
		local len_7 = #v_3
		v_3[table.find(v_3, arg1)] = v_3[len_7]
		v_3[len_7] = nil
		parents_7[i_3] = nil
	end
	if arg1.owner then
		local owned = arg1.owner.owned
		local len_11 = #owned
		owned[table.find(owned, arg1)] = owned[len_11]
		owned[len_11] = nil
		arg1.owner = false
	end
	if arg1.owned then
		local owned_2 = arg1.owned
		while owned_2[1] do
			destroy_upvr(owned_2[1])
		end
	end
end
local function _(arg1) -- Line 125, Named "destroy_owned"
	--[[ Upvalues[1]:
		[1]: destroy_upvr (readonly)
	]]
	if arg1.owned then
		local owned_5 = arg1.owned
		while owned_5[1] do
			destroy_upvr(owned_5[1])
		end
	end
end
local tbl_2_upvr = {
	n = 0;
}
local function evaluate_node_upvr(arg1) -- Line 134, Named "evaluate_node"
	--[[ Upvalues[7]:
		[1]: flags_upvr (readonly)
		[2]: flush_cleanups_upvr (readonly)
		[3]: destroy_upvr (readonly)
		[4]: tbl_3_upvr (readonly)
		[5]: ycall_upvr (readonly)
		[6]: tbl_2_upvr (readonly)
		[7]: throw_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var38
	if flags_upvr.strict then
		var38 = 2
		for i_4 = 1, var38 do
			flush_cleanups_upvr(arg1)
			if arg1.owned then
				local owned_4 = arg1.owned
				while owned_4[1] do
					destroy_upvr(owned_4[1])
				end
			end
			local var40 = tbl_3_upvr.n + 1
			tbl_3_upvr.n = var40
			tbl_3_upvr[var40] = arg1
			local ycall_upvr_result1, ycall_upvr_result2 = ycall_upvr(arg1.effect, arg1.cache)
			local n_5 = tbl_3_upvr.n
			tbl_3_upvr.n = n_5 - 1
			tbl_3_upvr[n_5] = nil
			if not ycall_upvr_result1 then
				table.clear(tbl_2_upvr)
				tbl_2_upvr.n = 0
				throw_upvr(`effect stacktrace:\n{ycall_upvr_result2}`)
			end
			arg1.cache = ycall_upvr_result2
		end
		if arg1.cache == arg1.cache then
			var38 = false
		else
			var38 = true
		end
		return var38
	end
	flush_cleanups_upvr(arg1)
	if arg1.owned then
		local owned_3 = arg1.owned
		while owned_3[1] do
			i_4 = owned_3[1]
			destroy_upvr(i_4)
		end
	end
	local var45 = tbl_3_upvr.n + 1
	tbl_3_upvr.n = var45
	tbl_3_upvr[var45] = arg1
	local pcall_result1, pcall_result2 = pcall(arg1.effect, arg1.cache)
	local n_2 = tbl_3_upvr.n
	tbl_3_upvr.n = n_2 - 1
	tbl_3_upvr[n_2] = nil
	if not pcall_result1 then
		table.clear(tbl_2_upvr)
		tbl_2_upvr.n = 0
		throw_upvr(`effect stacktrace:\n{pcall_result2}\n`)
	end
	arg1.cache = pcall_result2
	if arg1.cache == pcall_result2 then
	else
	end
	return true
end
local function _(arg1) -- Line 179, Named "queue_children_for_update"
	--[[ Upvalues[1]:
		[1]: tbl_2_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var57
	while arg1[1] do
		var57 += 1
		tbl_2_upvr[var57] = arg1[1]
		local _1_4 = arg1[1]
		local parents = _1_4.parents
		for i_5, v_4 in parents do
			local len = #v_4
			v_4[table.find(v_4, _1_4)] = v_4[len]
			v_4[len] = nil
			parents[i_5] = nil
			local _
		end
	end
	tbl_2_upvr.n = var57
end
return table.freeze({
	push_scope = function(arg1) -- Line 63, Named "push_scope"
		--[[ Upvalues[1]:
			[1]: tbl_3_upvr (readonly)
		]]
		local var9 = tbl_3_upvr.n + 1
		tbl_3_upvr.n = var9
		tbl_3_upvr[var9] = arg1
	end;
	pop_scope = function() -- Line 69, Named "pop_scope"
		--[[ Upvalues[1]:
			[1]: tbl_3_upvr (readonly)
		]]
		local n = tbl_3_upvr.n
		tbl_3_upvr.n = n - 1
		tbl_3_upvr[n] = nil
	end;
	evaluate_node = evaluate_node_upvr;
	get_scope = function() -- Line 41, Named "get_scope"
		--[[ Upvalues[1]:
			[1]: tbl_3_upvr (readonly)
		]]
		return tbl_3_upvr[tbl_3_upvr.n]
	end;
	assert_stable_scope = function() -- Line 45, Named "assert_stable_scope"
		--[[ Upvalues[2]:
			[1]: tbl_3_upvr (readonly)
			[2]: throw_upvr (readonly)
		]]
		local var8 = tbl_3_upvr[tbl_3_upvr.n]
		if not var8 then
			return throw_upvr(`cannot use {debug.info(2, 'n')}() outside a stable or reactive scope`)
		end
		if var8.effect then
			throw_upvr("cannot create a new reactive scope inside another reactive scope")
		end
		return var8
	end;
	push_cleanup = function(arg1, arg2) -- Line 75, Named "push_cleanup"
		if arg1.cleanups then
			table.insert(arg1.cleanups, arg2)
		else
			local tbl_4 = {}
			tbl_4[1] = arg2
			arg1.cleanups = tbl_4
		end
	end;
	destroy = destroy_upvr;
	flush_cleanups = flush_cleanups_upvr;
	push_child_to_scope = function(arg1) -- Line 233, Named "push_child_to_scope"
		--[[ Upvalues[1]:
			[1]: tbl_3_upvr (readonly)
		]]
		local var148 = tbl_3_upvr[tbl_3_upvr.n]
		if var148 and var148.effect then
			table.insert(arg1, var148)
			table.insert(var148.parents, arg1)
		end
	end;
	update_descendants = function(arg1) -- Line 210, Named "update_descendants"
		--[[ Upvalues[3]:
			[1]: tbl_2_upvr (readonly)
			[2]: flags_upvr (readonly)
			[3]: evaluate_node_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local n_3 = tbl_2_upvr.n
		local var137
		while arg1[1] do
			var137 += 1
			tbl_2_upvr[var137] = arg1[1]
			local _1_6 = arg1[1]
			local parents_5 = _1_6.parents
			for i_7, v_6 in parents_5 do
				local len_3 = #v_6
				v_6[table.find(v_6, _1_6)] = v_6[len_3]
				v_6[len_3] = nil
				parents_5[i_7] = nil
				local _
			end
		end
		tbl_2_upvr.n = var137
		var137 = flags_upvr.batch
		if var137 then
		else
			var137 = n_3 + 1
			while var137 <= tbl_2_upvr.n do
				local var142 = tbl_2_upvr[var137]
				if var142.owner then
					local var143
					if var143 then
						var143 = tbl_2_upvr.n
						while var142[1] do
							var143 += 1
							tbl_2_upvr[var143] = var142[1]
							local _1_5 = var142[1]
							local parents_3 = _1_5.parents
							i_7 = nil
							v_6 = nil
							for i_8, v_7 in parents_3, i_7, v_6 do
								local len_6 = #v_7
								v_7[table.find(v_7, _1_5)] = v_7[len_6]
								v_7[len_6] = nil
								parents_3[i_8] = nil
								local _
							end
						end
						tbl_2_upvr.n = var143
					end
				end
				tbl_2_upvr[var137] = false
				var137 += 1
			end
			tbl_2_upvr.n = n_3
		end
	end;
	push_child = function(arg1, arg2) -- Line 58, Named "push_child"
		table.insert(arg1, arg2)
		table.insert(arg2.parents, arg1)
	end;
	create_node = function(arg1, arg2, arg3) -- Line 240, Named "create_node"
		local module = {}
		module.cache = arg3
		module.effect = arg2
		module.cleanups = false
		module.context = false
		module.owner = arg1
		module.owned = false
		module.parents = {}
		if arg1 then
			if arg1.owned then
				table.insert(arg1.owned, module)
				return module
			end
			arg1.owned = {module}
		end
		return module
	end;
	create_source_node = function(arg1) -- Line 265, Named "create_source_node"
		local module_2 = {}
		module_2.cache = arg1
		return module_2
	end;
	get_children = function(arg1) -- Line 269, Named "get_children"
		return {unpack(arg1)}
	end;
	flush_update_queue = function(arg1) -- Line 193, Named "flush_update_queue"
		--[[ Upvalues[2]:
			[1]: tbl_2_upvr (readonly)
			[2]: evaluate_node_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var85 = arg1 + 1
		while var85 <= tbl_2_upvr.n do
			local var86 = tbl_2_upvr[var85]
			if var86.owner then
				local var87
				if var87 then
					var87 = tbl_2_upvr.n
					while var86[1] do
						var87 += 1
						tbl_2_upvr[var87] = var86[1]
						local _1_7 = var86[1]
						local parents_2 = _1_7.parents
						for i_6, v_5 in parents_2 do
							local len_5 = #v_5
							v_5[table.find(v_5, _1_7)] = v_5[len_5]
							v_5[len_5] = nil
							parents_2[i_6] = nil
							local _
						end
					end
					tbl_2_upvr.n = var87
				end
			end
			tbl_2_upvr[var85] = false
		end
		tbl_2_upvr.n = arg1
	end;
	get_update_queue_length = function() -- Line 189, Named "get_update_queue_length"
		--[[ Upvalues[1]:
			[1]: tbl_2_upvr (readonly)
		]]
		return tbl_2_upvr.n
	end;
	set_context = function(arg1, arg2, arg3) -- Line 273, Named "set_context"
		if arg1.context then
			arg1.context[arg2] = arg3
		else
			local tbl = {}
			tbl[arg2] = arg3
			arg1.context = tbl
		end
	end;
	scopes = tbl_3_upvr;
})