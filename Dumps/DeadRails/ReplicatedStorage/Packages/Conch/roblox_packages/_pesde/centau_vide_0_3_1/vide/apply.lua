--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide.apply
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:59
-- Luau version 6, Types version 3
-- Time taken: 0.002691 seconds

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
	-- KONSTANTERROR: [0] 1. Error Block 64 start (CF ANALYSIS FAILED)
	if not arg2 then
		throw_upvr("attempt to call a constructor returned by create() with no properties")
	end
	-- KONSTANTERROR: [0] 1. Error Block 64 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [169] 134. Error Block 93 start (CF ANALYSIS FAILED)
	if not table.remove(borrow_caches_upvr().nested_stack) then
		-- KONSTANTWARNING: GOTO [181] #144
	end
	-- KONSTANTERROR: [169] 134. Error Block 93 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [20] 15. Error Block 4 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [20] 15. Error Block 4 end (CF ANALYSIS FAILED)
end