--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch.0.2.3.conch.src.bootstrap
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:56
-- Luau version 6, Types version 3
-- Time taken: 0.004089 seconds

local RunService_upvr = game:GetService("RunService")
local ._console_upvr = require("./console")
local any_IsClient_result1_upvr = RunService_upvr:IsClient()
local function _(arg1) -- Line 36, Named "output"
	--[[ Upvalues[1]:
		[1]: ._console_upvr (readonly)
	]]
	._console_upvr.console.output(arg1)
end
local function concat_upvr(...) -- Line 38, Named "concat"
	local args_list = {...}
	for i, v in args_list do
		args_list[i] = tostring(v)
	end
	return table.concat(args_list, ' ')
end
local function print_upvr(...) -- Line 46, Named "print"
	--[[ Upvalues[2]:
		[1]: concat_upvr (readonly)
		[2]: ._console_upvr (readonly)
	]]
	._console_upvr.console.output({
		kind = "normal";
		text = concat_upvr(...);
	})
end
local function error_upvr(...) -- Line 51, Named "error"
	--[[ Upvalues[3]:
		[1]: concat_upvr (readonly)
		[2]: ._console_upvr (readonly)
		[3]: error_upvr (readonly)
	]]
	local concat_result1 = concat_upvr(...)
	._console_upvr.console.output({
		kind = "error";
		text = concat_result1;
	})
	error_upvr(concat_result1, 0)
end
local function warn_upvr(...) -- Line 57, Named "warn"
	--[[ Upvalues[2]:
		[1]: concat_upvr (readonly)
		[2]: ._console_upvr (readonly)
	]]
	._console_upvr.console.output({
		kind = "warn";
		text = concat_upvr(...);
	})
end
local function info_upvr(...) -- Line 62, Named "info"
	--[[ Upvalues[2]:
		[1]: concat_upvr (readonly)
		[2]: ._console_upvr (readonly)
	]]
	._console_upvr.console.output({
		kind = "info";
		text = concat_upvr(...);
	})
end
if any_IsClient_result1_upvr then
	local tbl_2 = {
		description = "Outputs the license to the console.";
		permissions = {};
	}
	local function arguments() -- Line 71
	end
	tbl_2.arguments = arguments
	local function callback() -- Line 72
		--[[ Upvalues[1]:
			[1]: ._console_upvr (readonly)
		]]
		for _, v_2 in string.split("MIT License\n\nCopyright (c) 2025 alicesays_hallo\n\nPermission is hereby granted, free of charge, to any person obtaining a copy\nof this software and associated documentation files (the \"Software\"), to deal\nin the Software without restriction, including without limitation the rights\nto use, copy, modify, merge, publish, distribute, sublicense, and/or sell\ncopies of the Software, and to permit persons to whom the Software is\nfurnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in all\ncopies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR\nIMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,\nFITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE\nAUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER\nLIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,\nOUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE\nSOFTWARE.", '\n') do
			._console_upvr.console.output({
				kind = "normal";
				text = v_2;
			})
		end
	end
	tbl_2.callback = callback
	._console_upvr.register_command("license", tbl_2)
