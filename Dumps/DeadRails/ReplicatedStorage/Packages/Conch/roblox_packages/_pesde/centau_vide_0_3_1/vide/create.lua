--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide.create
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:49:06
-- Luau version 6, Types version 3
-- Time taken: 0.002009 seconds

-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
local var1_upvr
if not game then
	var1_upvr = "test/relative-string"
	script = require(var1_upvr) -- Setting global
end
var1_upvr = game
if not var1_upvr or not typeof then
	var1_upvr = require("test/mock")
end
local function INLINED() -- Internal function, doesn't exist in bytecode
	var1_upvr = Instance
	return var1_upvr
end
if not game or not INLINED() then
	var1_upvr = require("test/mock").Instance
end
local throw_upvr = require(script.Parent.throw)
local apply_upvr = require(script.Parent.apply)
local module_upvr = {}
local tbl = {}
local defaults_upvr = require(script.Parent.defaults)
function tbl.__index(arg1, arg2) -- Line 12
	--[[ Upvalues[4]:
		[1]: var1_upvr (readonly)
		[2]: throw_upvr (readonly)
		[3]: defaults_upvr (readonly)
		[4]: apply_upvr (readonly)
	]]
	local pcall_result1, pcall_result2_upvr = pcall(var1_upvr.new, arg2)
	if not pcall_result1 then
		throw_upvr(`invalid class name, could not create instance of class {arg2}`)
	end
	local var13 = defaults_upvr[arg2]
	if var13 then
		for i, v in next, var13 do
			pcall_result2_upvr[i] = v
		end
	end
	local function ctor(arg1_2) -- Line 23
		--[[ Upvalues[2]:
			[1]: apply_upvr (copied, readonly)
			[2]: pcall_result2_upvr (readonly)
		]]
		return apply_upvr(pcall_result2_upvr:Clone(), arg1_2)
	end
	arg1[arg2] = ctor
	return ctor
end
setmetatable(module_upvr, tbl)
local function _(arg1) -- Line 32, Named "create_instance"
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr[arg1]
end
local function _(arg1) -- Line 36, Named "clone_instance"
	--[[ Upvalues[2]:
		[1]: throw_upvr (readonly)
		[2]: apply_upvr (readonly)
	]]
	return function(arg1_3) -- Line 37
		--[[ Upvalues[3]:
			[1]: arg1 (readonly)
			[2]: throw_upvr (copied, readonly)
			[3]: apply_upvr (copied, readonly)
		]]
		local clone_2 = arg1:Clone()
		if not clone_2 then
			throw_upvr("attempt to clone a non-archivable instance")
		end
		return apply_upvr(clone_2, arg1_3)
	end
end
local typeof_upvr = var1_upvr.typeof
return function(arg1) -- Line 44, Named "create"
	--[[ Upvalues[4]:
		[1]: module_upvr (readonly)
		[2]: typeof_upvr (readonly)
		[3]: throw_upvr (readonly)
		[4]: apply_upvr (readonly)
	]]
	if type(arg1) == "string" then
		return module_upvr[arg1]
	end
	if typeof_upvr(arg1) == "Instance" then
		return function(arg1_4) -- Line 37
			--[[ Upvalues[3]:
				[1]: arg1 (readonly)
				[2]: throw_upvr (copied, readonly)
				[3]: apply_upvr (copied, readonly)
			]]
			local clone = arg1:Clone()
			if not clone then
				throw_upvr("attempt to clone a non-archivable instance")
			end
			return apply_upvr(clone, arg1_4)
		end
	end
	throw_upvr("bad argument #1, expected string or instance, got "..typeof_upvr(arg1))
	return nil
end