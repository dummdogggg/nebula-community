--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_ast.0.2.0.conch_ast.src.lib
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:13
-- Luau version 6, Types version 3
-- Time taken: 0.041193 seconds

local function _(arg1) -- Line 8, Named "char"
	return string.byte(arg1)
end
local function parse_upvr(arg1, arg2) -- Line 13, Named "parse"
	local var1_upvw = 0
	local var2_upvw = 0
	local buffer_len_result1_upvw = buffer.len(arg1)
	local function _() -- Line 18, Named "peek"
		--[[ Upvalues[3]:
			[1]: var1_upvw (read and write)
			[2]: buffer_len_result1_upvw (read and write)
			[3]: arg1 (read and write)
		]]
		if var1_upvw == buffer_len_result1_upvw then
			return 0
		end
		return buffer.readu8(arg1, var1_upvw)
	end
	local function _() -- Line 23, Named "bump"
		--[[ Upvalues[2]:
			[1]: var1_upvw (read and write)
			[2]: buffer_len_result1_upvw (read and write)
		]]
		var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
	end
	local function _() -- Line 25, Named "bump_any"
		--[[ Upvalues[4]:
			[1]: var1_upvw (read and write)
			[2]: buffer_len_result1_upvw (read and write)
			[3]: arg1 (read and write)
			[4]: var2_upvw (read and write)
		]]
		local var4
		if var1_upvw == buffer_len_result1_upvw then
			var4 = 0
		else
			var4 = buffer.readu8(arg1, var1_upvw)
		end
		if var4 == 10 then
			var4 = var2_upvw
			var4 += 1
			var2_upvw = var4
		end
		var4 = math.min(var1_upvw + 1, buffer_len_result1_upvw)
		var1_upvw = var4
		if var1_upvw == buffer_len_result1_upvw then
			var4 = 0
			return var4
		end
		var4 = buffer.readu8(arg1, var1_upvw)
		return var4
	end
	local function _(arg1_2) -- Line 34, Named "eof"
		--[[ Upvalues[2]:
			[1]: var1_upvw (read and write)
			[2]: buffer_len_result1_upvw (read and write)
		]]
		if buffer_len_result1_upvw <= var1_upvw then
			error(arg1_2, 0)
		end
		return false
	end
	local function _() -- Line 39, Named "bump_peek"
		--[[ Upvalues[3]:
			[1]: var1_upvw (read and write)
			[2]: buffer_len_result1_upvw (read and write)
			[3]: arg1 (read and write)
		]]
		var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
		if var1_upvw == buffer_len_result1_upvw then
			return 0
		end
		return buffer.readu8(arg1, var1_upvw)
	end
	local function _(arg1_3) -- Line 44, Named "is_whitespace"
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
	local function _(arg1_4) -- Line 48, Named "is_digit"
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
	local function is_alpha_upvr(arg1_5) -- Line 52, Named "is_alpha"
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
			return arg1_5 ~= 64
		end
		if 97 > arg1_5 or INLINED() or 65 > arg1_5 or INLINED_2() or INLINED_3() then
			if arg1_5 ~= 95 then
				var8 = false
			else
				var8 = true
			end
		end
		return var8
	end
	local function string_backslash_upvr() -- Line 59, Named "string_backslash"
		--[[ Upvalues[4]:
			[1]: var1_upvw (read and write)
			[2]: buffer_len_result1_upvw (read and write)
			[3]: arg1 (read and write)
			[4]: var2_upvw (read and write)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		-- KONSTANTERROR: [0] 1. Error Block 63 start (CF ANALYSIS FAILED)
		local var12
		if var1_upvw == buffer_len_result1_upvw then
			var12 = 0
		else
			var12 = buffer.readu8(arg1, var1_upvw)
		end
		-- KONSTANTERROR: [0] 1. Error Block 63 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [41] 32. Error Block 11 start (CF ANALYSIS FAILED)
		var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
		var2_upvw += 1
		do
			return
		end
		-- KONSTANTERROR: [41] 32. Error Block 11 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [54] 43. Error Block 74 start (CF ANALYSIS FAILED)
		local var13 = 122
		if var12 == var13 then
			var13 = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			var1_upvw = var13
			if var1_upvw == buffer_len_result1_upvw then
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
				if var1_upvw == buffer_len_result1_upvw then
					var13 = 0
				else
					var13 = buffer.readu8(arg1, var1_upvw)
				end
				if var13 == 10 then
					var13 = var2_upvw
					var13 += 1
					var2_upvw = var13
				end
				var13 = math.min(var1_upvw + 1, buffer_len_result1_upvw)
				var1_upvw = var13
				if var1_upvw == buffer_len_result1_upvw then
					var13 = 0
				else
					var13 = buffer.readu8(arg1, var1_upvw)
				end
				-- KONSTANTWARNING: GOTO [66] #52
			end
		else
			if var1_upvw == buffer_len_result1_upvw then
				var13 = 0
			else
				var13 = buffer.readu8(arg1, var1_upvw)
			end
			if var13 == 10 then
				var13 = var2_upvw
				var13 += 1
				var2_upvw = var13
			end
			var13 = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			var1_upvw = var13
			if var1_upvw == buffer_len_result1_upvw then
				var13 = 0
				return
			end
			var13 = buffer.readu8(arg1, var1_upvw)
		end
		-- KONSTANTERROR: [54] 43. Error Block 74 end (CF ANALYSIS FAILED)
	end
	local function quoted_string_upvr() -- Line 80, Named "quoted_string"
		--[[ Upvalues[4]:
			[1]: var1_upvw (read and write)
			[2]: buffer_len_result1_upvw (read and write)
			[3]: arg1 (read and write)
			[4]: string_backslash_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var15
		if var15 == buffer_len_result1_upvw then
			local _ = 0
		else
			var15 = arg1
		end
		var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
		if var1_upvw == buffer_len_result1_upvw then
			var15 = 0
		else
			var15 = buffer.readu8(arg1, var1_upvw)
		end
		while var15 ~= buffer.readu8(var15, var1_upvw) do
			if buffer_len_result1_upvw <= var1_upvw then
				error("unterminated string", 0)
			end
			if false then break end
			if var15 == 0 or var15 == 10 or var15 == 13 then
				has_error = true -- Setting global
				return "error"
			end
			if var15 == 92 then
				var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
				string_backslash_upvr()
			else
				var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			end
			if var1_upvw == buffer_len_result1_upvw then
				var15 = 0
			else
				var15 = buffer.readu8(arg1, var1_upvw)
			end
		end
		var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
		return "string"
	end
	local function number_upvr() -- Line 102, Named "number"
		--[[ Upvalues[4]:
			[1]: var1_upvw (read and write)
			[2]: buffer_len_result1_upvw (read and write)
			[3]: arg1 (read and write)
			[4]: is_alpha_upvr (readonly)
		]]
		local var17 = var1_upvw
		local var18 = 10
		local var19
		if var1_upvw == buffer_len_result1_upvw then
			var19 = 0
		else
			var19 = buffer.readu8(arg1, var1_upvw)
		end
		if var19 == 48 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			if var1_upvw == buffer_len_result1_upvw then
				var19 = 0
			else
				var19 = buffer.readu8(arg1, var1_upvw)
			end
			if var19 == 120 or var19 == 88 then
				var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
				if var1_upvw == buffer_len_result1_upvw then
					var19 = 0
				else
					var19 = buffer.readu8(arg1, var1_upvw)
				end
				var18 = 16
			elseif var19 == 98 or var19 == 66 then
				var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
				if var1_upvw == buffer_len_result1_upvw then
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
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			if var1_upvw == buffer_len_result1_upvw then
				var19 = 0
			else
				var19 = buffer.readu8(arg1, var1_upvw)
			end
		end
		local function INLINED_4() -- Internal function, doesn't exist in bytecode
			if var1_upvw == buffer_len_result1_upvw then
				var19 = 0
			else
				var19 = buffer.readu8(arg1, var1_upvw)
			end
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			return var19 == 43
		end
		if var19 == 101 or var19 == 69 or INLINED_4() or var19 == 45 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			if var1_upvw == buffer_len_result1_upvw then
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
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			if var1_upvw == buffer_len_result1_upvw then
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
		has_error = true -- Setting global
		return "error"
	end
	local function read_kind_upvr() -- Line 152, Named "read_kind"
		--[[ Upvalues[8]:
			[1]: var1_upvw (read and write)
			[2]: buffer_len_result1_upvw (read and write)
			[3]: arg1 (read and write)
			[4]: var2_upvw (read and write)
			[5]: is_alpha_upvr (readonly)
			[6]: number_upvr (readonly)
			[7]: quoted_string_upvr (readonly)
			[8]: read_kind_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var42
		if var1_upvw == buffer_len_result1_upvw then
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
				if var1_upvw == buffer_len_result1_upvw then
					var43 = 0
				else
					var43 = buffer.readu8(arg1, var1_upvw)
				end
				if var43 == 10 then
					var43 = var2_upvw
					var43 += 1
					var2_upvw = var43
				end
				var43 = math.min(var1_upvw + 1, buffer_len_result1_upvw)
				var1_upvw = var43
				if var1_upvw == buffer_len_result1_upvw then
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
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			return "whitespace"
		end
		if is_alpha_upvr(var42) then
			local var46 = var1_upvw
			while true do
				var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
				if var1_upvw == buffer_len_result1_upvw then
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
			if var1_upvw == buffer_len_result1_upvw then
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
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			return '.'
		end
		if buffer.readu8(arg1, var1_upvw) == 61 then
			local minimum_2 = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			var1_upvw = minimum_2
			if var1_upvw == buffer_len_result1_upvw then
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
			local minimum = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			var1_upvw = minimum
			if var1_upvw == buffer_len_result1_upvw then
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
			local minimum_7 = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			var1_upvw = minimum_7
			if var1_upvw == buffer_len_result1_upvw then
				minimum_7 = 0
			else
				minimum_7 = buffer.readu8(arg1, var1_upvw)
			end
			if minimum_7 == 61 then
				return ">="
			end
			return '>'
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 60 then
			local minimum_4 = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			var1_upvw = minimum_4
			if var1_upvw == buffer_len_result1_upvw then
				minimum_4 = 0
			else
				minimum_4 = buffer.readu8(arg1, var1_upvw)
			end
			if minimum_4 == 61 then
				return "<="
			end
			return '<'
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 36 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			return '$'
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 40 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			return '('
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 41 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			return ')'
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 123 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			return '{'
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 125 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			return '}'
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 91 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			return '['
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 93 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			return ']'
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 124 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			return '|'
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 10 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			return '\n'
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 59 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			return ';'
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if buffer.readu8(arg1, var1_upvw) == 44 then
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
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
			var1_upvw = math.min(var1_upvw + 1, buffer_len_result1_upvw)
			return read_kind_upvr()
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		error(`no symbol matching {string.char(buffer.readu8(arg1, var1_upvw))}`, 0)
		return "error"
	end
	local function next_token_upvr() -- Line 292, Named "next_token"
		--[[ Upvalues[3]:
			[1]: var1_upvw (read and write)
			[2]: read_kind_upvr (readonly)
			[3]: arg1 (read and write)
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
	local kind_3_upvw = next_token_result1_upvw.kind
	local x_upvw = next_token_result1_upvw.span.x
	local next_token_result1_upvw_2 = next_token_upvr()
	local kind_7_upvw = next_token_result1_upvw_2.kind
	local x_upvw_2 = next_token_result1_upvw_2.span.x
	local function _() -- Line 315, Named "consume"
		--[[ Upvalues[7]:
			[1]: next_token_result1_upvw (read and write)
			[2]: kind_3_upvw (read and write)
			[3]: next_token_result1_upvw_2 (read and write)
			[4]: kind_7_upvw (read and write)
			[5]: x_upvw (read and write)
			[6]: x_upvw_2 (read and write)
			[7]: next_token_upvr (readonly)
		]]
		next_token_result1_upvw = next_token_result1_upvw_2
		kind_3_upvw = kind_7_upvw
		x_upvw = x_upvw_2
		next_token_result1_upvw_2 = next_token_upvr()
		kind_7_upvw = next_token_result1_upvw_2.kind
		x_upvw_2 = next_token_result1_upvw_2.span.x
		return next_token_result1_upvw, kind_3_upvw
	end
	local function _(arg1_6) -- Line 325, Named "current_is"
		--[[ Upvalues[7]:
			[1]: kind_3_upvw (read and write)
			[2]: next_token_result1_upvw (read and write)
			[3]: next_token_result1_upvw_2 (read and write)
			[4]: kind_7_upvw (read and write)
			[5]: x_upvw (read and write)
			[6]: x_upvw_2 (read and write)
			[7]: next_token_upvr (readonly)
		]]
		while true do
			local var68
			if var68 ~= '\n' then break end
			var68 = next_token_result1_upvw
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_3_upvw = kind_7_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_7_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_3_upvw ~= arg1_6 then
			var68 = false
		else
			var68 = true
		end
		return var68
	end
	local function _(arg1_7) -- Line 333, Named "lookahead_is"
		--[[ Upvalues[3]:
			[1]: kind_7_upvw (read and write)
			[2]: next_token_result1_upvw_2 (read and write)
			[3]: next_token_upvr (readonly)
		]]
		while true do
			local var69
			if var69 ~= '\n' then break end
			var69 = next_token_upvr()
			next_token_result1_upvw_2 = var69
			var69 = next_token_result1_upvw_2.kind
			kind_7_upvw = var69
		end
		if kind_7_upvw ~= arg1_7 then
			var69 = false
		else
			var69 = true
		end
		return var69
	end
	local function _() -- Line 342, Named "yield"
		--[[ Upvalues[8]:
			[1]: arg2 (readonly)
			[2]: arg1 (read and write)
			[3]: buffer_len_result1_upvw (read and write)
			[4]: next_token_result1_upvw (read and write)
			[5]: next_token_upvr (readonly)
			[6]: kind_3_upvw (read and write)
			[7]: next_token_result1_upvw_2 (read and write)
			[8]: kind_7_upvw (read and write)
		]]
		local var70
		if arg2 then
			local coroutine_yield_result1 = coroutine.yield()
			if typeof(coroutine_yield_result1) ~= "buffer" then
				var70 = false
			else
				var70 = true
			end
			assert(var70)
			arg1 = coroutine_yield_result1
			var70 = coroutine_yield_result1
			buffer_len_result1_upvw = buffer.len(var70)
			next_token_result1_upvw = next_token_upvr()
			var70 = next_token_result1_upvw
			kind_3_upvw = var70.kind
			next_token_result1_upvw_2 = next_token_upvr()
			var70 = next_token_result1_upvw_2
			kind_7_upvw = var70.kind
		end
	end
	local function _(arg1_8) -- Line 356, Named "display"
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local kind_5 = arg1_8.kind
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [4] 3. Error Block 2 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [4] 3. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [8] 5. Error Block 4 start (CF ANALYSIS FAILED)
		do
			return kind_5
		end
		-- KONSTANTERROR: [8] 5. Error Block 4 end (CF ANALYSIS FAILED)
	end
	local function report_upvr(arg1_9, arg2_2) -- Line 368, Named "report"
		--[[ Upvalues[1]:
			[1]: next_token_result1_upvw (read and write)
		]]
		local tbl_2 = {}
		tbl_2.message = arg1_9
		local var74 = arg2_2
		if not var74 then
			var74 = next_token_result1_upvw.span
		end
		tbl_2.span = var74
		error(`{tbl_2.message} from {tbl_2.span.x} to {tbl_2.span.y}`, 0)
	end
	local function expect_failure_upvr(arg1_10) -- Line 377, Named "expect_failure"
		--[[ Upvalues[3]:
			[1]: report_upvr (readonly)
			[2]: next_token_result1_upvw (read and write)
			[3]: kind_3_upvw (read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 35 start (CF ANALYSIS FAILED)
		local tbl_4 = {}
		tbl_4.kind = arg1_10
		local kind = tbl_4.kind
		if kind == "identifier" or kind == "number" or kind == "string" then
			-- KONSTANTWARNING: GOTO [30] #23
		end
		-- KONSTANTERROR: [0] 1. Error Block 35 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [15] 11. Error Block 32 start (CF ANALYSIS FAILED)
		if tbl_4.kind == "error" then
			-- KONSTANTWARNING: GOTO [30] #23
		end
		-- KONSTANTERROR: [15] 11. Error Block 32 end (CF ANALYSIS FAILED)
	end
	local function expect_upvr(arg1_11) -- Line 387, Named "expect"
		--[[ Upvalues[11]:
			[1]: kind_3_upvw (read and write)
			[2]: next_token_result1_upvw (read and write)
			[3]: next_token_result1_upvw_2 (read and write)
			[4]: kind_7_upvw (read and write)
			[5]: x_upvw (read and write)
			[6]: x_upvw_2 (read and write)
			[7]: next_token_upvr (readonly)
			[8]: arg2 (readonly)
			[9]: arg1 (read and write)
			[10]: buffer_len_result1_upvw (read and write)
			[11]: expect_failure_upvr (readonly)
		]]
		while true do
			local var84
			if kind_3_upvw ~= '\n' then break end
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_3_upvw = kind_7_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_7_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_3_upvw ~= arg1_11 then
			var84 = false
		else
			var84 = true
		end
		if var84 then
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_3_upvw = kind_7_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_7_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
			var84 = next_token_result1_upvw
			return var84
		end
		var84 = kind_3_upvw
		if var84 == "eof" then
			var84 = arg2
			local var85
			if var84 then
				var84 = arg2
				local var86
				if var84 then
					var84 = coroutine.yield()
					if typeof(var84) ~= "buffer" then
						var86 = false
					else
						var86 = true
					end
					assert(var86)
					arg1 = var84
					var86 = var84
					buffer_len_result1_upvw = buffer.len(var86)
					next_token_result1_upvw = next_token_upvr()
					var86 = next_token_result1_upvw
					kind_3_upvw = var86.kind
					next_token_result1_upvw_2 = next_token_upvr()
					var86 = next_token_result1_upvw_2
					kind_7_upvw = var86.kind
				end
				while true do
					var86 = kind_3_upvw
					if var86 ~= '\n' then break end
					var86 = next_token_result1_upvw
					var85 = kind_7_upvw
					next_token_result1_upvw = next_token_result1_upvw_2
					kind_3_upvw = var85
					x_upvw = x_upvw_2
					next_token_result1_upvw_2 = next_token_upvr()
					var85 = next_token_result1_upvw_2
					kind_7_upvw = var85.kind
					var85 = next_token_result1_upvw_2.span
					x_upvw_2 = var85.x
				end
				if kind_3_upvw ~= arg1_11 then
					-- KONSTANTWARNING: GOTO [127] #107
				end
				if true then
					next_token_result1_upvw = next_token_result1_upvw_2
					kind_3_upvw = kind_7_upvw
					x_upvw = x_upvw_2
					next_token_result1_upvw_2 = next_token_upvr()
					kind_7_upvw = next_token_result1_upvw_2.kind
					var85 = next_token_result1_upvw_2
					x_upvw_2 = var85.span.x
					var84 = next_token_result1_upvw
					return var84
				end
				var85 = {}
				var85.kind = arg1_11
				local kind_2 = var85.kind
				if kind_2 == "identifier" or kind_2 == "number" or kind_2 == "string" then
					-- KONSTANTWARNING: GOTO [180] #149
				end
				if var85.kind == "error" then
					-- KONSTANTWARNING: GOTO [180] #149
				end
				local var88 = next_token_result1_upvw
				local kind_4 = var88.kind
				if kind_4 == "identifier" or kind_4 == "number" or kind_4 == "string" then
					var85 = kind_4
				elseif var88.kind == "error" then
					var85 = "error '"..var88.text.."'"
				else
					var85 = "'"..kind_4.."'"
				end
				local _ = {
					message = `expected {"'"..kind_2.."'"}, but got {var85} of {kind_3_upvw} instead`;
					span = next_token_result1_upvw.span;
				}
				var85 = `{_.message} from {_.span.x} to {_.span.y}`
				var85 = 0
				error(var85, var85)
				var84 = nil
				return var84
			end
		end
		var84 = expect_failure_upvr(arg1_11)
		return var84
	end
	local parse_expression_upvw
	local parse_command_upvw
	local parse_block_upvw
	local parse_expression_or_command_upvw
	local function parse_var_root_upvw() -- Line 413, Named "parse_var_root"
		--[[ Upvalues[10]:
			[1]: kind_3_upvw (read and write)
			[2]: next_token_result1_upvw (read and write)
			[3]: next_token_result1_upvw_2 (read and write)
			[4]: kind_7_upvw (read and write)
			[5]: x_upvw (read and write)
			[6]: x_upvw_2 (read and write)
			[7]: next_token_upvr (readonly)
			[8]: expect_upvr (readonly)
			[9]: parse_expression_or_command_upvw (read and write)
			[10]: report_upvr (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 106 start (CF ANALYSIS FAILED)
		while true do
			local var95
			if kind_3_upvw ~= '\n' then break end
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_3_upvw = kind_7_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_7_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_3_upvw ~= "identifier" then
			var95 = false
			-- KONSTANTWARNING: GOTO [30] #26
		end
		-- KONSTANTERROR: [0] 1. Error Block 106 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [29] 25. Error Block 87 start (CF ANALYSIS FAILED)
		var95 = true
		if var95 then
			var95 = expect_upvr("identifier")
			return {
				kind = "global";
				span = var95.span;
				token = var95;
			}
		end
		while kind_3_upvw == '\n' do
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_3_upvw = kind_7_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_7_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_3_upvw ~= '$' then
			var95 = false
		else
			var95 = true
		end
		-- KONSTANTERROR: [29] 25. Error Block 87 end (CF ANALYSIS FAILED)
	end
	local function parse_var_suffix_upvw() -- Line 442, Named "parse_var_suffix"
		--[[ Upvalues[10]:
			[1]: kind_3_upvw (read and write)
			[2]: next_token_result1_upvw (read and write)
			[3]: next_token_result1_upvw_2 (read and write)
			[4]: kind_7_upvw (read and write)
			[5]: x_upvw (read and write)
			[6]: x_upvw_2 (read and write)
			[7]: next_token_upvr (readonly)
			[8]: expect_upvr (readonly)
			[9]: parse_expression_or_command_upvw (read and write)
			[10]: report_upvr (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 38 start (CF ANALYSIS FAILED)
		while true do
			local var97
			if kind_3_upvw ~= '\n' then break end
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_3_upvw = kind_7_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_7_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_3_upvw ~= '.' then
			var97 = false
			-- KONSTANTWARNING: GOTO [30] #26
		end
		-- KONSTANTERROR: [0] 1. Error Block 38 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [29] 25. Error Block 31 start (CF ANALYSIS FAILED)
		var97 = true
		if var97 then
			var97 = expect_upvr('.')
			local expect_result1 = expect_upvr("identifier")
			return {
				kind = "nameindex";
				span = vector.create(var97.span.x, expect_result1.span.y, 0);
				name = expect_result1;
			}
		end
		while kind_3_upvw == '\n' do
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_3_upvw = kind_7_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_7_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_3_upvw ~= '[' then
			var97 = false
		else
			var97 = true
		end
		if var97 then
			var97 = expect_upvr('[')
			return {
				kind = "exprindex";
				span = vector.create(var97.span.x, expect_upvr(']').span.y, 0);
				expr = parse_expression_or_command_upvw();
			}
		end
		var97 = report_upvr("invalid")
		do
			return var97
		end
		-- KONSTANTERROR: [29] 25. Error Block 31 end (CF ANALYSIS FAILED)
	end
	local function parse_var_suffixes_upvw() -- Line 465, Named "parse_var_suffixes"
		--[[ Upvalues[8]:
			[1]: kind_3_upvw (read and write)
			[2]: next_token_result1_upvw (read and write)
			[3]: next_token_result1_upvw_2 (read and write)
			[4]: kind_7_upvw (read and write)
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
	local function parse_var_upvw() -- Line 474, Named "parse_var"
		--[[ Upvalues[2]:
			[1]: parse_var_root_upvw (read and write)
			[2]: parse_var_suffixes_upvw (read and write)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local parse_var_root_upvw_result1 = parse_var_root_upvw()
		local var102
		if parse_var_root_upvw_result1.kind ~= "global" then
			var102 = parse_var_suffixes_upvw()
		else
			var102 = {}
		end
		local span = parse_var_root_upvw_result1.span
		if 0 < #var102 then
		else
		end
		return {
			span = vector.create(span.x, parse_var_root_upvw_result1.span.y, 0);
			prefix = parse_var_root_upvw_result1;
			suffixes = var102;
		}
	end
	function parse_expression_or_command_upvw() -- Line 492, Named "parse_expression_or_command"
		--[[ Upvalues[13]:
			[1]: kind_3_upvw (read and write)
			[2]: next_token_result1_upvw (read and write)
			[3]: next_token_result1_upvw_2 (read and write)
			[4]: kind_7_upvw (read and write)
			[5]: x_upvw (read and write)
			[6]: x_upvw_2 (read and write)
			[7]: next_token_upvr (readonly)
			[8]: parse_command_upvw (read and write)
			[9]: arg2 (readonly)
			[10]: arg1 (read and write)
			[11]: buffer_len_result1_upvw (read and write)
			[12]: var105_upvw (read and write)
			[13]: parse_expression_upvw (read and write)
		]]
		while true do
			local var108
			if kind_3_upvw ~= '\n' then break end
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_3_upvw = kind_7_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_7_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_3_upvw ~= "identifier" then
			var108 = false
		else
			var108 = true
		end
		if var108 then
			var108 = parse_command_upvw()
			return var108
		end
		var108 = kind_3_upvw
		if var108 == "eof" then
			var108 = arg2
			if var108 then
				var108 = arg2
				local var109
				if var108 then
					var108 = coroutine.yield()
					if typeof(var108) ~= "buffer" then
						var109 = false
					else
						var109 = true
					end
					assert(var109)
					arg1 = var108
					var109 = var108
					buffer_len_result1_upvw = buffer.len(var109)
					next_token_result1_upvw = next_token_upvr()
					var109 = next_token_result1_upvw
					kind_3_upvw = var109.kind
					next_token_result1_upvw_2 = next_token_upvr()
					var109 = next_token_result1_upvw_2
					kind_7_upvw = var109.kind
				end
				var108 = var105_upvw()
				return var108
			end
		end
		var108 = parse_expression_upvw()
		return var108
	end
	local var105_upvw = parse_expression_or_command_upvw
	local function parse_function_body_upvw() -- Line 503, Named "parse_function_body"
		--[[ Upvalues[12]:
			[1]: expect_upvr (readonly)
			[2]: kind_3_upvw (read and write)
			[3]: next_token_result1_upvw (read and write)
			[4]: next_token_result1_upvw_2 (read and write)
			[5]: kind_7_upvw (read and write)
			[6]: x_upvw (read and write)
			[7]: x_upvw_2 (read and write)
			[8]: next_token_upvr (readonly)
			[9]: arg2 (readonly)
			[10]: arg1 (read and write)
			[11]: buffer_len_result1_upvw (read and write)
			[12]: parse_block_upvw (read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local var110
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [98] 82. Error Block 20 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [98] 82. Error Block 20 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [10] 8. Error Block 36 start (CF ANALYSIS FAILED)
		repeat
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [98.4]
		until nil ~= '\n'
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if nil ~= '|' then
		else
		end
		-- KONSTANTERROR: [10] 8. Error Block 36 end (CF ANALYSIS FAILED)
	end
	local function parse_lambda_upvw() -- Line 532, Named "parse_lambda"
		--[[ Upvalues[1]:
			[1]: parse_function_body_upvw (read and write)
		]]
		local parse_function_body_upvw_result1_2 = parse_function_body_upvw()
		return {
			kind = "lambda";
			body = parse_function_body_upvw_result1_2;
			span = parse_function_body_upvw_result1_2.span;
		}
	end
	function parse_table() -- Line 541
		--[[ Upvalues[9]:
			[1]: expect_upvr (readonly)
			[2]: kind_3_upvw (read and write)
			[3]: next_token_result1_upvw (read and write)
			[4]: next_token_result1_upvw_2 (read and write)
			[5]: kind_7_upvw (read and write)
			[6]: x_upvw (read and write)
			[7]: x_upvw_2 (read and write)
			[8]: next_token_upvr (readonly)
			[9]: parse_expression_upvw (read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local var113
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [190] 156. Error Block 39 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [190] 156. Error Block 39 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [10] 8. Error Block 69 start (CF ANALYSIS FAILED)
		repeat
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [190.4]
		until nil ~= '\n'
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if nil ~= '}' then
		else
		end
		-- KONSTANTERROR: [10] 8. Error Block 69 end (CF ANALYSIS FAILED)
	end
	function parse_vector() -- Line 584
		--[[ Upvalues[9]:
			[1]: expect_upvr (readonly)
			[2]: kind_3_upvw (read and write)
			[3]: next_token_result1_upvw (read and write)
			[4]: next_token_result1_upvw_2 (read and write)
			[5]: kind_7_upvw (read and write)
			[6]: x_upvw (read and write)
			[7]: x_upvw_2 (read and write)
			[8]: next_token_upvr (readonly)
			[9]: parse_expression_upvw (read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local const_number = 0
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [38] 32. Error Block 25 start (CF ANALYSIS FAILED)
		if true then
			-- KONSTANTWARNING: GOTO [50] #43
		end
		if const_number ~= 0 then
			expect_upvr(',')
		end
		local var115 = const_number + 1
		;({})[var115] = parse_expression_upvw()
		-- KONSTANTERROR: [38] 32. Error Block 25 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [6] 6. Error Block 2 start (CF ANALYSIS FAILED)
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [49.1019]
		-- KONSTANTERROR: [6] 6. Error Block 2 end (CF ANALYSIS FAILED)
	end
	function parse_expression_upvw() -- Line 607, Named "parse_expression"
		--[[ Upvalues[16]:
			[1]: kind_3_upvw (read and write)
			[2]: next_token_result1_upvw (read and write)
			[3]: next_token_result1_upvw_2 (read and write)
			[4]: kind_7_upvw (read and write)
			[5]: x_upvw (read and write)
			[6]: x_upvw_2 (read and write)
			[7]: next_token_upvr (readonly)
			[8]: expect_upvr (readonly)
			[9]: parse_command_upvw (read and write)
			[10]: var116_upvw (read and write)
			[11]: parse_var_upvw (read and write)
			[12]: parse_lambda_upvw (read and write)
			[13]: arg2 (readonly)
			[14]: arg1 (read and write)
			[15]: buffer_len_result1_upvw (read and write)
			[16]: report_upvr (readonly)
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
	local var116_upvw = parse_expression_upvw
	function parse_command_upvw() -- Line 687, Named "parse_command"
		--[[ Upvalues[9]:
			[1]: parse_var_upvw (read and write)
			[2]: kind_3_upvw (read and write)
			[3]: next_token_result1_upvw (read and write)
			[4]: next_token_result1_upvw_2 (read and write)
			[5]: kind_7_upvw (read and write)
			[6]: x_upvw (read and write)
			[7]: x_upvw_2 (read and write)
			[8]: next_token_upvr (readonly)
			[9]: var116_upvw (read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [286] 240. Error Block 85 start (CF ANALYSIS FAILED)
		table.insert({}, var116_upvw())
		-- KONSTANTERROR: [286] 240. Error Block 85 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [4] 4. Error Block 2 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		-- KONSTANTERROR: [4] 4. Error Block 2 end (CF ANALYSIS FAILED)
	end
	local var117_upvw = parse_command_upvw
	local function parse_if_upvw() -- Line 722, Named "parse_if"
		--[[ Upvalues[11]:
			[1]: expect_upvr (readonly)
			[2]: kind_3_upvw (read and write)
			[3]: next_token_result1_upvw (read and write)
			[4]: next_token_result1_upvw_2 (read and write)
			[5]: kind_7_upvw (read and write)
			[6]: x_upvw (read and write)
			[7]: x_upvw_2 (read and write)
			[8]: next_token_upvr (readonly)
			[9]: var117_upvw (read and write)
			[10]: var116_upvw (read and write)
			[11]: parse_block_upvw (read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local var118
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [252] 213. Error Block 53 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [252] 213. Error Block 53 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [12] 10. Error Block 109 start (CF ANALYSIS FAILED)
		if true then
			repeat
				-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [252.7]
			until nil ~= '\n'
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if nil ~= "identifier" then
				-- KONSTANTWARNING: GOTO [46] #39
			end
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [252.6]
			if nil then
			else
			end
			-- KONSTANTWARNING: GOTO [252] #213
		end
		-- KONSTANTERROR: [12] 10. Error Block 109 end (CF ANALYSIS FAILED)
	end
	local function parse_while_upvw() -- Line 782, Named "parse_while"
		--[[ Upvalues[11]:
			[1]: expect_upvr (readonly)
			[2]: kind_3_upvw (read and write)
			[3]: next_token_result1_upvw (read and write)
			[4]: next_token_result1_upvw_2 (read and write)
			[5]: kind_7_upvw (read and write)
			[6]: x_upvw (read and write)
			[7]: x_upvw_2 (read and write)
			[8]: next_token_upvr (readonly)
			[9]: var117_upvw (read and write)
			[10]: var116_upvw (read and write)
			[11]: parse_block_upvw (read and write)
		]]
		expect_upvr('(')
		local var119
		while kind_3_upvw == '\n' do
			next_token_result1_upvw = next_token_result1_upvw_2
			kind_3_upvw = kind_7_upvw
			x_upvw = x_upvw_2
			next_token_result1_upvw_2 = next_token_upvr()
			kind_7_upvw = next_token_result1_upvw_2.kind
			x_upvw_2 = next_token_result1_upvw_2.span.x
		end
		if kind_3_upvw ~= "identifier" then
			-- KONSTANTWARNING: GOTO [40] #34
		end
		if true then
			var119 = var117_upvw()
		else
			var119 = var116_upvw()
		end
		expect_upvr(')')
		expect_upvr('{')
		return {
			kind = "while";
			expression = var119;
			block = parse_block_upvw('}');
			span = vector.create(expect_upvr("while").span.x, expect_upvr('}').span.y, 0);
		}
	end
	local function parse_for_upvw() -- Line 803, Named "parse_for"
		--[[ Upvalues[3]:
			[1]: expect_upvr (readonly)
			[2]: var105_upvw (read and write)
			[3]: parse_function_body_upvw (read and write)
		]]
		expect_upvr('(')
		expect_upvr(')')
		local parse_function_body_upvw_result1 = parse_function_body_upvw()
		return {
			kind = "for";
			expression = var105_upvw();
			call = parse_function_body_upvw_result1;
			span = vector.create(expect_upvr("for").span.x, parse_function_body_upvw_result1.span.y, 0);
		}
	end
	local function parse_return_upvw() -- Line 818, Named "parse_return"
		--[[ Upvalues[3]:
			[1]: expect_upvr (readonly)
			[2]: kind_3_upvw (read and write)
			[3]: var116_upvw (read and write)
		]]
		local tbl = {}
		local var125
		while kind_3_upvw ~= '}' and kind_3_upvw ~= "eof" do
			if 0 < #tbl then
				expect_upvr(',')
			end
			local var116_upvw_result1 = var116_upvw()
			table.insert(tbl, var116_upvw_result1)
			var125 = var116_upvw_result1.span.y
		end
		return {
			kind = "return";
			values = tbl;
			span = vector.create(expect_upvr("return").span.x, var125, 0);
		}
	end
	function parse_block_upvw(arg1_12, arg2_3) -- Line 839, Named "parse_block"
		--[[ Upvalues[17]:
			[1]: kind_3_upvw (read and write)
			[2]: next_token_result1_upvw (read and write)
			[3]: next_token_result1_upvw_2 (read and write)
			[4]: kind_7_upvw (read and write)
			[5]: x_upvw (read and write)
			[6]: x_upvw_2 (read and write)
			[7]: next_token_upvr (readonly)
			[8]: expect_upvr (readonly)
			[9]: var105_upvw (read and write)
			[10]: parse_if_upvw (read and write)
			[11]: parse_while_upvw (read and write)
			[12]: parse_for_upvw (read and write)
			[13]: parse_return_upvw (read and write)
			[14]: var117_upvw (read and write)
			[15]: arg2 (readonly)
			[16]: arg1 (read and write)
			[17]: buffer_len_result1_upvw (read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [554] 452. Error Block 117 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [554] 452. Error Block 117 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [5] 5. Error Block 2 start (CF ANALYSIS FAILED)
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [555.6]
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [555.2950882]
		-- KONSTANTERROR: [5] 5. Error Block 2 end (CF ANALYSIS FAILED)
	end
	return parse_block_upvw("eof")
end
return function(arg1, arg2) -- Line 923, Named "generate"
	--[[ Upvalues[1]:
		[1]: parse_upvr (readonly)
	]]
	local var128_upvw = arg1
	local coroutine_create_result1_upvr = coroutine.create(parse_upvr)
	local get_result_upvw
	local function append_upvr(arg1_13) -- Line 928, Named "append"
		--[[ Upvalues[4]:
			[1]: var128_upvw (read and write)
			[2]: get_result_upvw (read and write)
			[3]: coroutine_create_result1_upvr (readonly)
			[4]: arg2 (readonly)
		]]
		var128_upvw = var128_upvw..arg1_13
		return get_result_upvw(coroutine.resume(coroutine_create_result1_upvr, buffer.fromstring(var128_upvw), arg2))
	end
	local function overwrite_upvr(arg1_14) -- Line 934, Named "overwrite"
		--[[ Upvalues[4]:
			[1]: var128_upvw (read and write)
			[2]: get_result_upvw (read and write)
			[3]: coroutine_create_result1_upvr (readonly)
			[4]: arg2 (readonly)
		]]
		var128_upvw = arg1_14
		return get_result_upvw(coroutine.resume(coroutine_create_result1_upvr, buffer.fromstring(arg1_14), arg2))
	end
	function get_result_upvw(arg1_15, arg2_4) -- Line 940, Named "get_result"
		--[[ Upvalues[4]:
			[1]: coroutine_create_result1_upvr (readonly)
			[2]: var128_upvw (read and write)
			[3]: append_upvr (readonly)
			[4]: overwrite_upvr (readonly)
		]]
		if coroutine.status(coroutine_create_result1_upvr) == "suspended" then
			return {
				status = "pending";
				src = var128_upvw;
				append = append_upvr;
				set = overwrite_upvr;
			}
		end
		if arg1_15 == false then
			local module_2 = {
				status = "error";
				src = var128_upvw;
			}
			module_2.why = arg2_4
			return module_2
		end
		if coroutine.status(coroutine_create_result1_upvr) == "dead" then
			local module = {
				status = "finished";
				src = var128_upvw;
			}
			module.value = arg2_4
			return module
		end
		error('?')
	end
	return overwrite_upvr(arg1)
end