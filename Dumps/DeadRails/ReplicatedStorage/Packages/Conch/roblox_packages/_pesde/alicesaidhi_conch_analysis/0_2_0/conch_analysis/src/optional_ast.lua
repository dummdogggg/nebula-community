--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_analysis.0.2.0.conch_analysis.src.optional_ast
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:05
-- Luau version 6, Types version 3
-- Time taken: 0.045896 seconds

local function _(arg1) -- Line 289, Named "char"
	return string.byte(arg1)
end
local function parse_upvr(arg1, arg2) -- Line 294, Named "parse"
	local var1_upvw = 0
	local var2_upvw = 0
	local buffer_len_result1_upvr = buffer.len(arg1)
	local function _() -- Line 299, Named "peek"
		--[[ Upvalues[3]:
			[1]: var1_upvw (read and write)
			[2]: buffer_len_result1_upvr (readonly)
			[3]: arg1 (readonly)
		]]
		if var1_upvw == buffer_len_result1_upvr then
			return 0
		end
		return buffer.readu8(arg1, var1_upvw)
	end
	local function _() -- Line 304, Named "bump"
		--[[ Upvalues[2]:
			[1]: var1_upvw (read and write)
			[2]: buffer_len_result1_upvr (readonly)
		]]
		var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
	end
	local function _() -- Line 306, Named "bump_any"
		--[[ Upvalues[4]:
			[1]: var1_upvw (read and write)
			[2]: buffer_len_result1_upvr (readonly)
			[3]: arg1 (readonly)
			[4]: var2_upvw (read and write)
		]]
		local var4
		if var1_upvw == buffer_len_result1_upvr then
			var4 = 0
		else
			var4 = buffer.readu8(arg1, var1_upvw)
		end
		if var4 == 10 then
			var4 = var2_upvw
			var4 += 1
			var2_upvw = var4
		end
		var4 = math.min(var1_upvw + 1, buffer_len_result1_upvr)
		var1_upvw = var4
		if var1_upvw == buffer_len_result1_upvr then
			var4 = 0
			return var4
		end
		var4 = buffer.readu8(arg1, var1_upvw)
		return var4
	end
	local function _(arg1_2) -- Line 315, Named "eof"
		--[[ Upvalues[2]:
			[1]: var1_upvw (read and write)
			[2]: buffer_len_result1_upvr (readonly)
		]]
		if buffer_len_result1_upvr <= var1_upvw then
			error(arg1_2, 0)
		end
		return false
	end
	local function _() -- Line 320, Named "bump_peek"
		--[[ Upvalues[3]:
			[1]: var1_upvw (read and write)
			[2]: buffer_len_result1_upvr (readonly)
			[3]: arg1 (readonly)
		]]
		var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
		if var1_upvw == buffer_len_result1_upvr then
			return 0
		end
		return buffer.readu8(arg1, var1_upvw)
	end
	local function _(arg1_3) -- Line 325, Named "is_whitespace"
		local var6 = true
		if arg1_3 ~= 32 then
			var6 = true
			if arg1_3 ~= 9 then
				if arg1_3 ~= 13 then
					var6 = false
				else
					var6 = true
				end
			end
		end
		return var6
	end
	local function _(arg1_4) -- Line 329, Named "is_digit"
		local var7 = false
		if 48 <= arg1_4 then
			if arg1_4 > 57 then
				var7 = false
			else
				var7 = true
			end
		end
		return var7
	end
	local function is_alpha_upvr(arg1_5) -- Line 333, Named "is_alpha"
		local var8
		local function INLINED() -- Internal function, doesn't exist in bytecode
			var8 = true
			return arg1_5 > 122
		end
		local function INLINED_2() -- Internal function, doesn't exist in bytecode
			var8 = true
			return arg1_5 > 90
		end
		local function INLINED_3() -- Internal function, doesn't exist in bytecode
			var8 = true
			return arg1_5 ~= 95
		end
		if 97 > arg1_5 or INLINED() or 65 > arg1_5 or INLINED_2() or INLINED_3() then
			if arg1_5 ~= 64 then
				var8 = false
			else
				var8 = true
			end
		end
		return var8
	end
	local function string_backslash_upvr() -- Line 340, Named "string_backslash"
		--[[ Upvalues[4]:
			[1]: var1_upvw (read and write)
			[2]: buffer_len_result1_upvr (readonly)
			[3]: arg1 (readonly)
			[4]: var2_upvw (read and write)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		-- KONSTANTERROR: [0] 1. Error Block 63 start (CF ANALYSIS FAILED)
		local var12
		if var1_upvw == buffer_len_result1_upvr then
			var12 = 0
		else
			var12 = buffer.readu8(arg1, var1_upvw)
		end
		-- KONSTANTERROR: [0] 1. Error Block 63 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [41] 32. Error Block 11 start (CF ANALYSIS FAILED)
		var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
		var2_upvw += 1
		do
			return
		end
		-- KONSTANTERROR: [41] 32. Error Block 11 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [54] 43. Error Block 74 start (CF ANALYSIS FAILED)
		local var13 = 122
		if var12 == var13 then
			var13 = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			var1_upvw = var13
			if var1_upvw == buffer_len_result1_upvr then
				local _ = 0
			else
			end
			var13 = true
			if buffer.readu8(arg1, var1_upvw) ~= 32 then
				var13 = true
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				if buffer.readu8(arg1, var1_upvw) ~= 9 then
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					if buffer.readu8(arg1, var1_upvw) ~= 13 then
						var13 = false
					else
						var13 = true
					end
				end
			end
			if var13 then
				if var1_upvw == buffer_len_result1_upvr then
					var13 = 0
				else
					var13 = buffer.readu8(arg1, var1_upvw)
				end
				if var13 == 10 then
					var13 = var2_upvw
					var13 += 1
					var2_upvw = var13
				end
				var13 = math.min(var1_upvw + 1, buffer_len_result1_upvr)
				var1_upvw = var13
				if var1_upvw == buffer_len_result1_upvr then
					var13 = 0
				else
					var13 = buffer.readu8(arg1, var1_upvw)
				end
				-- KONSTANTWARNING: GOTO [66] #52
			end
		else
			if var1_upvw == buffer_len_result1_upvr then
				var13 = 0
			else
				var13 = buffer.readu8(arg1, var1_upvw)
			end
			if var13 == 10 then
				var13 = var2_upvw
				var13 += 1
				var2_upvw = var13
			end
			var13 = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			var1_upvw = var13
			if var1_upvw == buffer_len_result1_upvr then
				var13 = 0
				return
			end
			var13 = buffer.readu8(arg1, var1_upvw)
		end
		-- KONSTANTERROR: [54] 43. Error Block 74 end (CF ANALYSIS FAILED)
	end
	local function quoted_string_upvr() -- Line 361, Named "quoted_string"
		--[[ Upvalues[4]:
			[1]: var1_upvw (read and write)
			[2]: buffer_len_result1_upvr (readonly)
			[3]: arg1 (readonly)
			[4]: string_backslash_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var15
		if var15 == buffer_len_result1_upvr then
			local _ = 0
		else
			var15 = arg1
		end
		var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
		if var1_upvw == buffer_len_result1_upvr then
			var15 = 0
		else
			var15 = buffer.readu8(arg1, var1_upvw)
		end
		while var15 ~= buffer.readu8(var15, var1_upvw) do
			if buffer_len_result1_upvr <= var1_upvw then
				error("expected string to be finished at", 0)
			end
			if false then break end
			if var15 == 0 or var15 == 10 or var15 == 13 then
				return "error"
			end
			if var15 == 92 then
				var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
				string_backslash_upvr()
			else
				var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			end
			if var1_upvw == buffer_len_result1_upvr then
				var15 = 0
			else
				var15 = buffer.readu8(arg1, var1_upvw)
			end
		end
		var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
		return "string"
	end
	local function number_upvr() -- Line 384, Named "number"
		--[[ Upvalues[4]:
			[1]: var1_upvw (read and write)
			[2]: buffer_len_result1_upvr (readonly)
			[3]: arg1 (readonly)
			[4]: is_alpha_upvr (readonly)
		]]
		local var17 = var1_upvw
		local var18 = 10
		local var19
		if var1_upvw == buffer_len_result1_upvr then
			var19 = 0
		else
			var19 = buffer.readu8(arg1, var1_upvw)
		end
		if var19 == 48 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			if var1_upvw == buffer_len_result1_upvr then
				var19 = 0
			else
				var19 = buffer.readu8(arg1, var1_upvw)
			end
			if var19 == 120 or var19 == 88 then
				var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
				if var1_upvw == buffer_len_result1_upvr then
					var19 = 0
				else
					var19 = buffer.readu8(arg1, var1_upvw)
				end
				var18 = 16
			elseif var19 == 98 or var19 == 66 then
				var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
				if var1_upvw == buffer_len_result1_upvr then
					var19 = 0
				else
					var19 = buffer.readu8(arg1, var1_upvw)
				end
				var18 = 2
			end
		end
		while true do
			local var20 = var19
			local var21 = false
			if 48 <= var20 then
				if var20 > 57 then
					var21 = false
				else
					var21 = true
				end
			end
			if var21 or var19 == 46 or var19 ~= 95 then break end
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			if var1_upvw == buffer_len_result1_upvr then
				var19 = 0
			else
				var19 = buffer.readu8(arg1, var1_upvw)
			end
		end
		local function INLINED_4() -- Internal function, doesn't exist in bytecode
			if var1_upvw == buffer_len_result1_upvr then
				var19 = 0
			else
				var19 = buffer.readu8(arg1, var1_upvw)
			end
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			return var19 == 43
		end
		if var19 == 101 or var19 == 69 or INLINED_4() or var19 == 45 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			if var1_upvw == buffer_len_result1_upvr then
				var19 = 0
			else
				var19 = buffer.readu8(arg1, var1_upvw)
			end
		end
		while true do
			local var22 = var19
			local var23 = false
			if 48 <= var22 then
				if var22 > 57 then
					var23 = false
				else
					var23 = true
				end
			end
			if var23 or is_alpha_upvr(var19) or var19 ~= 95 then break end
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			if var1_upvw == buffer_len_result1_upvr then
				var19 = 0
			else
				var19 = buffer.readu8(arg1, var1_upvw)
			end
		end
		local var24
		if var18 == 10 then
			var24 = buffer.readstring(arg1, var17, var1_upvw - var17)
		else
			var24 = buffer.readstring(arg1, var17 + 2, var1_upvw - var17 - 2)
		end
		if tonumber(string.gsub(var24, '_', ""), var18) then
			return "number"
		end
		return "error"
	end
	local function read_kind_upvr() -- Line 433, Named "read_kind"
		--[[ Upvalues[8]:
			[1]: var1_upvw (read and write)
			[2]: buffer_len_result1_upvr (readonly)
			[3]: arg1 (readonly)
			[4]: var2_upvw (read and write)
			[5]: is_alpha_upvr (readonly)
			[6]: number_upvr (readonly)
			[7]: quoted_string_upvr (readonly)
			[8]: read_kind_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var42
		if var1_upvw == buffer_len_result1_upvr then
			var42 = 0
		else
			var42 = buffer.readu8(arg1, var1_upvw)
		end
		if var42 == 0 then
			return "eof"
		end
		if var42 == 35 then
			while true do
				local var43
				if var42 == var43 then break end
				if var42 == 0 then break end
				if var1_upvw == buffer_len_result1_upvr then
					var43 = 0
				else
					var43 = buffer.readu8(arg1, var1_upvw)
				end
				if var43 == 10 then
					var43 = var2_upvw
					var43 += 1
					var2_upvw = var43
				end
				var43 = math.min(var1_upvw + 1, buffer_len_result1_upvr)
				var1_upvw = var43
				if var1_upvw == buffer_len_result1_upvr then
					var43 = 0
				else
					var43 = buffer.readu8(arg1, var1_upvw)
				end
			end
			return "comment"
		end
		local var44 = var42
		local var45 = true
		if var44 ~= 32 then
			var45 = true
			if var44 ~= 9 then
				if var44 ~= 13 then
					var45 = false
				else
					var45 = true
				end
			end
		end
		if var45 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			return "whitespace"
		end
		if is_alpha_upvr(var42) then
			local var46 = var1_upvw
			while true do
				var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
				if var1_upvw == buffer_len_result1_upvr then
					var42 = 0
				else
					var42 = buffer.readu8(arg1, var1_upvw)
				end
				if not is_alpha_upvr(var42) then
					local var47 = var42
					local var48 = false
					if 48 <= var47 then
						if var47 > 57 then
							var48 = false
						else
							var48 = true
						end
					end
					if var48 or var42 ~= 45 then break end
				end
			end
			local buffer_readstring_result1 = buffer.readstring(arg1, var46, var1_upvw - var46)
			if buffer_readstring_result1 == "true" then
				return "true"
			end
			if buffer_readstring_result1 == "false" then
				return "false"
			end
			if buffer_readstring_result1 == "nil" then
				return "nil"
			end
			if buffer_readstring_result1 == "return" then
				return "return"
			end
			if buffer_readstring_result1 == "for" then
				return "for"
			end
			if buffer_readstring_result1 == "while" then
				return "while"
			end
			if buffer_readstring_result1 == "if" then
				return "if"
			end
			if buffer_readstring_result1 == "else" then
				return "else"
			end
			if buffer_readstring_result1 == "break" then
				return "break"
			end
			if buffer_readstring_result1 == "continue" then
				return "continue"
			end
			return "identifier"
		end
		local var50 = var42
		var46 = false
		local var51 = var46
		if 48 <= var50 then
			if var50 > 57 then
				var51 = false
			else
				var51 = true
			end
		end
		if var51 then
			return number_upvr()
		end
		if var42 == 34 then
			return quoted_string_upvr()
		end
		if var42 == 39 then
			return quoted_string_upvr()
		end
		if var42 == 46 then
			if var1_upvw == buffer_len_result1_upvr then
			else
			end
			local buffer_readu8_result1_3 = buffer.readu8(arg1, var1_upvw)
			if 48 <= buffer_readu8_result1_3 then
				if buffer_readu8_result1_3 > 57 then
				else
				end
			end
			if true then
				var1_upvw -= 1
				return number_upvr()
			end
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			return '.'
		end
		if buffer.readu8(arg1, var1_upvw) == 61 then
			local minimum_2 = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			var1_upvw = minimum_2
			if var1_upvw == buffer_len_result1_upvr then
				minimum_2 = 0
			else
				minimum_2 = buffer.readu8(arg1, var1_upvw)
			end
			if minimum_2 == 61 then
				return "=="
			end
			return '='
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 126 then
			local minimum = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			var1_upvw = minimum
			if var1_upvw == buffer_len_result1_upvr then
				minimum = 0
			else
				minimum = buffer.readu8(arg1, var1_upvw)
			end
			if minimum == 61 then
				return "~="
			end
			has_error = true -- Setting global
			return "error"
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 62 then
			local minimum_4 = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			var1_upvw = minimum_4
			if var1_upvw == buffer_len_result1_upvr then
				minimum_4 = 0
			else
				minimum_4 = buffer.readu8(arg1, var1_upvw)
			end
			if minimum_4 == 61 then
				return ">="
			end
			return '>'
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 60 then
			local minimum_5 = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			var1_upvw = minimum_5
			if var1_upvw == buffer_len_result1_upvr then
				minimum_5 = 0
			else
				minimum_5 = buffer.readu8(arg1, var1_upvw)
			end
			if minimum_5 == 61 then
				return "<="
			end
			return '<'
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 36 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			return '$'
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 40 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			return '('
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 41 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			return ')'
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 123 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			return '{'
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 125 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			return '}'
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 91 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			return '['
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 93 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			return ']'
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 124 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			return '|'
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 10 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			return '\n'
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 59 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			return ';'
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 44 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			return ','
		end
		local buffer_readu8_result1_4 = buffer.readu8(arg1, var1_upvw)
		local var58 = true
		if buffer_readu8_result1_4 ~= 32 then
			var58 = true
			if buffer_readu8_result1_4 ~= 9 then
				if buffer_readu8_result1_4 ~= 13 then
					var58 = false
				else
					var58 = true
				end
			end
		end
		if var58 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvr)
			return read_kind_upvr()
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		error(`no symbol matching {string.char(buffer.readu8(arg1, var1_upvw))}`, 0)
		return "error"
	end
	local function next_token_upvr() -- Line 573, Named "next_token"
		--[[ Upvalues[3]:
			[1]: var1_upvw (read and write)
			[2]: read_kind_upvr (readonly)
			[3]: arg1 (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var59
		while not (var59 == "whitespace" or var59 ~= "comment") do
			local var60 = var1_upvw
			var59 = read_kind_upvr()
		end
		return {
			kind = var59;
			text = buffer.readstring(arg1, var60, var1_upvw - var60);
			span = vector.create(var60, var1_upvw, 0);
		}
	end
	local next_token_result1_upvw = next_token_upvr()
	local kind_upvw = next_token_result1_upvw.kind
	local x_upvw = next_token_result1_upvw.span.x
	local next_token_result1_upvw_2 = next_token_upvr()
	local kind_4_upvw = next_token_result1_upvw_2.kind
	local x_upvw_2 = next_token_result1_upvw_2.span.x
	local function _() -- Line 596, Named "consume"
		--[[ Upvalues[7]:
			[1]: next_token_result1_upvw (read and write)
			[2]: kind_upvw (read and write)
			[3]: next_token_result1_upvw_2 (read and write)
			[4]: kind_4_upvw (read and write)
			[5]: x_upvw (read and write)
			[6]: x_upvw_2 (read and write)
			[7]: next_token_upvr (readonly)
		]]
		next_token_result1_upvw = next_token_result1_upvw_2
		kind_upvw = kind_4_upvw
		x_upvw = x_upvw_2
		next_token_result1_upvw_2 = next_token_upvr()
		kind_4_upvw = next_token_result1_upvw_2.kind
		x_upvw_2 = next_token_result1_upvw_2.span.x
		return next_token_result1_upvw, kind_upvw
	end
	local function _(arg1_6) -- Line 606, Named "current_is"
		--[[ Upvalues[7]:
			[1]: kind_upvw (read and write)
			[2]: next_token_result1_upvw (read and write)
			[3]: next_token_result1_upvw_2 (read and write)
			[4]: kind_4_upvw (read and write)
			[5]: x_upvw (read and write)
			[6]: x_upvw_2 (read and write)
			[7]: next_token_upvr (readonly)
		]]
		while true do
			local var68
			if var68 ~= '\n' then break end
			var68 = next_token_result1_upvw
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_upvw = kind_4_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_4_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_upvw ~= arg1_6 then
			var68 = false
		else
			var68 = true
		end
		return var68
	end
	local function _(arg1_7) -- Line 614, Named "lookahead_is"
		--[[ Upvalues[3]:
			[1]: kind_4_upvw (read and write)
			[2]: next_token_result1_upvw_2 (read and write)
			[3]: next_token_upvr (readonly)
		]]
		while true do
			local var69
			if var69 ~= '\n' then break end
			var69 = next_token_upvr()
			next_token_result1_upvw_2 = var69
			var69 = next_token_result1_upvw_2.kind
			kind_4_upvw = var69
		end
		if kind_4_upvw ~= arg1_7 then
			var69 = false
		else
			var69 = true
		end
		return var69
	end
	local function _(arg1_8) -- Line 623, Named "display"
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local kind_7 = arg1_8.kind
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [4] 3. Error Block 2 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [4] 3. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [8] 5. Error Block 4 start (CF ANALYSIS FAILED)
		do
			return kind_7
		end
		-- KONSTANTERROR: [8] 5. Error Block 4 end (CF ANALYSIS FAILED)
	end
	local function report_upvr(arg1_9, arg2_2) -- Line 635, Named "report"
		--[[ Upvalues[1]:
			[1]: next_token_result1_upvw (read and write)
		]]
		local tbl_4 = {}
		tbl_4.message = arg1_9
		local var72 = arg2_2
		if not var72 then
			var72 = next_token_result1_upvw.span
		end
		tbl_4.span = var72
		error(`{tbl_4.message} from {tbl_4.span.x} to {tbl_4.span.y}`, 0)
	end
	local function expect_failure_upvr(arg1_10) -- Line 644, Named "expect_failure"
		--[[ Upvalues[3]:
			[1]: report_upvr (readonly)
			[2]: next_token_result1_upvw (read and write)
			[3]: kind_upvw (read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 35 start (CF ANALYSIS FAILED)
		local tbl = {}
		tbl.kind = arg1_10
		local kind_3 = tbl.kind
		if kind_3 == "identifier" or kind_3 == "number" or kind_3 == "string" then
			-- KONSTANTWARNING: GOTO [30] #23
		end
		-- KONSTANTERROR: [0] 1. Error Block 35 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [15] 11. Error Block 32 start (CF ANALYSIS FAILED)
		if tbl.kind == "error" then
			-- KONSTANTWARNING: GOTO [30] #23
		end
		-- KONSTANTERROR: [15] 11. Error Block 32 end (CF ANALYSIS FAILED)
	end
	local function expect_upvr(arg1_11) -- Line 654, Named "expect"
		--[[ Upvalues[9]:
			[1]: kind_upvw (read and write)
			[2]: next_token_result1_upvw (read and write)
			[3]: next_token_result1_upvw_2 (read and write)
			[4]: kind_4_upvw (read and write)
			[5]: x_upvw (read and write)
			[6]: x_upvw_2 (read and write)
			[7]: next_token_upvr (readonly)
			[8]: arg2 (readonly)
			[9]: expect_failure_upvr (readonly)
		]]
		while true do
			local var81
			if kind_upvw ~= '\n' then break end
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_upvw = kind_4_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_4_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_upvw ~= arg1_11 then
			var81 = false
		else
			var81 = true
		end
		if var81 then
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_upvw = kind_4_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_4_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
			var81 = next_token_result1_upvw
			return var81
		end
		var81 = kind_upvw
		if var81 == "eof" then
			var81 = arg2
			local var82
			if var81 then
				var81 = yield
				var81()
				while kind_upvw == '\n' do
					var82 = kind_4_upvw
					next_token_result1_upvw = next_token_result1_upvw_2
					kind_upvw = var82
					x_upvw = x_upvw_2
					next_token_result1_upvw_2 = next_token_upvr()
					var82 = next_token_result1_upvw_2
					kind_4_upvw = var82.kind
					var82 = next_token_result1_upvw_2.span
					x_upvw_2 = var82.x
				end
				if kind_upvw ~= arg1_11 then
					-- KONSTANTWARNING: GOTO [92] #78
				end
				if true then
					next_token_result1_upvw = next_token_result1_upvw_2
					kind_upvw = kind_4_upvw
					x_upvw = x_upvw_2
					next_token_result1_upvw_2 = next_token_upvr()
					kind_4_upvw = next_token_result1_upvw_2.kind
					var82 = next_token_result1_upvw_2
					x_upvw_2 = var82.span.x
					var81 = next_token_result1_upvw
					return var81
				end
				var82 = {}
				var82.kind = arg1_11
				local kind_5 = var82.kind
				if kind_5 == "identifier" or kind_5 == "number" or kind_5 == "string" then
					-- KONSTANTWARNING: GOTO [145] #120
				end
				if var82.kind == "error" then
					-- KONSTANTWARNING: GOTO [145] #120
				end
				local var84 = next_token_result1_upvw
				local kind_6 = var84.kind
				if kind_6 == "identifier" or kind_6 == "number" or kind_6 == "string" then
					var82 = kind_6
				elseif var84.kind == "error" then
					var82 = "error '"..var84.text.."'"
				else
					var82 = "'"..kind_6.."'"
				end
				local _ = {
					message = `expected {"'"..kind_5.."'"}, but got {var82} of {kind_upvw} instead`;
					span = next_token_result1_upvw.span;
				}
				var82 = `{_.message} from {_.span.x} to {_.span.y}`
				var82 = 0
				error(var82, var82)
				var81 = nil
				return var81
			end
		end
		var81 = expect_failure_upvr(arg1_11)
		return var81
	end
	local parse_expression_upvw
	local parse_command_upvw
	local parse_block_upvw
	local parse_expression_or_command_upvw
	local function parse_var_root_upvw() -- Line 681, Named "parse_var_root"
		--[[ Upvalues[10]:
			[1]: kind_upvw (read and write)
			[2]: next_token_result1_upvw (read and write)
			[3]: next_token_result1_upvw_2 (read and write)
			[4]: kind_4_upvw (read and write)
			[5]: x_upvw (read and write)
			[6]: x_upvw_2 (read and write)
			[7]: next_token_upvr (readonly)
			[8]: expect_upvr (readonly)
			[9]: parse_expression_or_command_upvw (read and write)
			[10]: report_upvr (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 162 start (CF ANALYSIS FAILED)
		while true do
			local var91
			if kind_upvw ~= '\n' then break end
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_upvw = kind_4_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_4_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_upvw ~= "identifier" then
			var91 = false
			-- KONSTANTWARNING: GOTO [30] #26
		end
		-- KONSTANTERROR: [0] 1. Error Block 162 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [29] 25. Error Block 138 start (CF ANALYSIS FAILED)
		var91 = true
		if var91 then
			var91 = expect_upvr("identifier")
			return {
				kind = "global";
				span = var91.span;
				token = var91;
			}
		end
		while kind_upvw == '\n' do
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_upvw = kind_4_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_4_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_upvw ~= '$' then
			var91 = false
		else
			var91 = true
		end
		-- KONSTANTERROR: [29] 25. Error Block 138 end (CF ANALYSIS FAILED)
	end
	local function parse_var_suffix_upvw() -- Line 742, Named "parse_var_suffix"
		--[[ Upvalues[10]:
			[1]: kind_upvw (read and write)
			[2]: next_token_result1_upvw (read and write)
			[3]: next_token_result1_upvw_2 (read and write)
			[4]: kind_4_upvw (read and write)
			[5]: x_upvw (read and write)
			[6]: x_upvw_2 (read and write)
			[7]: next_token_upvr (readonly)
			[8]: expect_upvr (readonly)
			[9]: parse_expression_or_command_upvw (read and write)
			[10]: report_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		while true do
			local var93
			if kind_upvw ~= '\n' then break end
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_upvw = kind_4_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_4_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		local var94
		if var94 ~= '.' then
			var93 = false
		else
			var93 = true
		end
		if var93 then
			var93 = expect_upvr
			var94 = '.'
			var93 = var93(var94)
			while kind_upvw == '\n' do
				next_token_result1_upvw = next_token_result1_upvw_2
				kind_upvw = kind_4_upvw
				x_upvw = x_upvw_2
				next_token_result1_upvw_2 = next_token_upvr()
				kind_4_upvw = next_token_result1_upvw_2.kind
				x_upvw_2 = next_token_result1_upvw_2.span.x
			end
			if kind_upvw ~= "identifier" then
				var94 = false
			else
				var94 = true
			end
			if var94 == false then
				var94 = {}
				local var95 = var94
				var95.kind = "nameindex"
				var95.span = vector.create(var93.span.x, var93.span.y, 0)
				var95.operator = var93
				return var95
			end
			var95 = expect_upvr("identifier")
			local var96 = var95
			return {
				kind = "nameindex";
				span = vector.create(var93.span.x, var96.span.y, 0);
				operator = var93;
				name = var96;
			}
		end
		while true do
			var96 = kind_upvw
			if var96 ~= '\n' then break end
			var96 = next_token_result1_upvw
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_upvw = kind_4_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_4_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		var96 = kind_upvw
		if var96 ~= '[' then
			var93 = false
		else
			var93 = true
		end
		if var93 then
			var93 = expect_upvr
			var96 = '['
			var93 = var93(var96)
			var96 = kind_upvw
			if var96 == "eof" then
				var96 = {}
				local var98 = var96
				var98.kind = "exprindex"
				var98.span = vector.create(var93.span.x, var93.span.y, 0)
				var98.expr = {
					left = var93;
				}
				return var98
			end
			var98 = parse_expression_or_command_upvw()
			local var100 = var98
			if kind_upvw ~= ']' then
				return {
					kind = "exprindex";
					span = vector.create(var93.span.x, var100.span.y, 0);
					expr = {
						left = var93;
						value = var100;
					};
				}
			end
			local expect_upvr_result1 = expect_upvr(']')
			return {
				kind = "exprindex";
				span = vector.create(var93.span.x, expect_upvr_result1.span.y, 0);
				expr = {
					left = var93;
					right = expect_upvr_result1;
					value = var100;
				};
			}
		end
		var93 = report_upvr
		var100 = "invalid"
		var93 = var93(var100)
		return var93
	end
	local function parse_var_suffixes_upvw() -- Line 793, Named "parse_var_suffixes"
		--[[ Upvalues[8]:
			[1]: kind_upvw (read and write)
			[2]: next_token_result1_upvw (read and write)
			[3]: next_token_result1_upvw_2 (read and write)
			[4]: kind_4_upvw (read and write)
			[5]: x_upvw (read and write)
			[6]: x_upvw_2 (read and write)
			[7]: next_token_upvr (readonly)
			[8]: parse_var_suffix_upvw (read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [64] 54. Error Block 20 start (CF ANALYSIS FAILED)
		table.insert({}, parse_var_suffix_upvw())
		-- KONSTANTERROR: [64] 54. Error Block 20 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [2] 2. Error Block 28 start (CF ANALYSIS FAILED)
		if table.insert({}, parse_var_suffix_upvw()) == '\n' then
			-- KONSTANTWARNING: GOTO [2] #2
		end
		-- KONSTANTERROR: [2] 2. Error Block 28 end (CF ANALYSIS FAILED)
	end
	local function parse_var_upvw() -- Line 802, Named "parse_var"
		--[[ Upvalues[2]:
			[1]: parse_var_root_upvw (read and write)
			[2]: parse_var_suffixes_upvw (read and write)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local parse_var_root_upvw_result1 = parse_var_root_upvw()
		local var107
		if parse_var_root_upvw_result1.kind ~= "global" then
			var107 = parse_var_suffixes_upvw()
		else
			var107 = {}
		end
		local span = parse_var_root_upvw_result1.span
		if 0 < #var107 then
		else
		end
		return {
			span = vector.create(span.x, parse_var_root_upvw_result1.span.y, 0);
			prefix = parse_var_root_upvw_result1;
			suffixes = var107;
		}
	end
	function parse_expression_or_command_upvw() -- Line 820, Named "parse_expression_or_command"
		--[[ Upvalues[9]:
			[1]: kind_upvw (read and write)
			[2]: next_token_result1_upvw (read and write)
			[3]: next_token_result1_upvw_2 (read and write)
			[4]: kind_4_upvw (read and write)
			[5]: x_upvw (read and write)
			[6]: x_upvw_2 (read and write)
			[7]: next_token_upvr (readonly)
			[8]: parse_command_upvw (read and write)
			[9]: parse_expression_upvw (read and write)
		]]
		while true do
			local var111
			if kind_upvw ~= '\n' then break end
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_upvw = kind_4_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_4_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_upvw ~= "identifier" then
			var111 = false
		else
			var111 = true
		end
		if var111 then
			var111 = parse_command_upvw()
			return var111
		end
		var111 = parse_expression_upvw()
		return var111
	end
	local var110_upvw = parse_expression_or_command_upvw
	local function parse_function_body_upvw() -- Line 828, Named "parse_function_body"
		--[[ Upvalues[9]:
			[1]: expect_upvr (readonly)
			[2]: kind_upvw (read and write)
			[3]: next_token_result1_upvw (read and write)
			[4]: next_token_result1_upvw_2 (read and write)
			[5]: kind_4_upvw (read and write)
			[6]: x_upvw (read and write)
			[7]: x_upvw_2 (read and write)
			[8]: next_token_upvr (readonly)
			[9]: parse_block_upvw (read and write)
		]]
		-- KONSTANTERROR: [82] 71. Error Block 20 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [82] 71. Error Block 20 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 126 start (CF ANALYSIS FAILED)
		repeat
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [82.4]
		until nil ~= '\n'
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if nil ~= '|' then
		else
		end
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [82.3]
		if not nil then
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [82.2]
			if not nil then
			end
			repeat
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			until nil ~= '\n'
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if nil ~= "identifier" then
			else
			end
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if nil then
				-- KONSTANTWARNING: GOTO [6] #6
			end
			-- KONSTANTWARNING: GOTO [84] #73
		end
		-- KONSTANTERROR: [0] 1. Error Block 126 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [84] 73. Error Block 125 start (CF ANALYSIS FAILED)
		while kind_upvw == '\n' do
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_upvw = kind_4_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_4_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_upvw ~= '|' then
			-- KONSTANTWARNING: GOTO [114] #98
		end
		-- KONSTANTERROR: [84] 73. Error Block 125 end (CF ANALYSIS FAILED)
	end
	local function parse_lambda_upvw() -- Line 866, Named "parse_lambda"
		--[[ Upvalues[1]:
			[1]: parse_function_body_upvw (read and write)
		]]
		local parse_function_body_result1 = parse_function_body_upvw()
		return {
			kind = "lambda";
			body = parse_function_body_result1;
			span = parse_function_body_result1.span;
		}
	end
	function parse_table() -- Line 875
		--[[ Upvalues[9]:
			[1]: expect_upvr (readonly)
			[2]: kind_upvw (read and write)
			[3]: next_token_result1_upvw (read and write)
			[4]: next_token_result1_upvw_2 (read and write)
			[5]: kind_4_upvw (read and write)
			[6]: x_upvw (read and write)
			[7]: x_upvw_2 (read and write)
			[8]: next_token_upvr (readonly)
			[9]: parse_expression_upvw (read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local var114
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [399] 303. Error Block 78 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [399] 303. Error Block 78 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [6] 6. Error Block 148 start (CF ANALYSIS FAILED)
		repeat
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [399.4]
		until nil ~= '\n'
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if nil ~= '}' then
		else
		end
		-- KONSTANTERROR: [6] 6. Error Block 148 end (CF ANALYSIS FAILED)
	end
	local function parse_vector_upvw() -- Line 977, Named "parse_vector"
		--[[ Upvalues[9]:
			[1]: expect_upvr (readonly)
			[2]: kind_upvw (read and write)
			[3]: next_token_result1_upvw (read and write)
			[4]: next_token_result1_upvw_2 (read and write)
			[5]: kind_4_upvw (read and write)
			[6]: x_upvw (read and write)
			[7]: x_upvw_2 (read and write)
			[8]: next_token_upvr (readonly)
			[9]: parse_expression_upvw (read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local _ = expect_upvr('[')
		local var116
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [115] 94. Error Block 91 start (CF ANALYSIS FAILED)
		while kind_upvw == '\n' do
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_upvw = kind_4_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_4_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_upvw ~= "eof" then
			var116 = false
		else
			var116 = true
		end
		if var116 then
			-- KONSTANTWARNING: GOTO [155] #127
		end
		local var117 = 0 + 1
		var116 = parse_expression_upvw()
		;({})[var117] = var116
		-- KONSTANTERROR: [115] 94. Error Block 91 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [14] 10. Error Block 2 start (CF ANALYSIS FAILED)
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [154.67579]
		-- KONSTANTERROR: [14] 10. Error Block 2 end (CF ANALYSIS FAILED)
	end
	function parse_expression_upvw() -- Line 1009, Named "parse_expression"
		--[[ Upvalues[14]:
			[1]: kind_upvw (read and write)
			[2]: next_token_result1_upvw (read and write)
			[3]: next_token_result1_upvw_2 (read and write)
			[4]: kind_4_upvw (read and write)
			[5]: x_upvw (read and write)
			[6]: x_upvw_2 (read and write)
			[7]: next_token_upvr (readonly)
			[8]: expect_upvr (readonly)
			[9]: parse_command_upvw (read and write)
			[10]: var118_upvw (read and write)
			[11]: parse_var_upvw (read and write)
			[12]: parse_lambda_upvw (read and write)
			[13]: parse_vector_upvw (read and write)
			[14]: report_upvr (readonly)
		]]
		-- KONSTANTERROR: Failed to generate AST for function `parse_expression`:
runluau:5427: assertion failed!
Traceback:
runluau:5427 function get_guaranteed_destinations
runluau:5469 function will_reach_block
runluau:5479 function will_reach_block
runluau:5479 function will_reach_block
runluau:5479 function will_reach_block
runluau:5918 function astgen
runluau:8357 function astgen_protected
runluau:4639 function expr_function
runluau:7714 function NEWCLOSURE
runluau:7954 function gen_from_insts
runluau:8053 function gen_from_hl_block
runluau:8340 function astgen
runluau:8357 function astgen_protected
runluau:4639 function expr_function
runluau:7707 function DUPCLOSURE
runluau:7954 function gen_from_insts
runluau:8053 function gen_from_hl_block
runluau:8340 function astgen
runluau:8357 function astgen_protected
runluau:8418 function decompile_bytecode
runluau:11983 function wrapped
runluau:11991
runluau:12015 function _decompile
runluau:12181 function decompile
runluau:12377

	end
	local var118_upvw = parse_expression_upvw
	function parse_command_upvw() -- Line 1100, Named "parse_command"
		--[[ Upvalues[9]:
			[1]: parse_var_upvw (read and write)
			[2]: kind_upvw (read and write)
			[3]: next_token_result1_upvw (read and write)
			[4]: next_token_result1_upvw_2 (read and write)
			[5]: kind_4_upvw (read and write)
			[6]: x_upvw (read and write)
			[7]: x_upvw_2 (read and write)
			[8]: next_token_upvr (readonly)
			[9]: var118_upvw (read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [286] 240. Error Block 85 start (CF ANALYSIS FAILED)
		table.insert({}, var118_upvw())
		-- KONSTANTERROR: [286] 240. Error Block 85 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [4] 4. Error Block 2 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		-- KONSTANTERROR: [4] 4. Error Block 2 end (CF ANALYSIS FAILED)
	end
	local var119_upvw = parse_command_upvw
	local function parse_if_upvw() -- Line 1135, Named "parse_if"
		--[[ Upvalues[11]:
			[1]: expect_upvr (readonly)
			[2]: kind_upvw (read and write)
			[3]: next_token_result1_upvw (read and write)
			[4]: next_token_result1_upvw_2 (read and write)
			[5]: kind_4_upvw (read and write)
			[6]: x_upvw (read and write)
			[7]: x_upvw_2 (read and write)
			[8]: next_token_upvr (readonly)
			[9]: var119_upvw (read and write)
			[10]: var118_upvw (read and write)
			[11]: parse_block_upvw (read and write)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local var120
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [651] 536. Error Block 165 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [651] 536. Error Block 165 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [5] 5. Error Block 341 start (CF ANALYSIS FAILED)
		if true then
			repeat
				-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [651.7]
			until nil ~= '\n'
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if nil ~= '(' then
				-- KONSTANTWARNING: GOTO [40] #35
			end
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [651.6]
			if nil then
			else
			end
			repeat
				-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [651.8]
			until nil ~= '\n'
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if nil ~= "identifier" then
				-- KONSTANTWARNING: GOTO [76] #66
			end
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if nil then
			else
			end
			repeat
				-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [651.9]
			until nil ~= '\n'
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if nil ~= ')' then
				-- KONSTANTWARNING: GOTO [112] #97
			end
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if nil then
			else
			end
			repeat
				-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [651.10]
			until nil ~= '\n'
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if nil ~= '{' then
				-- KONSTANTWARNING: GOTO [148] #128
			end
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if nil then
			else
			end
			repeat
				-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [651.12]
			until nil ~= '\n'
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if nil ~= '}' then
				-- KONSTANTWARNING: GOTO [187] #162
			end
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [651.11]
			if nil then
			else
			end
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if nil then
			else
			end
			-- KONSTANTWARNING: GOTO [651] #536
		end
		-- KONSTANTERROR: [5] 5. Error Block 341 end (CF ANALYSIS FAILED)
	end
	local function parse_while_upvw() -- Line 1231, Named "parse_while"
		--[[ Upvalues[11]:
			[1]: expect_upvr (readonly)
			[2]: kind_upvw (read and write)
			[3]: next_token_result1_upvw (read and write)
			[4]: next_token_result1_upvw_2 (read and write)
			[5]: kind_4_upvw (read and write)
			[6]: x_upvw (read and write)
			[7]: x_upvw_2 (read and write)
			[8]: next_token_upvr (readonly)
			[9]: var119_upvw (read and write)
			[10]: var118_upvw (read and write)
			[11]: parse_block_upvw (read and write)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local expect_upvr_result1_4 = expect_upvr("while")
		local var122
		while kind_upvw == '\n' do
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_upvw = kind_4_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_4_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_upvw ~= '(' then
			-- KONSTANTWARNING: GOTO [33] #29
		end
		if true then
			var122 = expect_upvr('(')
		else
			var122 = nil
		end
		while kind_upvw == '\n' do
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_upvw = kind_4_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_4_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_upvw ~= "identifier" then
			-- KONSTANTWARNING: GOTO [69] #60
		end
		if true then
		else
		end
		while kind_upvw == '\n' do
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_upvw = kind_4_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_4_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_upvw ~= ')' then
			-- KONSTANTWARNING: GOTO [105] #91
		end
		if true then
		else
		end
		while kind_upvw == '\n' do
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_upvw = kind_4_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_4_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_upvw ~= '{' then
			-- KONSTANTWARNING: GOTO [141] #122
		end
		if true then
		else
		end
		local parse_block_result1 = parse_block_upvw('}')
		while kind_upvw == '\n' do
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_upvw = kind_4_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_4_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_upvw ~= '}' then
			-- KONSTANTWARNING: GOTO [180] #156
		end
		if true then
			local _ = expect_upvr('}')
		else
		end
		local module_4 = {
			kind = "while";
			keyword = expect_upvr_result1_4;
			expression = {
				left = var122;
				right = nil;
				value = var118_upvw();
			};
			block = {
				left = nil;
				right = nil;
				value = parse_block_result1;
			};
		}
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if nil then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		else
		end
		module_4.span = vector.create(expect_upvr_result1_4.span.x, parse_block_result1.span.y, 0)
		return module_4
	end
	local function parse_for_upvw() -- Line 1258, Named "parse_for"
		--[[ Upvalues[10]:
			[1]: expect_upvr (readonly)
			[2]: kind_upvw (read and write)
			[3]: next_token_result1_upvw (read and write)
			[4]: next_token_result1_upvw_2 (read and write)
			[5]: kind_4_upvw (read and write)
			[6]: x_upvw (read and write)
			[7]: x_upvw_2 (read and write)
			[8]: next_token_upvr (readonly)
			[9]: var110_upvw (read and write)
			[10]: parse_function_body_upvw (read and write)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local expect_upvr_result1_3 = expect_upvr("for")
		local var129
		while kind_upvw == '\n' do
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_upvw = kind_4_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_4_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_upvw ~= '(' then
			-- KONSTANTWARNING: GOTO [33] #29
		end
		if true then
			var129 = expect_upvr('(')
		else
			var129 = nil
		end
		local var110_upvw_result1 = var110_upvw()
		while kind_upvw == '\n' do
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_upvw = kind_4_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_4_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_upvw ~= ')' then
			-- KONSTANTWARNING: GOTO [71] #62
		end
		if true then
			local _ = expect_upvr(')')
		else
		end
		while kind_upvw == '\n' do
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_upvw = kind_4_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_4_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_upvw ~= '|' then
			-- KONSTANTWARNING: GOTO [107] #93
		end
		if true then
			local _ = parse_function_body_upvw()
		else
		end
		local module_3 = {
			kind = "for";
			keyword = expect_upvr_result1_3;
			expression = {
				left = var129;
				right = nil;
				value = var110_upvw_result1;
			};
			call = nil;
		}
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if nil then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		else
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if nil then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			else
			end
		end
		module_3.span = vector.create(expect_upvr_result1_3.span.x, var110_upvw_result1.span.y, 0)
		return module_3
	end
	local function parse_return_upvw() -- Line 1281, Named "parse_return"
		--[[ Upvalues[3]:
			[1]: expect_upvr (readonly)
			[2]: kind_upvw (read and write)
			[3]: var118_upvw (read and write)
		]]
		local expect_upvr_result1_2 = expect_upvr("return")
		local tbl_2 = {}
		local var137
		while kind_upvw ~= '}' and kind_upvw ~= "eof" do
			if 0 < #tbl_2 then
				expect_upvr(',')
			end
			local var118_result1 = var118_upvw()
			table.insert(tbl_2, var118_result1)
			var137 = var118_result1.span.y
		end
		return {
			kind = "return";
			values = tbl_2;
			keyword = expect_upvr_result1_2;
			span = vector.create(expect_upvr_result1_2.span.x, var137, 0);
		}
	end
	function parse_block_upvw(arg1_12, arg2_3) -- Line 1302, Named "parse_block"
		--[[ Upvalues[14]:
			[1]: x_upvw (read and write)
			[2]: kind_upvw (read and write)
			[3]: next_token_result1_upvw (read and write)
			[4]: next_token_result1_upvw_2 (read and write)
			[5]: kind_4_upvw (read and write)
			[6]: x_upvw_2 (read and write)
			[7]: next_token_upvr (readonly)
			[8]: expect_upvr (readonly)
			[9]: var110_upvw (read and write)
			[10]: parse_if_upvw (read and write)
			[11]: parse_while_upvw (read and write)
			[12]: parse_for_upvw (read and write)
			[13]: parse_return_upvw (read and write)
			[14]: var119_upvw (read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 116 start (CF ANALYSIS FAILED)
		local var140 = arg2_3
		if not var140 then
			var140 = x_upvw
		end
		-- KONSTANTERROR: [0] 1. Error Block 116 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [537] 433. Error Block 112 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [537] 433. Error Block 112 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [7] 7. Error Block 4 start (CF ANALYSIS FAILED)
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [538.6]
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [538.2557666]
		-- KONSTANTERROR: [7] 7. Error Block 4 end (CF ANALYSIS FAILED)
	end
	return parse_block_upvw("eof")
end
return function(arg1) -- Line 1387, Named "generate"
	--[[ Upvalues[1]:
		[1]: parse_upvr (readonly)
	]]
	local var141_upvw = arg1
	local coroutine_create_result1_upvr = coroutine.create(parse_upvr)
	local get_result_upvw
	function get_result_upvw(arg1_14, arg2) -- Line 1398, Named "get_result"
		--[[ Upvalues[2]:
			[1]: var141_upvw (read and write)
			[2]: coroutine_create_result1_upvr (readonly)
		]]
		if arg1_14 == false then
			local module_2 = {
				status = "error";
				src = var141_upvw;
			}
			module_2.why = arg2
			return module_2
		end
		if coroutine.status(coroutine_create_result1_upvr) == "dead" then
			local module = {
				status = "finished";
				src = var141_upvw;
			}
			module.value = arg2
			return module
		end
		error('?')
	end
	return (function(arg1_13) -- Line 1392, Named "overwrite"
		--[[ Upvalues[3]:
			[1]: var141_upvw (read and write)
			[2]: get_result_upvw (read and write)
			[3]: coroutine_create_result1_upvr (readonly)
		]]
		var141_upvw = arg1_13
		return get_result_upvw(coroutine.resume(coroutine_create_result1_upvr, buffer.fromstring(arg1_13), yield))
	end)(arg1)
end