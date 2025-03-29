--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide.maps
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:49:12
-- Luau version 6, Types version 3
-- Time taken: 0.006476 seconds

if not game then
	script = require("test/relative-string") -- Setting global
end
local throw_upvr = require(script.Parent.throw)
local flags_upvr = require(script.Parent.flags)
local graph = require(script.Parent.graph)
local create_node_upvr = graph.create_node
local create_source_node_upvr = graph.create_source_node
local push_child_to_scope_upvr = graph.push_child_to_scope
local update_descendants_upvr = graph.update_descendants
local assert_stable_scope_upvr = graph.assert_stable_scope
local push_scope_upvr = graph.push_scope
local pop_scope_upvr = graph.pop_scope
local evaluate_node_upvr = graph.evaluate_node
local destroy_upvr = graph.destroy
local function check_primitives_upvr(arg1) -- Line 20, Named "check_primitives"
	--[[ Upvalues[2]:
		[1]: flags_upvr (readonly)
		[2]: throw_upvr (readonly)
	]]
	if not flags_upvr.strict then
	else
		for _, var14 in next, arg1 do
			if type(var14) ~= "table" and type(var14) ~= "userdata" and type(var14) ~= "function" then
				throw_upvr("table source map cannot return primitives")
			end
		end
	end
end
local function indexes_upvr(arg1, arg2) -- Line 29, Named "indexes"
	--[[ Upvalues[10]:
		[1]: assert_stable_scope_upvr (readonly)
		[2]: create_node_upvr (readonly)
		[3]: destroy_upvr (readonly)
		[4]: push_scope_upvr (readonly)
		[5]: create_source_node_upvr (readonly)
		[6]: push_child_to_scope_upvr (readonly)
		[7]: pop_scope_upvr (readonly)
		[8]: update_descendants_upvr (readonly)
		[9]: check_primitives_upvr (readonly)
		[10]: evaluate_node_upvr (readonly)
	]]
	local var8_result1_2 = assert_stable_scope_upvr()
	local tbl_5_upvr = {}
	local tbl_6_upvr = {}
	local tbl_upvr_2 = {}
	local tbl_4_upvr = {}
	local tbl_upvr_3 = {}
	local create_node_upvr_result1_6_upvr = create_node_upvr(var8_result1_2, false, false)
	local function update_children(arg1_2) -- Line 39
		--[[ Upvalues[15]:
			[1]: tbl_5_upvr (readonly)
			[2]: tbl_6_upvr (readonly)
			[3]: destroy_upvr (copied, readonly)
			[4]: tbl_upvr_2 (readonly)
			[5]: tbl_4_upvr (readonly)
			[6]: tbl_upvr_3 (readonly)
			[7]: push_scope_upvr (copied, readonly)
			[8]: create_node_upvr_result1_6_upvr (readonly)
			[9]: create_node_upvr (copied, readonly)
			[10]: create_source_node_upvr (copied, readonly)
			[11]: arg2 (readonly)
			[12]: push_child_to_scope_upvr (copied, readonly)
			[13]: pop_scope_upvr (copied, readonly)
			[14]: update_descendants_upvr (copied, readonly)
			[15]: check_primitives_upvr (copied, readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		for i in next, tbl_5_upvr do
			if arg1_2[i] == nil then
				table.insert(tbl_6_upvr, i)
			end
		end
		for _, v in next, tbl_6_upvr do
			destroy_upvr(tbl_upvr_2[v])
			tbl_5_upvr[v] = nil
			tbl_4_upvr[v] = nil
			tbl_upvr_3[v] = nil
			tbl_upvr_2[v] = nil
		end
		table.clear(tbl_6_upvr)
		push_scope_upvr(create_node_upvr_result1_6_upvr)
		for i_3, v_2 in next, arg1_2 do
			local var50 = tbl_5_upvr[i_3]
			if var50 ~= v_2 then
				if var50 == nil then
					local create_node_upvr_result1 = create_node_upvr(create_node_upvr_result1_6_upvr, false, false)
					tbl_upvr_2[i_3] = create_node_upvr_result1
					local create_source_node_upvr_result1_upvr_2 = create_source_node_upvr(v_2)
					push_scope_upvr(create_node_upvr_result1)
					local pcall_result1, pcall_result2_2 = pcall(arg2, function() -- Line 74
						--[[ Upvalues[2]:
							[1]: push_child_to_scope_upvr (copied, readonly)
							[2]: create_source_node_upvr_result1_upvr_2 (readonly)
						]]
						push_child_to_scope_upvr(create_source_node_upvr_result1_upvr_2)
						return create_source_node_upvr_result1_upvr_2.cache
					end, i_3)
					pop_scope_upvr()
					if not pcall_result1 then
						pop_scope_upvr()
						error(pcall_result2_2, 0)
					end
					tbl_upvr_3[i_3] = create_source_node_upvr_result1_upvr_2
					tbl_4_upvr[i_3] = pcall_result2_2
				else
					create_source_node_upvr_result1_upvr_2 = tbl_upvr_3
					create_source_node_upvr_result1_upvr_2[i_3].cache = v_2
					create_source_node_upvr_result1_upvr_2 = tbl_upvr_3[i_3]
					update_descendants_upvr(create_source_node_upvr_result1_upvr_2)
				end
				tbl_5_upvr[i_3] = v_2
			end
		end
		pop_scope_upvr()
		for _, v_3 in next, tbl_4_upvr do
			create_source_node_upvr_result1_upvr_2 = table.create(#tbl_upvr_2)
			table.insert(create_source_node_upvr_result1_upvr_2, v_3)
			local var57
		end
		check_primitives_upvr(var57)
		return var57
	end
	local create_node_upvr_result1_3_upvr = create_node_upvr(var8_result1_2, function() -- Line 108
		--[[ Upvalues[2]:
			[1]: update_children (readonly)
			[2]: arg1 (readonly)
		]]
		return update_children(arg1())
	end, false)
	evaluate_node_upvr(create_node_upvr_result1_3_upvr)
	return function() -- Line 114
		--[[ Upvalues[2]:
			[1]: push_child_to_scope_upvr (copied, readonly)
			[2]: create_node_upvr_result1_3_upvr (readonly)
		]]
		push_child_to_scope_upvr(create_node_upvr_result1_3_upvr)
		return create_node_upvr_result1_3_upvr.cache
	end
end
local function values_upvr(arg1, arg2) -- Line 120, Named "values"
	--[[ Upvalues[12]:
		[1]: assert_stable_scope_upvr (readonly)
		[2]: create_node_upvr (readonly)
		[3]: flags_upvr (readonly)
		[4]: throw_upvr (readonly)
		[5]: push_scope_upvr (readonly)
		[6]: create_source_node_upvr (readonly)
		[7]: push_child_to_scope_upvr (readonly)
		[8]: pop_scope_upvr (readonly)
		[9]: update_descendants_upvr (readonly)
		[10]: destroy_upvr (readonly)
		[11]: check_primitives_upvr (readonly)
		[12]: evaluate_node_upvr (readonly)
	]]
	local var8_result1 = assert_stable_scope_upvr()
	local tbl_upvw = {}
	local tbl_upvw_2 = {}
	local create_node_upvr_result1_2_upvr = create_node_upvr(var8_result1, false, false)
	local tbl_upvr = {}
	local tbl_3_upvr = {}
	local tbl_2_upvr = {}
	local function update_children_upvr(arg1_3) -- Line 130, Named "update_children"
		--[[ Upvalues[17]:
			[1]: tbl_upvw (read and write)
			[2]: tbl_upvw_2 (read and write)
			[3]: flags_upvr (copied, readonly)
			[4]: throw_upvr (copied, readonly)
			[5]: push_scope_upvr (copied, readonly)
			[6]: create_node_upvr_result1_2_upvr (readonly)
			[7]: create_node_upvr (copied, readonly)
			[8]: tbl_upvr (readonly)
			[9]: create_source_node_upvr (copied, readonly)
			[10]: arg2 (readonly)
			[11]: push_child_to_scope_upvr (copied, readonly)
			[12]: pop_scope_upvr (copied, readonly)
			[13]: tbl_3_upvr (readonly)
			[14]: tbl_2_upvr (readonly)
			[15]: update_descendants_upvr (copied, readonly)
			[16]: destroy_upvr (copied, readonly)
			[17]: check_primitives_upvr (copied, readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var96 = tbl_upvw
		local var97 = tbl_upvw_2
		if flags_upvr.strict then
			local tbl = {}
			for _, v_4 in next, arg1_3 do
				if tbl[v_4] ~= nil then
					throw_upvr("duplicate table value detected")
				end
				tbl[v_4] = true
			end
		end
		push_scope_upvr(create_node_upvr_result1_2_upvr)
		for i_6, v_5 in next, arg1_3 do
			var97[v_5] = i_6
			local var99 = var96[v_5]
			if var99 == nil then
				local create_node_upvr_result1_4 = create_node_upvr(create_node_upvr_result1_2_upvr, false, false)
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				tbl_upvr[v_5] = create_node_upvr_result1_4
				local create_source_node_upvr_result1_upvr = create_source_node_upvr(i_6)
				push_scope_upvr(create_node_upvr_result1_4)
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				local pcall_result1_2, pcall_result2 = pcall(arg2, v_5, function() -- Line 159
					--[[ Upvalues[2]:
						[1]: push_child_to_scope_upvr (copied, readonly)
						[2]: create_source_node_upvr_result1_upvr (readonly)
					]]
					push_child_to_scope_upvr(create_source_node_upvr_result1_upvr)
					return create_source_node_upvr_result1_upvr.cache
				end)
				pop_scope_upvr()
				if not pcall_result1_2 then
					pop_scope_upvr()
					error(pcall_result2, 0)
				end
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				tbl_3_upvr[v_5] = create_source_node_upvr_result1_upvr
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				tbl_2_upvr[v_5] = pcall_result2
			else
				if var99 ~= i_6 then
					create_source_node_upvr_result1_upvr = tbl_3_upvr
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					create_source_node_upvr_result1_upvr[v_5].cache = i_6
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					create_source_node_upvr_result1_upvr = tbl_3_upvr[v_5]
					update_descendants_upvr(create_source_node_upvr_result1_upvr)
				end
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				var96[v_5] = nil
			end
		end
		pop_scope_upvr()
		for i_7 in next, var96 do
			create_source_node_upvr_result1_upvr = tbl_upvr
			destroy_upvr(create_source_node_upvr_result1_upvr[i_7])
			tbl_2_upvr[i_7] = nil
			tbl_3_upvr[i_7] = nil
			tbl_upvr[i_7] = nil
		end
		table.clear(var96)
		tbl_upvw = var97
		tbl_upvw_2 = var96
		for _, v_6 in next, tbl_2_upvr do
			create_source_node_upvr_result1_upvr = table.create(#tbl_upvr)
			table.insert(create_source_node_upvr_result1_upvr, v_6)
			local var106
		end
		check_primitives_upvr(var106)
		return var106
	end
	local create_node_upvr_result1_5_upvr = create_node_upvr(var8_result1, function() -- Line 207
		--[[ Upvalues[2]:
			[1]: update_children_upvr (readonly)
			[2]: arg1 (readonly)
		]]
		return update_children_upvr(arg1())
	end, false)
	evaluate_node_upvr(create_node_upvr_result1_5_upvr)
	return function() -- Line 213
		--[[ Upvalues[2]:
			[1]: push_child_to_scope_upvr (copied, readonly)
			[2]: create_node_upvr_result1_5_upvr (readonly)
		]]
		push_child_to_scope_upvr(create_node_upvr_result1_5_upvr)
		return create_node_upvr_result1_5_upvr.cache
	end
end
return function() -- Line 219
	--[[ Upvalues[2]:
		[1]: indexes_upvr (readonly)
		[2]: values_upvr (readonly)
	]]
	return indexes_upvr, values_upvr
end