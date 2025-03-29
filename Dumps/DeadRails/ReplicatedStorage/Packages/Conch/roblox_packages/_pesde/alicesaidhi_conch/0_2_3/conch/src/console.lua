--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch.0.2.3.conch.src.console
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:44
-- Luau version 6, Types version 3
-- Time taken: 0.006700 seconds

local .__roblox_packages_ast_upvr = require("../roblox_packages/ast")
local ._state_upvr = require("./state")
local tbl_4_upvr = {
	locals = {};
	upvalues = {};
	instructions = {};
}
local var4_upvr = require("../roblox_packages/vm")()
local tbl_5_upvr = {}
local var6_upvr = require("./signal")()
local tbl_20_upvr = {
	vm = var4_upvr;
	commands = tbl_5_upvr;
	output = print;
}
local tbl_21_upvr = {}
local ._user_upvr = require("./user")
local ._net_upvr = require("./net")
local function replicate_to_player_upvr(arg1, arg2) -- Line 58, Named "replicate_to_player"
	--[[ Upvalues[3]:
		[1]: ._user_upvr (readonly)
		[2]: ._state_upvr (readonly)
		[3]: ._net_upvr (readonly)
	]]
	local var13 = ._state_upvr.users[._user_upvr.obtain_user_key(arg1)]
	if not var13 then
	else
		if not ._user_upvr.has_permissions(var13, unpack(arg2.permissions)) then return end
		._net_upvr.server.fire_register_command(arg1, {
			name = arg2.name;
			description = arg2.description;
			permissions = arg2.permissions;
			arguments = arg2.arguments;
		})
	end