end
local ._state_upvr = require("./state")
local ._arguments_upvr = require("./arguments")
return function() -- Line 80
	--[[ Upvalues[9]:
		[1]: print_upvr (readonly)
		[2]: RunService_upvr (readonly)
		[3]: ._state_upvr (readonly)
		[4]: any_IsClient_result1_upvr (readonly)
		[5]: ._console_upvr (readonly)
		[6]: ._arguments_upvr (readonly)
		[7]: error_upvr (readonly)
		[8]: warn_upvr (readonly)
		[9]: info_upvr (readonly)
	]]
	local function _() -- Line 81, Named "internal"
		--[[ Upvalues[3]:
			[1]: print_upvr (copied, readonly)
			[2]: RunService_upvr (copied, readonly)
			[3]: ._state_upvr (copied, readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 17 start (CF ANALYSIS FAILED)
		local var28
		if RunService_upvr:IsClient() then
			var28 = "CLIENT"
			-- KONSTANTWARNING: GOTO [17] #16
		end
		-- KONSTANTERROR: [0] 1. Error Block 17 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [9] 9. Error Block 18 start (CF ANALYSIS FAILED)
		if RunService_upvr:IsServer() then
			var28 = "SERVER"
		else
			var28 = '?'
		end
		print_upvr(`CONCH INTERNAL INFORMATION - {var28}`)
		print_upvr("")
		print_upvr("REGISTERED ROLES:")
		for i_3, v_3 in ._state_upvr.roles do
			print_upvr(`[{i_3}]: {table.concat(v_3, ", ")}`)
		end
		print_upvr("")
		print_upvr("REGISTERED COMMANDS")
		-- KONSTANTERROR: [9] 9. Error Block 18 end (CF ANALYSIS FAILED)
	end
	local function set(arg1, arg2, arg3) -- Line 97
		arg1[arg2] = arg3
	end
	if any_IsClient_result1_upvr then
		local tbl = {
			permissions = {};
			description = "Converts the given arguments into a string and sends it to the output";
		}
		local function arguments() -- Line 104
			--[[ Upvalues[1]:
				[1]: ._arguments_upvr (copied, readonly)
			]]
			return ._arguments_upvr.variadic(._arguments_upvr.any("any", "Arguments to output"))
		end
		tbl.arguments = arguments
		tbl.callback = print_upvr
		._console_upvr.register_command("print", tbl)
		local tbl_4 = {
			description = "Waits for a given amount of time before continuing execution";
		}
		local function arguments() -- Line 112
			--[[ Upvalues[1]:
				[1]: ._arguments_upvr (copied, readonly)
			]]
			return ._arguments_upvr.number("time", "The amount of time to sleep for")
		end
		tbl_4.arguments = arguments
		tbl_4.callback = task.wait
		._console_upvr.register_command("sleep", tbl_4)
		local tbl_3 = {
			description = "Iterates over a table";
		}
		local function arguments() -- Line 120
			--[[ Upvalues[1]:
				[1]: ._arguments_upvr (copied, readonly)
			]]
			return ._arguments_upvr.table('t', "Table to iterate over")
		end
		tbl_3.arguments = arguments
		local function callback(arg1) -- Line 123
			local pairs_result1_upvr = pairs(arg1)
			local var34_upvw
			return function() -- Line 127
				--[[ Upvalues[3]:
					[1]: pairs_result1_upvr (readonly)
					[2]: arg1 (readonly)
					[3]: var34_upvw (read and write)
				]]
				local pairs_result1_upvr_result1, pairs_result1_upvr_result2 = pairs_result1_upvr(arg1, var34_upvw)
				var34_upvw = pairs_result1_upvr_result1
				return pairs_result1_upvr_result1, pairs_result1_upvr_result2
			end
		end
		tbl_3.callback = callback
		._console_upvr.register_command("pairs", tbl_3)
		local tbl_5 = {
			description = "Iterates over an array";
		}
		local function arguments() -- Line 137
			--[[ Upvalues[1]:
				[1]: ._arguments_upvr (copied, readonly)
			]]
			return ._arguments_upvr.table('t', "Table to iterate over")
		end
		tbl_5.arguments = arguments
		function tbl_5.callback(arg1) -- Line 140
			local ipairs_result1_upvr = ipairs(arg1)
			local var40_upvw = 0
			return function() -- Line 144
				--[[ Upvalues[3]:
					[1]: ipairs_result1_upvr (readonly)
					[2]: arg1 (readonly)
					[3]: var40_upvw (read and write)
				]]
				local var39_result1, var39_result2 = ipairs_result1_upvr(arg1, var40_upvw)
				var40_upvw = var39_result1
				return var39_result1, var39_result2
			end
		end
		._console_upvr.register_command("ipairs", tbl_5)
		._console_upvr.register_quick("error", error_upvr)
		._console_upvr.register_quick("warn", warn_upvr)
		._console_upvr.register_quick("info", info_upvr)
		._console_upvr.register_quick("vector", vector.create)
		._console_upvr.register_quick("set", set)
		._console_upvr.register_command("set", {
			permissions = {};
			description = "Attempts to set the given key and value onto the given object";
			arguments = function() -- Line 160, Named "arguments"
				--[[ Upvalues[1]:
					[1]: ._arguments_upvr (copied, readonly)
				]]
				return ._arguments_upvr.any("object", "the object to set"), ._arguments_upvr.any("key", "key of the object"), ._arguments_upvr.any("value", "the value to set it to")
			end;
			callback = set;
		})
	end
end