--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch.0.2.3.conch.src.arguments
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:31
-- Luau version 6, Types version 3
-- Time taken: 0.008645 seconds

local Players_upvr = game:GetService("Players")
local ._console = require("./console")
local function noop(arg1) -- Line 7
	return arg1
end
local tbl_9 = {}
local function convert(arg1) -- Line 34
	if typeof(arg1) == "table" then
		local clone_2 = table.clone(arg1)
		for i, v in clone_2 do
			clone_2[i] = tostring(v)
			local var14
		end
		return var14
	end
	return {tostring(arg1)}
end
tbl_9.convert = convert
tbl_9.analysis = {
	kind = "argument";
	name = "strings";
	type = "{ string }";
}
local tbl_3 = {}
local function convert(arg1) -- Line 74
	if typeof(arg1) == "boolean" then
		return arg1
	end
	if typeof(arg1) == "number" and 0 < arg1 then
		return true
	end
	if typeof(arg1) == "number" and arg1 <= 0 then
		return false
	end
	error(`{typeof(arg1)} is not a valid boolean`)
end
tbl_3.convert = convert
local tbl_2 = {
	kind = "argument";
	name = "boolean";
	type = "boolean";
}
local function suggestion_generator(arg1) -- Line 91
	local module_2 = {}
	if string.sub("true", 1, #arg1) == arg1 then
		table.insert(module_2, "true")
	end
	if string.sub("false", 1, #arg1) == arg1 then
		table.insert(module_2, "false")
	end
	return module_2
end
tbl_2.suggestion_generator = suggestion_generator
tbl_3.analysis = tbl_2
local tbl_8 = {}
local function convert(arg1) -- Line 108
	if typeof(arg1) == "table" then
		local clone_3 = table.clone(arg1)
		for i_2, v_2 in clone_3 do
			if typeof(v_2) == "boolean" then
				clone_3[i_2] = v_2
			elseif typeof(v_2) == "number" and 0 < v_2 then
				clone_3[i_2] = true
			elseif typeof(v_2) == "number" and v_2 <= 0 then
				clone_3[i_2] = false
			else
				error(`type {typeof(v_2)} of {i_2} is not a valid boolean`)
			end
		end
		return clone_3
	end
	if typeof(arg1) == "boolean" then
		local module_8 = {}
		module_8[1] = arg1
		return module_8
	end
	if typeof(arg1) == "number" and 0 < arg1 then
		return {true}
	end
	if typeof(arg1) == "number" and arg1 <= 0 then
		return {false}
	end
	v_2 = arg1
	i_2 = typeof(v_2)
	error(`{i_2} is not a valid boolean`)
end
tbl_8.convert = convert
local tbl = {
	kind = "argument";
	name = "boolean";
	type = "boolean";
}
local function suggestion_generator(arg1) -- Line 139
	local module_11 = {}
	if string.sub("true", 1, #arg1) == arg1 then
		table.insert(module_11, "true")
	end
	if string.sub("false", 1, #arg1) == arg1 then
		table.insert(module_11, "false")
	end
	return module_11
end
tbl.suggestion_generator = suggestion_generator
tbl_8.analysis = tbl
local tbl_7 = {}
local function convert(arg1) -- Line 185
	if type(arg1) == "vector" then
		local module_6 = {}
		module_6[1] = arg1
		return module_6
	end
	if typeof(arg1) == "table" then
		local module_10 = {}
		for i_3, v_3 in arg1 do
			local var44
			if type(v_3) == "vector" then
				var44 = v_3
			elseif typeof(v_3) == "table" then
				var44 = vector.create(v_3[1] or 0, v_3[2] or 0, v_3[3] or 0)
			else
				error(`{v_3} is not valid`, 0)
				var44 = nil
			end
			module_10[i_3] = var44
		end
		return module_10
	end
	error(`{arg1} is not valid`, 0)
end
tbl_7.convert = convert
tbl_7.analysis = {
	kind = "argument";
	name = "vector";
	type = "vector";
}
local function enum_map_upvr(arg1, arg2, arg3) -- Line 211, Named "enum_map"
	local module_3 = {}
	local function convert(arg1_2) -- Line 217
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		local tostring_result1 = tostring(arg1_2)
		if arg1[tostring_result1] == nil then
			error(`{tostring_result1} is not valid`, 0)
		end
		return arg1[tostring_result1]
	end
	module_3.convert = convert
	local tbl_5 = {
		kind = "argument";
		name = arg2 or "enum";
	}
	tbl_5.description = arg3
	tbl_5.type = arg2 or "enum"
	local function suggestion_generator(arg1_3) -- Line 228
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		local any_lower_result1_3 = arg1_3:lower()
		for i_4 in arg1 do
			if string.sub(i_4:lower(), 1, #any_lower_result1_3) == any_lower_result1_3 then
				table.insert({}, i_4)
			end
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		return {}
	end
	tbl_5.suggestion_generator = suggestion_generator
	module_3.analysis = tbl_5
	return module_3
end
local ._context_upvr = require("./context")
local function convert_arg_to_player_upvr(arg1) -- Line 256, Named "convert_arg_to_player"
	--[[ Upvalues[2]:
		[1]: ._context_upvr (readonly)
		[2]: Players_upvr (readonly)
	]]
	local any_get_command_context_result1 = ._context_upvr.get_command_context()
	local var58
	if arg1 == "@s" then
		local function INLINED() -- Internal function, doesn't exist in bytecode
			var58 = any_get_command_context_result1.executor.player
			return var58
		end
		if not any_get_command_context_result1 or not INLINED() then
			var58 = error("not executed by a player")
		end
		return var58
	end
	if typeof(arg1) == "number" then
		return assert(Players_upvr:GetPlayerByUserId(arg1), `player with id {arg1} is not in this server`)
	end
	if typeof(arg1) == "string" then
		return assert(Players_upvr:FindFirstChild(arg1), `player "{arg1}" is not valid`)
	end
	error(`unknown arg {arg1}`)
end
local function convert_arg_to_players_upvr(arg1) -- Line 277, Named "convert_arg_to_players"
	--[[ Upvalues[2]:
		[1]: Players_upvr (readonly)
		[2]: convert_arg_to_player_upvr (readonly)
	]]
	if arg1 == "@a" then
		return Players_upvr:GetPlayers()
	end
	if typeof(arg1) == "table" then
		local clone = table.clone(arg1)
		for i_6, v_5 in clone do
			clone[i_6] = convert_arg_to_player_upvr(v_5)
			local var64
		end
		return var64
	end
	return {convert_arg_to_player_upvr(arg1)}
end
local tbl_6 = {}
local function convert(arg1) -- Line 296
	--[[ Upvalues[1]:
		[1]: convert_arg_to_player_upvr (readonly)
	]]
	return convert_arg_to_player_upvr(arg1)
end
tbl_6.convert = convert
local tbl_4 = {
	kind = "argument";
	name = "player";
	type = "Player";
}
local function suggestion_generator(arg1) -- Line 302
	--[[ Upvalues[1]:
		[1]: Players_upvr (readonly)
	]]
	local any_lower_result1_2 = arg1:lower()
	local module_9 = {}
	if string.sub("@s", 1, #any_lower_result1_2) == any_lower_result1_2 then
		table.insert(module_9, "@s")
	end
	for _, v_6 in Players_upvr:GetPlayers() do
		if string.sub(v_6.Name:lower(), 1, #any_lower_result1_2) == any_lower_result1_2 or string.sub(v_6.DisplayName:lower(), 1, #any_lower_result1_2) == any_lower_result1_2 then
			table.insert(module_9, v_6.Name)
		end
	end
	return module_9
end
tbl_4.suggestion_generator = suggestion_generator
tbl_6.analysis = tbl_4
return {
	any = ._console.register_type("any", {
		convert = noop;
		analysis = {
			kind = "argument";
			name = "any";
			type = "any";
		};
	});
	string = ._console.register_type("string", {
		convert = tostring;
		analysis = {
			kind = "argument";
			name = "string";
			type = "string";
		};
	});
	strings = ._console.register_type("strings", tbl_9);
	number = ._console.register_type("number", {
		convert = noop;
		analysis = {
			kind = "argument";
			name = "number";
			type = "number";
		};
	});
	numbers = ._console.register_type("numbers", {
		convert = function(arg1) -- Line 9, Named "wrap_if_not"
			if type(arg1) == "table" then
				return arg1
			end
			local module_4 = {}
			module_4[1] = arg1
			return module_4
		end;
		analysis = {
			kind = "argument";
			name = "numbers";
			type = "{ number }";
		};
	});
	boolean = ._console.register_type("boolean", tbl_3);
	booleans = ._console.register_type("booleans", tbl_8);
	table = ._console.register_type("table", {
		convert = noop;
		analysis = {
			kind = "argument";
			name = "table";
			type = "table";
		};
	});
	vector = ._console.register_type("vector", {
		convert = function(arg1) -- Line 165, Named "into_vector"
			if type(arg1) == "vector" then
				return arg1
			end
			if typeof(arg1) == "table" then
				return vector.create(arg1[1] or 0, arg1[2] or 0, arg1[3] or 0)
			end
			error(`{arg1} is not valid`, 0)
		end;
		analysis = {
			kind = "argument";
			name = "vector";
			type = "vector";
		};
	});
	vectors = ._console.register_type("vectors", tbl_7);
	player = ._console.register_type("player", tbl_6);
	players = ._console.register_type("players", {
		kind = "any";
		convert = function(arg1) -- Line 327, Named "convert"
			--[[ Upvalues[1]:
				[1]: convert_arg_to_players_upvr (readonly)
			]]
			return convert_arg_to_players_upvr(arg1)
		end;
		analysis = {
			kind = "argument";
			name = "players";
			type = "{ Player }";
			suggestion_generator = function(arg1) -- Line 333, Named "suggestion_generator"
				--[[ Upvalues[1]:
					[1]: Players_upvr (readonly)
				]]
				local any_lower_result1 = arg1:lower()
				local module_5 = {}
				if string.sub("@s", 1, #any_lower_result1) == any_lower_result1 then
					table.insert(module_5, "@s")
				end
				if string.sub("@a", 1, #any_lower_result1) == any_lower_result1 then
					table.insert(module_5, "@a")
				end
				for _, v_7 in Players_upvr:GetPlayers() do
					if string.sub(v_7.Name:lower(), 1, #any_lower_result1) == any_lower_result1 or string.sub(v_7.DisplayName:lower(), 1, #any_lower_result1) == any_lower_result1 then
						table.insert(module_5, v_7.Name)
					end
				end
				return module_5
			end;
		};
	});
	userinput = ._console.register_type("userinput", (function(arg1) -- Line 359, Named "generate_names_for_enum"
		--[[ Upvalues[1]:
			[1]: enum_map_upvr (readonly)
		]]
		local module_7 = {}
		for _, v_8 in arg1:GetEnumItems() do
			module_7[v_8.Name] = v_8
		end
		return enum_map_upvr(module_7, tostring(arg1))
	end)(Enum.UserInputType));
	variadic = function(arg1) -- Line 371, Named "variadic"
		arg1.kind = "varargs"
		return arg1
	end;
	enum_new = function(arg1, arg2, arg3) -- Line 246, Named "enum_new"
		--[[ Upvalues[1]:
			[1]: enum_map_upvr (readonly)
		]]
		local module = {}
		for _, v_4 in arg1 do
			module[tostring(v_4)] = v_4
		end
		return enum_map_upvr(module, arg2, arg3)
	end;
	enum_map = enum_map_upvr;
}