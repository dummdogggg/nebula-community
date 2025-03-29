--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_analysis.0.2.0.conch_analysis.src.lib
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:59
-- Luau version 6, Types version 3
-- Time taken: 0.018836 seconds

local ._optional_ast_upvr = require("./optional_ast")
return {
	generate_analysis_info = function(arg1) -- Line 33, Named "generate_analysis_info"
		--[[ Upvalues[1]:
			[1]: ._optional_ast_upvr (readonly)
		]]
		local tbl_7_upvr = {}
		local where_upvr = arg1.where
		local function _(arg1_2, arg2) -- Line 56, Named "LOG"
			--[[ Upvalues[1]:
				[1]: tbl_7_upvr (readonly)
			]]
			local tbl_9 = {}
			tbl_9.kind = arg1_2
			tbl_9.text = arg2
			table.insert(tbl_7_upvr, tbl_9)
		end
		local function get_span_upvr(arg1_3) -- Line 60, Named "get_span"
			-- KONSTANTERROR: [0] 1. Error Block 23 start (CF ANALYSIS FAILED)
			if arg1_3.left then
				-- KONSTANTWARNING: GOTO [28] #18
			end
			-- KONSTANTERROR: [0] 1. Error Block 23 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [12] 9. Error Block 20 start (CF ANALYSIS FAILED)
			if arg1_3.value then
				-- KONSTANTWARNING: GOTO [28] #18
			end
			-- KONSTANTERROR: [12] 9. Error Block 20 end (CF ANALYSIS FAILED)
		end
		local function _(arg1_4) -- Line 85, Named "get_text_token"
			--[[ Upvalues[1]:
				[1]: where_upvr (readonly)
			]]
			return string.sub(arg1_4.text, 1, where_upvr - arg1_4.span.x)
		end
		local function _(arg1_5) -- Line 91, Named "position_relative"
			--[[ Upvalues[1]:
				[1]: where_upvr (readonly)
			]]
			if arg1_5.x <= where_upvr and where_upvr <= arg1_5.y then
				return "within"
			end
			if where_upvr < arg1_5.x then
				return "before"
			end
			return "after"
		end
		local var1_result1_upvr = ._optional_ast_upvr(arg1.code)
		local function no_suggestions_upvr(arg1_6) -- Line 103, Named "no_suggestions"
			--[[ Upvalues[3]:
				[1]: where_upvr (readonly)
				[2]: tbl_7_upvr (readonly)
				[3]: var1_result1_upvr (readonly)
			]]
			local module_2 = {
				at = where_upvr;
			}
			module_2.text = arg1_6
			module_2.logs = tbl_7_upvr
			module_2.suggestions = {}
			local var9 = var1_result1_upvr
			if var9 then
				var9 = false
				if var1_result1_upvr.status == "finished" then
					var9 = var1_result1_upvr.value
				end
			end
			module_2.ast = var9
			return module_2
		end
		if var1_result1_upvr.status == "error" then
			table.insert(tbl_7_upvr, {
				kind = "error";
				text = var1_result1_upvr.why;
			})
			return no_suggestions_upvr("")
		end
		local process_block_upvw
		local process_expression_or_command_upvw
		local process_expression_upvw
		local function process_command_upvw(arg1_7, arg2) -- Line 135, Named "process_command"
			--[[ Upvalues[5]:
				[1]: where_upvr (readonly)
				[2]: arg1 (readonly)
				[3]: no_suggestions_upvr (readonly)
				[4]: process_expression_upvw (read and write)
				[5]: tbl_7_upvr (readonly)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 64 start (CF ANALYSIS FAILED)
			local span_5 = arg1_7.prefix.span
			local var15
			if span_5.x <= where_upvr and where_upvr <= span_5.y then
				var15 = "within"
			elseif where_upvr < span_5.x then
				var15 = "before"
			else
				var15 = "after"
			end
			-- KONSTANTERROR: [0] 1. Error Block 64 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [26] 18. Error Block 9 start (CF ANALYSIS FAILED)
			do
				return process_variable(arg1_7.prefix, arg2)
			end
			-- KONSTANTERROR: [26] 18. Error Block 9 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [33] 23. Error Block 10 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [33] 23. Error Block 10 end (CF ANALYSIS FAILED)
		end
		function process_if(arg1_8) -- Line 223
			--[[ Upvalues[4]:
				[1]: get_span_upvr (readonly)
				[2]: where_upvr (readonly)
				[3]: process_expression_or_command_upvw (read and write)
				[4]: process_block_upvw (read and write)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 18 start (CF ANALYSIS FAILED)
			local condition = arg1_8.condition
			local get_span_result1_4 = get_span_upvr(condition)
			local var18
			if get_span_result1_4.x <= where_upvr and where_upvr <= get_span_result1_4.y then
				var18 = "within"
				-- KONSTANTWARNING: GOTO [25] #19
			end
			-- KONSTANTERROR: [0] 1. Error Block 18 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [17] 13. Error Block 19 start (CF ANALYSIS FAILED)
			if where_upvr < get_span_result1_4.x then
				var18 = "before"
			else
				var18 = "after"
			end
			if var18 == "within" then
				return process_expression_or_command_upvw(condition.value)
			end
			if arg1_8.block then
				return process_block_upvw(arg1_8.block.value)
			end
			-- KONSTANTERROR: [17] 13. Error Block 19 end (CF ANALYSIS FAILED)
		end
		function parse_if_stat(arg1_9) -- Line 234
			--[[ Upvalues[3]:
				[1]: where_upvr (readonly)
				[2]: get_span_upvr (readonly)
				[3]: process_block_upvw (read and write)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [36] 26. Error Block 12 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [36] 26. Error Block 12 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [5] 5. Error Block 34 start (CF ANALYSIS FAILED)
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [36.9]
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [36.8]
			if nil <= nil then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				if nil <= nil then
					-- KONSTANTWARNING: GOTO [27] #20
				end
			end
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
			if nil < nil then
			else
			end
			-- KONSTANTERROR: [5] 5. Error Block 34 end (CF ANALYSIS FAILED)
		end
		local function process_function_upvw(arg1_10) -- Line 248, Named "process_function"
			--[[ Upvalues[4]:
				[1]: no_suggestions_upvr (readonly)
				[2]: get_span_upvr (readonly)
				[3]: where_upvr (readonly)
				[4]: process_block_upvw (read and write)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 19 start (CF ANALYSIS FAILED)
			if not arg1_10.block then
				return no_suggestions_upvr("")
			end
			local get_span_result1_3 = get_span_upvr(arg1_10.block)
			local var20
			if get_span_result1_3.x <= where_upvr and where_upvr <= get_span_result1_3.y then
				var20 = "within"
				-- KONSTANTWARNING: GOTO [31] #24
			end
			-- KONSTANTERROR: [0] 1. Error Block 19 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [23] 18. Error Block 20 start (CF ANALYSIS FAILED)
			if where_upvr < get_span_result1_3.x then
				var20 = "before"
			else
				var20 = "after"
			end
			if var20 == "within" then
				var20 = process_block_upvw(arg1_10.block.value)
				return var20
			end
			var20 = no_suggestions_upvr("")
			do
				return var20
			end
			-- KONSTANTERROR: [23] 18. Error Block 20 end (CF ANALYSIS FAILED)
		end
		function process_var_prefix(arg1_11, arg2) -- Line 257
			--[[ Upvalues[5]:
				[1]: where_upvr (readonly)
				[2]: arg1 (readonly)
				[3]: process_expression_or_command_upvw (read and write)
				[4]: tbl_7_upvr (readonly)
				[5]: var1_result1_upvr (readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			local prefix = arg1_11.prefix
			local var74
			local var75
			local tbl_3 = {}
			if prefix.kind == "global" then
				local token_2 = prefix.token
				var75 = string.sub(token_2.text, 1, where_upvr - token_2.span.x)
				if arg2 and string.sub("true", 1, #var75) == var75 then
					table.insert(tbl_3, {
						name = "true";
						type = "true";
						replace = arg1_11.span;
						with = "true";
					})
				end
				if arg2 and string.sub("false", 1, #var75) == var75 then
					table.insert(tbl_3, {
						name = "false";
						type = "false";
						replace = arg1_11.span;
						with = "false";
					})
				end
				if arg2 and string.sub("nil", 1, #var75) == var75 then
					table.insert(tbl_3, {
						name = "nil";
						type = "nil";
						replace = arg1_11.span;
						with = "nil";
					})
				end
				if not arg2 and string.sub("for", 1, #var75) == var75 then
					table.insert(tbl_3, {
						name = "for";
						type = "for";
						replace = arg1_11.span;
						with = "for";
					})
				end
				if not arg2 and string.sub("if", 1, #var75) == var75 then
					table.insert(tbl_3, {
						name = "if";
						type = "if";
						replace = arg1_11.span;
						with = "if";
					})
				end
				if not arg2 and string.sub("while", 1, #var75) == var75 then
					table.insert(tbl_3, {
						name = "while";
						type = "while";
						replace = arg1_11.span;
						with = "while";
					})
				end
				if not arg2 and string.sub("else", 1, #var75) == var75 then
					table.insert(tbl_3, {
						name = "else";
						type = "else";
						replace = arg1_11.span;
						with = "else";
					})
				end
				for i, v in arg1.commands do
					local string_lower_result1_4 = string.lower(var75)
					if string.sub(string.lower(v.name), 1, #string_lower_result1_4) == string_lower_result1_4 then
						if #string_lower_result1_4 == #v.name then
							var74 = v
						end
						table.insert(tbl_3, {
							name = v.name;
							description = v.description;
							type = "Command";
							replace = arg1_11.span;
							with = v.name;
						})
					end
				end
			else
				local var87
				if var87 == "name" then
					local function INLINED_3() -- Internal function, doesn't exist in bytecode
						var87 = prefix.name.text
						return var87
					end
					if not prefix.name or not INLINED_3() then
						var87 = ""
					end
					var75 = var87
					i = arg1
					var87 = i.variables
					for i_2, v_2 in var87 do
						local string_lower_result1_5 = string.lower(var75)
						local var89
						if string.sub(string.lower(i_2), 1, #string_lower_result1_5) == string_lower_result1_5 then
							if #string_lower_result1_5 == #i_2 then
								var74 = {
									kind = "argument";
									name = i_2;
									type = typeof(v_2);
								}
							end
							local tbl_10 = {
								name = i_2;
							}
							var89 = typeof(v_2)
							tbl_10.type = var89
							local function INLINED_4() -- Internal function, doesn't exist in bytecode
								var89 = prefix.name.span
								return var89
							end
							if not prefix.name or not INLINED_4() then
								var89 = vector.create(prefix.span.x + 1, prefix.span.y)
							end
							tbl_10.replace = var89
							tbl_10.with = i_2
							table.insert(tbl_3, tbl_10)
						end
					end
				else
					var87 = prefix.kind
					if var87 == "paren" then
						var87 = prefix.expr.value
						if var87 then
							var87 = process_expression_or_command_upvw(prefix.expr.value)
							return var87
						end
					end
				end
			end
			var87 = {}
			local var92 = var87
			var92.at = where_upvr
			var92.text = var75
			var92.logs = tbl_7_upvr
			var92.ast = var1_result1_upvr.value
			var92.analyzing = var74
			var92.suggestions = tbl_3
			return var92
		end
		function process_variable(arg1_12, arg2) -- Line 395
			--[[ Upvalues[4]:
				[1]: where_upvr (readonly)
				[2]: no_suggestions_upvr (readonly)
				[3]: arg1 (readonly)
				[4]: tbl_7_upvr (readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			-- KONSTANTERROR: [0] 1. Error Block 106 start (CF ANALYSIS FAILED)
			local span_6 = arg1_12.prefix.span
			local var102
			if span_6.x <= where_upvr and where_upvr <= span_6.y then
				var102 = "within"
			elseif where_upvr < span_6.x then
				var102 = "before"
			else
				var102 = "after"
			end
			if var102 == "within" then
				var102 = process_var_prefix(arg1_12, arg2)
				return var102
			end
			var102 = arg1_12.prefix.kind
			if var102 == "paren" then
				var102 = no_suggestions_upvr("")
				return var102
			end
			var102 = arg1_12.prefix.kind
			if var102 == "global" then
				var102 = no_suggestions_upvr("")
				return var102
			end
			var102 = arg1_12.prefix
			local name = var102.name
			if name then
				name = var102.name.text
			end
			if not name then
				return no_suggestions_upvr("")
			end
			local var104 = arg1.variables[name]
			if var104 == nil then
				local tbl_11 = {}
				local var106 = "warn"
				tbl_11.kind = var106
				tbl_11.text = `no defined variable named "{name}"`
				table.insert(tbl_7_upvr, tbl_11)
				return no_suggestions_upvr(name)
			end
			if type(var104) ~= "table" and type(var104) ~= "userdata" and type(var104) ~= "vector" then
				table.insert(tbl_7_upvr, {
					kind = "warn";
					text = `probably can't index "{name}" which is a "{typeof(var104)}"`;
				})
			end
			local span_4 = var106.span
			local var109
			if span_4.x <= where_upvr and where_upvr <= span_4.y then
				var109 = "within"
			elseif where_upvr < span_4.x then
				var109 = "before"
			else
				var109 = "after"
			end
			if var109 ~= "within" then
				var109 = var106.kind
				if var109 == "nameindex" then
					var109 = var106.name
					if var109 then
						var109 = var106.name.text
					end
					if not var109 then
						return no_suggestions_upvr(var109)
					end
				else
					return no_suggestions_upvr("")
				end
				-- KONSTANTWARNING: GOTO [110] #79
			end
			-- KONSTANTERROR: [0] 1. Error Block 106 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [202] 146. Error Block 110 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if no_suggestions_upvr("") == "nameindex" then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				if no_suggestions_upvr("") then
				end
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				if not no_suggestions_upvr("") then
				end
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
				if not var109 or not "" then
				end
			else
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				if no_suggestions_upvr("") == "exprindex" then
					-- KONSTANTWARNING: GOTO [255] #182
				end
			end
			if var104[var109][var109] then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
				local tbl_6 = {
					kind = "argument";
				}
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				tbl_6.name = var109
				tbl_6.type = typeof(var104[var109][var109])
			end
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if type(var104[var109]) == "table" then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				for i_3, v_3 in pairs(var104[var109]) do
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					local string_lower_result1_2 = string.lower(var109)
					if string.sub(string.lower(i_3), 1, #string_lower_result1_2) == string_lower_result1_2 then
						table.insert({}, {
							name = i_3;
							with = i_3;
							type = typeof(v_3);
							replace = vector.create(arg1_12.span.x, 0);
						})
					end
				end
			end
			local module = {
				at = where_upvr;
			}
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			module.text = var109
			module.logs = tbl_7_upvr
			module.analyzing = tbl_6
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			module.suggestions = {}
			do
				return module
			end
			-- KONSTANTERROR: [202] 146. Error Block 110 end (CF ANALYSIS FAILED)
		end
		function process_expression_upvw(arg1_13) -- Line 492, Named "process_expression"
			--[[ Upvalues[6]:
				[1]: process_function_upvw (read and write)
				[2]: get_span_upvr (readonly)
				[3]: where_upvr (readonly)
				[4]: process_expression_or_command_upvw (read and write)
				[5]: var117_upvw (read and write)
				[6]: no_suggestions_upvr (readonly)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [4] 3. Error Block 2 start (CF ANALYSIS FAILED)
			do
				return process_function_upvw(arg1_13.body)
			end
			-- KONSTANTERROR: [4] 3. Error Block 2 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [9] 7. Error Block 3 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [9] 7. Error Block 3 end (CF ANALYSIS FAILED)
		end
		local var117_upvw = process_expression_upvw
		local function process_return_upvw(arg1_14) -- Line 518, Named "process_return"
			--[[ Upvalues[3]:
				[1]: where_upvr (readonly)
				[2]: process_expression_or_command_upvw (read and write)
				[3]: no_suggestions_upvr (readonly)
			]]
			for _, v_4 in arg1_14.values do
				local span_3 = v_4.span
				local var123
				if span_3.x <= where_upvr then
					if where_upvr <= span_3.y then
						var123 = "within"
						-- KONSTANTWARNING: GOTO [27] #20
					end
				end
				if where_upvr < span_3.x then
					var123 = "before"
				else
					var123 = "after"
				end
				if var123 ~= "before" then
					var123 = process_expression_or_command_upvw(v_4)
					return var123
				end
			end
			return no_suggestions_upvr("")
		end
		function process_expression_or_command_upvw(arg1_15) -- Line 526, Named "process_expression_or_command"
			--[[ Upvalues[2]:
				[1]: process_command_upvw (read and write)
				[2]: var117_upvw (read and write)
			]]
			if arg1_15.kind == "command" then
				return process_command_upvw(arg1_15, true)
			end
			return var117_upvw(arg1_15)
		end
		local var124_upvw = process_expression_or_command_upvw
		local function process_assignment_upvw(arg1_16) -- Line 534, Named "process_assignment"
			--[[ Upvalues[3]:
				[1]: no_suggestions_upvr (readonly)
				[2]: where_upvr (readonly)
				[3]: var124_upvw (read and write)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 19 start (CF ANALYSIS FAILED)
			if not arg1_16.right then
				return no_suggestions_upvr("")
			end
			local span_2 = arg1_16.operator.span
			local var126
			if span_2.x <= where_upvr and where_upvr <= span_2.y then
				var126 = "within"
				-- KONSTANTWARNING: GOTO [31] #23
			end
			-- KONSTANTERROR: [0] 1. Error Block 19 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [23] 17. Error Block 20 start (CF ANALYSIS FAILED)
			if where_upvr < span_2.x then
				var126 = "before"
			else
				var126 = "after"
			end
			if var126 == "before" then
				var126 = no_suggestions_upvr("")
				return var126
			end
			var126 = var124_upvw(arg1_16.right)
			do
				return var126
			end
			-- KONSTANTERROR: [23] 17. Error Block 20 end (CF ANALYSIS FAILED)
		end
		local function process_while_upvw(arg1_17) -- Line 542, Named "process_while"
			--[[ Upvalues[5]:
				[1]: get_span_upvr (readonly)
				[2]: where_upvr (readonly)
				[3]: var124_upvw (read and write)
				[4]: process_block_upvw (read and write)
				[5]: no_suggestions_upvr (readonly)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 27 start (CF ANALYSIS FAILED)
			local get_span_result1 = get_span_upvr(arg1_17.expression)
			local var128
			if get_span_result1.x <= where_upvr and where_upvr <= get_span_result1.y then
				var128 = "within"
				-- KONSTANTWARNING: GOTO [24] #18
			end
			-- KONSTANTERROR: [0] 1. Error Block 27 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [16] 12. Error Block 32 start (CF ANALYSIS FAILED)
			if where_upvr < get_span_result1.x then
				var128 = "before"
			else
				var128 = "after"
			end
			if var128 == "within" then
				var128 = var124_upvw(arg1_17.expression.value, true)
				return var128
			end
			var128 = arg1_17.block
			if var128 then
				local get_span_result1_2 = get_span_upvr(var128)
				local var130
				if get_span_result1_2.x <= where_upvr and where_upvr <= get_span_result1_2.y then
					var130 = "within"
				elseif where_upvr < get_span_result1_2.x then
					var130 = "before"
				else
					var130 = "after"
				end
				if var130 == "within" then
					var130 = process_block_upvw(var128.value)
					return var130
				end
			end
			do
				return no_suggestions_upvr("")
			end
			-- KONSTANTERROR: [16] 12. Error Block 32 end (CF ANALYSIS FAILED)
		end
		function parse_for(arg1_18) -- Line 555
			--[[ Upvalues[5]:
				[1]: get_span_upvr (readonly)
				[2]: where_upvr (readonly)
				[3]: no_suggestions_upvr (readonly)
				[4]: var117_upvw (read and write)
				[5]: process_function_upvw (read and write)
			]]
			local expression = arg1_18.expression
			if expression then
				local get_span_result1_5 = get_span_upvr(arg1_18.expression)
				if get_span_result1_5.x <= where_upvr then
					if where_upvr <= get_span_result1_5.y then
						expression = "within"
						-- KONSTANTWARNING: GOTO [27] #20
					end
				end
				if where_upvr < get_span_result1_5.x then
					expression = "before"
				else
					expression = "after"
				end
				if expression == "within" then
					expression = arg1_18.expression.value
					if expression == nil then
						expression = no_suggestions_upvr("")
						return expression
					end
					expression = var117_upvw(arg1_18.expression.value)
					return expression
				end
			end
			if arg1_18.call then
				return process_function_upvw(arg1_18.call)
			end
		end
		function process_block_upvw(arg1_19) -- Line 567, Named "process_block"
			--[[ Upvalues[6]:
				[1]: where_upvr (readonly)
				[2]: no_suggestions_upvr (readonly)
				[3]: process_assignment_upvw (read and write)
				[4]: process_command_upvw (read and write)
				[5]: process_return_upvw (read and write)
				[6]: process_while_upvw (read and write)
			]]
			for _, v_5 in arg1_19.body do
				local var137 = v_5
				local span = v_5.span
				local var139
				if span.x <= where_upvr then
					if where_upvr <= span.y then
						var139 = "within"
						-- KONSTANTWARNING: GOTO [29] #22
					end
				end
				if where_upvr < span.x then
					var139 = "before"
				else
					var139 = "after"
				end
				if var139 ~= "before" and var139 ~= "after" then
					if var137 == nil then
						return no_suggestions_upvr("")
					end
					if var137.kind == "if" then
						return parse_if_stat(var137)
					end
					if var137.kind == "assign" then
						return process_assignment_upvw(var137)
					end
					if var137.kind == "command" then
						return process_command_upvw(var137)
					end
					if var137.kind == "return" then
						return process_return_upvw(var137)
					end
					if var137.kind == "for" then
						return parse_for(var137)
					end
					if var137.kind == "while" then
						return process_while_upvw(var137)
					end
					return no_suggestions_upvr("")
				end
			end
			return no_suggestions_upvr("")
		end
		return process_block_upvw(var1_result1_upvr.value)
	end;
}