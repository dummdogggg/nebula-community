--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide.apply
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:39
-- Luau version 6, Types version 3
-- Time taken: 0.003684 seconds

-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
local var9
if not game then
	script = require("test/relative-string") -- Setting global
end
if not game or not typeof then
	var9 = "test/mock"
end
var9 = game
if not var9 or not Vector2 then
	var9 = require("test/mock")
end
local function INLINED() -- Internal function, doesn't exist in bytecode
	var9 = UDim2
	return var9
end
if not game or not INLINED() then
	var9 = require("test/mock").UDim2
end
local _, var11_upvr = require(script.Parent.action)()
local var12_upvw
local function borrow_caches_upvr() -- Line 43, Named "borrow_caches"
	--[[ Upvalues[1]:
		[1]: var12_upvw (read and write)
	]]
	if var12_upvw then
		var12_upvw = nil
		return var12_upvw
	end
	local module = {
		events = {};
	}
	local tbl = {}
	local function __index(arg1, arg2) -- Line 52
		arg1[arg2] = {}
		return arg1[arg2]
	end
	tbl.__index = __index
	module.actions = setmetatable({}, tbl)
	module.nested_debug = setmetatable({}, {
		__index = function(arg1, arg2) -- Line 55, Named "__index"
			arg1[arg2] = {}
			return arg1[arg2]
		end;
	})
	module.nested_stack = {}
	return module
end
local function _(arg1) -- Line 62, Named "return_caches"
	--[[ Upvalues[1]:
		[1]: var12_upvw (read and write)
	]]
	var12_upvw = arg1
end
for i, v in {
	CFrame = CFrame;
	Color3 = Color3;
	UDim = UDim;
	UDim2 = var9;
	Vector2 = var9.Vector2;
	Vector3 = Vector3;
	Rect = Rect;
} do
	({})[i] = v.new
	local var18_upvr
end
local throw_upvr = require(script.Parent.throw)
local flags_upvr = require(script.Parent.flags)
local typeof_upvr = require(var9).typeof
local bind_upvr = require(script.Parent.bind)
return function(arg1, arg2) -- Line 81, Named "apply"
	--[[ Upvalues[8]:
		[1]: throw_upvr (readonly)
		[2]: flags_upvr (readonly)
		[3]: borrow_caches_upvr (readonly)
		[4]: var18_upvr (readonly)
		[5]: typeof_upvr (readonly)
		[6]: bind_upvr (readonly)
		[7]: var11_upvr (readonly)
		[8]: var12_upvw (read and write)
	]]
	if not arg2 then
		throw_upvr("attempt to call a constructor returned by create() with no properties")
	end
	local Parent = arg2.Parent
	local borrow_caches_upvr_result1 = borrow_caches_upvr()
	local events = borrow_caches_upvr_result1.events
	local actions = borrow_caches_upvr_result1.actions
	local nested_debug = borrow_caches_upvr_result1.nested_debug
	local nested_stack = borrow_caches_upvr_result1.nested_stack
	local var39 = 1
	repeat
		for i_2, v_2 in arg2 do
			if i_2 ~= "Parent" then
				if type(i_2) == "string" then
					if flags_upvr.strict then
						if nested_debug[var39][i_2] then
							throw_upvr(`duplicate property {i_2} at depth {var39}`)
						end
						nested_debug[var39][i_2] = true
					end
					if type(v_2) == "table" then
						local var40 = var18_upvr[typeof_upvr(arg1[i_2])]
						if var40 == nil then
							throw_upvr(`cannot aggregate type {typeof_upvr(v_2)} for property {i_2}`)
						end
						arg1[i_2] = var40(unpack(v_2))
					elseif type(v_2) == "function" then
						if typeof_upvr(arg1[i_2]) == "RBXScriptSignal" then
							events[i_2] = v_2
						else
							bind_upvr.property(arg1, i_2, v_2)
						end
					else
						arg1[i_2] = v_2
					end
				elseif type(i_2) == "number" then
					if type(v_2) == "function" then
						bind_upvr.children(arg1, v_2)
					elseif type(v_2) == "table" then
						if var11_upvr(v_2) then
							table.insert(actions[v_2.priority], v_2.callback)
						else
							table.insert(nested_stack, v_2)
							table.insert(nested_stack, var39 + 1)
						end
					else
						v_2.Parent = arg1
					end
				end
			end
		end
	until not table.remove(nested_stack)
	for i_3, v_3 in next, events do
		arg1[i_3]:Connect(v_3)
	end
	for _, v_4 in next, actions do
		for _, v_5 in next, v_4 do
			v_5(arg1)
		end
	end
	if Parent then
		if type(Parent) == "function" then
			bind_upvr.parent(arg1, Parent)
		else
			arg1.Parent = Parent
		end
	end
	table.clear(events)
	for _, v_6 in next, actions do
		table.clear(v_6)
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	if flags_upvr.strict then
		table.clear(nested_debug)
	end
	table.clear(nested_stack)
	var12_upvw = borrow_caches_upvr_result1
	return arg1
end