end
local var15_upvw = false
local .__roblox_packages_compiler_upvr = require("../roblox_packages/compiler")
local any_IsServer_result1_upvr = game:GetService("RunService"):IsServer()
local Players_upvr = game:GetService("Players")
local function register_command_upvr(arg1, arg2) -- Line 114, Named "register_command"
	--[[ Upvalues[8]:
		[1]: tbl_21_upvr (readonly)
		[2]: tbl_5_upvr (readonly)
		[3]: var4_upvr (readonly)
		[4]: ._state_upvr (readonly)
		[5]: var6_upvr (readonly)
		[6]: any_IsServer_result1_upvr (readonly)
		[7]: Players_upvr (readonly)
		[8]: replicate_to_player_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local tbl_10_upvr = {arg2.arguments()}
	if not tbl_10_upvr then
		tbl_10_upvr = {}
		tbl_10_upvr[1] = {
			kind = "varargs";
			type = "any";
			name = "...";
			description = "unspecified";
		}
	end
	local tbl_8 = {}
	local tbl_3_upvr = {}
	for i, v in tbl_10_upvr do
		local var78 = tbl_21_upvr[v.type]
		if not var78 then
			var78 = warn(`no argument of type "{v.type}" is registered`)
			if not var78 then
				var78 = tbl_21_upvr.any
			end
		end
		local clone_2 = table.clone(var78.analysis)
		tbl_3_upvr[i] = var78.convert
		local tbl_19 = {}
		if v.kind == "varargs" then
		else
		end
		tbl_19.kind = "argument"
		if not v.name then
		end
		tbl_19.name = clone_2.name
		tbl_19.description = v.description
		tbl_19.type = clone_2.type
		tbl_19.suggestion_generator = clone_2.suggestion_generator
		tbl_8[i] = tbl_19
	end
	local tbl_6 = {}
	tbl_6.name = arg1
	tbl_6.description = arg2.description
	tbl_6.permissions = arg2.permissions
	tbl_6.arguments = tbl_10_upvr
	local tbl_16 = {
		kind = "command";
	}
	tbl_16.name = arg1
	tbl_16.description = arg2.description
	tbl_16.arguments = tbl_8
	tbl_6.type_info = tbl_16
	tbl_6.callback = arg2.callback
	tbl_6.dirty_replicate = true
	tbl_5_upvr[arg1] = tbl_6
	var4_upvr.commands[arg1] = function(...) -- Line 174
		--[[ Upvalues[6]:
			[1]: tbl_10_upvr (readonly)
			[2]: tbl_3_upvr (readonly)
			[3]: arg2 (readonly)
			[4]: ._state_upvr (copied, readonly)
			[5]: var6_upvr (copied, readonly)
			[6]: arg1 (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local args_list_upvr = {...}
		local function _(arg1_5, ...) -- Line 177, Named "move"
			--[[ Upvalues[1]:
				[1]: args_list_upvr (readonly)
			]]
			for i_2 = 0, select('#', ...) - 1 do
				args_list_upvr[i_2 + arg1_5] = select(i_2 + 1, ...)
			end
		end
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [21] 19. Error Block 22 start (CF ANALYSIS FAILED)
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [22.7]
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
		args_list_upvr[nil] = tbl_3_upvr[nil](select(nil, ...))
		-- KONSTANTERROR: [21] 19. Error Block 22 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [14] 13. Error Block 2 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		-- KONSTANTERROR: [14] 13. Error Block 2 end (CF ANALYSIS FAILED)
	end
	if any_IsServer_result1_upvr then
		for _, v_2 in Players_upvr:GetPlayers() do
			replicate_to_player_upvr(v_2, tbl_6)
			local var89
		end
	end
	return var89
end
local .__roblox_packages_intel_upvr = require("../roblox_packages/intel")
return {
	console = tbl_20_upvr;
	register_quick = function(arg1, arg2, ...) -- Line 228, Named "register"
		--[[ Upvalues[1]:
			[1]: register_command_upvr (readonly)
		]]
		local tbl_13 = {}
		tbl_13.name = arg1
		tbl_13.callback = arg2
		function tbl_13.arguments() -- Line 232
		end
		tbl_13.permissions = {...}
		register_command_upvr(arg1, tbl_13)
	end;
	register_command = register_command_upvr;
	replicate_to_player = replicate_to_player_upvr;
	execute = function(arg1) -- Line 85, Named "execute"
		--[[ Upvalues[6]:
			[1]: .__roblox_packages_ast_upvr (readonly)
			[2]: var15_upvw (read and write)
			[3]: tbl_20_upvr (readonly)
			[4]: .__roblox_packages_compiler_upvr (readonly)
			[5]: tbl_4_upvr (readonly)
			[6]: var4_upvr (readonly)
		]]
		local var17 = false
		local var1_result1 = .__roblox_packages_ast_upvr(arg1, var17)
		if var1_result1.status == "pending" then
			var17 = false
		else
			var17 = true
		end
		assert(var17, "unfinished block")
		assert(not var15_upvw, "already executing!")
		tbl_20_upvr.output({
			kind = "info";
			text = `> {var1_result1.src}`;
		})
		if var1_result1.status == "error" then
			return tbl_20_upvr.output({
				kind = "error";
				text = var1_result1.why;
			})
		end
		var15_upvw = true
		tbl_4_upvr.instructions = {}
		;(function(arg1_3, arg2, ...) -- Line 100, Named "on_complete"
			--[[ Upvalues[1]:
				[1]: tbl_20_upvr (copied, readonly)
			]]
			if not arg1_3 then
				tbl_20_upvr.output({
					kind = "error";
					text = tostring(arg2);
				})
			end
		end)(pcall(var4_upvr.run, .__roblox_packages_compiler_upvr(var1_result1.value, tbl_4_upvr)))
		var15_upvw = false
	end;
	analyze = function(arg1, arg2) -- Line 237, Named "analyze"
		--[[ Upvalues[4]:
			[1]: tbl_5_upvr (readonly)
			[2]: var4_upvr (readonly)
			[3]: tbl_4_upvr (readonly)
			[4]: .__roblox_packages_intel_upvr (readonly)
		]]
		local tbl_9 = {}
		local tbl = {}
		local var108 = 1
		for _, v_3 in tbl_5_upvr do
			tbl[var108] = v_3.type_info
			var108 += 1
		end
		for i_5, v_4 in var4_upvr.globals do
			tbl_9[i_5] = v_4
		end
		for i_6, v_5 in tbl_4_upvr.locals do
			tbl_9[v_5] = var4_upvr.locals[i_6]
		end
		local module_2 = {}
		module_2.code = arg1
		module_2.where = arg2
		module_2.variables = tbl_9
		module_2.commands = tbl
		return .__roblox_packages_intel_upvr.generate_analysis_info(module_2)
	end;
	write_global = function(arg1, arg2) -- Line 50, Named "write_global"
		--[[ Upvalues[2]:
			[1]: ._state_upvr (readonly)
			[2]: var4_upvr (readonly)
		]]
		assert(._state_upvr.local_user, "cannot set global on server")
		assert(string.match(arg1, "^[A-z%-@_]*$"), `{arg1} is not a valid name`)
		var4_upvr.globals[arg1] = arg2
	end;
	after_command_run = var6_upvr;
	register_type = function(arg1, arg2) -- Line 30, Named "register_type"
		--[[ Upvalues[1]:
			[1]: tbl_21_upvr (readonly)
		]]
		tbl_21_upvr[arg1] = arg2
		return function(arg1_2, arg2_2) -- Line 40
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			local module = {}
			module.name = arg1_2
			module.description = arg2_2
			module.kind = "arg"
			module.type = arg1
			return module
		end
	end;
	get_type = function(arg1) -- Line 56, Named "get_type"
		--[[ Upvalues[1]:
			[1]: tbl_21_upvr (readonly)
		]]
		return tbl_21_upvr[arg1]
	end;
	ast = .__roblox_packages_ast_upvr;
}