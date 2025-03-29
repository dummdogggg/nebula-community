--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide.bind
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:33:48
-- Luau version 6, Types version 3
-- Time taken: 0.001934 seconds

if not game then
	script = require("test/relative-string") -- Setting global
end
local graph = require(script.Parent.graph)
local evaluate_node_upvr = graph.evaluate_node
local create_node_upvr = graph.create_node
local assert_stable_scope_upvr = graph.assert_stable_scope
function create_implicit_effect(arg1, arg2) -- Line 9
	--[[ Upvalues[3]:
		[1]: evaluate_node_upvr (readonly)
		[2]: create_node_upvr (readonly)
		[3]: assert_stable_scope_upvr (readonly)
	]]
	evaluate_node_upvr(create_node_upvr(assert_stable_scope_upvr(), arg1, arg2))
end
local function update_property_effect_upvr(arg1) -- Line 19, Named "update_property_effect"
	arg1.instance[arg1.property] = arg1.source()
	return arg1
end
local function update_parent_effect_upvr(arg1) -- Line 29, Named "update_parent_effect"
	arg1.instance.Parent = arg1.parent()
	return arg1
end
local function update_children_effect_upvr(arg1) -- Line 42, Named "update_children_effect"
	local cur_children_set_upvr = arg1.cur_children_set
	local new_children_set_upvr = arg1.new_children_set
	local children = arg1.children()
	if type(children) ~= "table" then
		children = {children}
	end
	local function process_child_upvr(arg1_2) -- Line 52, Named "process_child"
		--[[ Upvalues[4]:
			[1]: process_child_upvr (readonly)
			[2]: new_children_set_upvr (readonly)
			[3]: cur_children_set_upvr (readonly)
			[4]: arg1 (readonly)
		]]
		if type(arg1_2) == "table" then
			for _, v in next, arg1_2 do
				process_child_upvr(v)
			end
		else
			if new_children_set_upvr[arg1_2] then return end
			new_children_set_upvr[arg1_2] = true
			if not cur_children_set_upvr[arg1_2] then
				arg1_2.Parent = arg1.instance
				return
			end
			cur_children_set_upvr[arg1_2] = nil
		end
	end
	process_child_upvr(children)
	for i_2 in next, cur_children_set_upvr do
		i_2.Parent = nil
	end
	table.clear(cur_children_set_upvr)
	arg1.cur_children_set = new_children_set_upvr
	arg1.new_children_set = cur_children_set_upvr
	return arg1
end
return {
	property = function(arg1, arg2, arg3) -- Line 82, Named "property"
		--[[ Upvalues[1]:
			[1]: update_property_effect_upvr (readonly)
		]]
		local module = {}
		module.instance = arg1
		module.property = arg2
		module.source = arg3
		return create_implicit_effect(update_property_effect_upvr, module)
	end;
	parent = function(arg1, arg2) -- Line 90, Named "parent"
		--[[ Upvalues[1]:
			[1]: update_parent_effect_upvr (readonly)
		]]
		local module_3 = {}
		module_3.instance = arg1
		module_3.parent = arg2
		return create_implicit_effect(update_parent_effect_upvr, module_3)
	end;
	children = function(arg1, arg2) -- Line 97, Named "children"
		--[[ Upvalues[1]:
			[1]: update_children_effect_upvr (readonly)
		]]
		local module_2 = {}
		module_2.instance = arg1
		module_2.cur_children_set = {}
		module_2.new_children_set = {}
		module_2.children = arg2
		return create_implicit_effect(update_children_effect_upvr, module_2)
	end;
}