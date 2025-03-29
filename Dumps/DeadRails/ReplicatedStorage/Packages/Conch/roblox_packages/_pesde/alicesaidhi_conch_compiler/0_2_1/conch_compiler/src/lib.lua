--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_compiler.0.2.1.conch_compiler.src.lib
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:18
-- Luau version 6, Types version 3
-- Time taken: 0.008232 seconds

local function _(arg1, arg2) -- Line 11, Named "DEFINE_LOCAL"
	table.insert(arg1.locals, arg2)
end
local function compile_upvr(arg1, arg2) -- Line 29, Named "compile"
	--[[ Upvalues[1]:
		[1]: compile_upvr (readonly)
	]]
	local instructions_upvr = arg2.instructions
	local var2_upvw = #instructions_upvr + 1
	local var3_upvw = false
	local function _(arg1_2) -- Line 37, Named "INSERT"
		--[[ Upvalues[2]:
			[1]: instructions_upvr (readonly)
			[2]: var2_upvw (read and write)
		]]
		instructions_upvr[var2_upvw] = arg1_2
		var2_upvw += 1
	end
	local function GET_VALUE_upvr(arg1_3) -- Line 42, Named "GET_VALUE"
		--[[ Upvalues[3]:
			[1]: arg2 (readonly)
			[2]: instructions_upvr (readonly)
			[3]: var2_upvw (read and write)
		]]
		local table_find_result1 = table.find(arg2.locals, arg1_3)
		if table_find_result1 then
			instructions_upvr[var2_upvw] = {
				kind = "push_local";
				index = table_find_result1;
			}
			var2_upvw += 1
		else
			local tbl_2 = {
				kind = "push_global";
			}
			tbl_2.name = arg1_3
			instructions_upvr[var2_upvw] = tbl_2
			var2_upvw += 1
		end
	end
	local function SET_VALUE_upvr(arg1_4) -- Line 51, Named "SET_VALUE"
		--[[ Upvalues[3]:
			[1]: arg2 (readonly)
			[2]: instructions_upvr (readonly)
			[3]: var2_upvw (read and write)
		]]
		local table_find_result1_2 = table.find(arg2.locals, arg1_4)
		if table_find_result1_2 then
			instructions_upvr[var2_upvw] = {
				kind = "set_local";
				index = table_find_result1_2;
			}
			var2_upvw += 1
		else
			local tbl_6 = {
				kind = "set_global";
			}
			tbl_6.name = arg1_4
			instructions_upvr[var2_upvw] = tbl_6
			var2_upvw += 1
		end
	end
	local compile_var_upvw
	local compile_block_upvw
	local compile_command_upvw
	local compile_lambda_upvw
	local compile_table_upvw
	local compile_vector_upvw
	local function compile_expression_upvw(arg1_5) -- Line 73, Named "compile_expression"
		--[[ Upvalues[8]:
			[1]: instructions_upvr (readonly)
			[2]: var2_upvw (read and write)
			[3]: compile_command_upvw (read and write)
			[4]: compile_expression_upvw (read and write)
			[5]: compile_lambda_upvw (read and write)
			[6]: compile_table_upvw (read and write)
			[7]: compile_var_upvw (read and write)
			[8]: compile_vector_upvw (read and write)
		]]
		if arg1_5.kind == "boolean" then
			local tbl_5 = {}
			local var17 = "push_boolean"
			tbl_5.kind = var17
			if arg1_5.token.kind == "true" then
				var17 = true
			else
				var17 = false
			end
			tbl_5.b = var17
			instructions_upvr[var2_upvw] = tbl_5
			var2_upvw += 1
		else
			if arg1_5.kind == "number" then
				instructions_upvr[var2_upvw] = {
					kind = "push_number";
					n = assert(tonumber(arg1_5.token.text));
				}
				var2_upvw += 1
				return
			end
			if arg1_5.kind == "evaluate" then
				if arg1_5.body.kind == "command" then
					compile_command_upvw(arg1_5.body, 1)
				else
					compile_expression_upvw(arg1_5.body)
				end
			end
			if arg1_5.kind == "lambda" then
				compile_lambda_upvw(arg1_5.body)
				return
			end
			if arg1_5.kind == "nil" then
				instructions_upvr[var2_upvw] = {
					kind = "push_nil";
				}
				var2_upvw += 1
				return
			end
			if arg1_5.kind == "string" then
				instructions_upvr[var2_upvw] = {
					kind = "push_string";
					s = string.sub(arg1_5.token.text, 2, -2);
				}
				var2_upvw += 1
				return
			end
			if arg1_5.kind == "table" then
				compile_table_upvw(arg1_5.table)
				return
			end
			if arg1_5.kind == "var" then
				compile_var_upvw(arg1_5.var)
				return
			end
			if arg1_5.kind == "vector" then
				compile_vector_upvw(arg1_5)
			end
		end
	end
	function compile_vector_upvw(arg1_6) -- Line 111, Named "compile_vector"
		--[[ Upvalues[3]:
			[1]: compile_expression_upvw (read and write)
			[2]: instructions_upvr (readonly)
			[3]: var2_upvw (read and write)
		]]
		local _1 = arg1_6.contents[1]
		local _2 = arg1_6.contents[2]
		local _3 = arg1_6.contents[3]
		if _1 then
			compile_expression_upvw(_1)
		else
			instructions_upvr[var2_upvw] = {
				kind = "push_number";
				n = 0;
			}
			var2_upvw += 1
		end
		if _2 then
			compile_expression_upvw(_2)
		else
			instructions_upvr[var2_upvw] = {
				kind = "push_number";
				n = 0;
			}
			var2_upvw += 1
		end
		if _3 then
			compile_expression_upvw(_3)
		else
			instructions_upvr[var2_upvw] = {
				kind = "push_number";
				n = 0;
			}
			var2_upvw += 1
		end
		instructions_upvr[var2_upvw] = {
			kind = "push_vector";
		}
		var2_upvw += 1
	end
	function compile_table_upvw(arg1_7) -- Line 137, Named "compile_table"
		--[[ Upvalues[3]:
			[1]: instructions_upvr (readonly)
			[2]: var2_upvw (read and write)
			[3]: compile_expression_upvw (read and write)
		]]
		instructions_upvr[var2_upvw] = {
			kind = "push_table";
			alloc = 1;
		}
		var2_upvw += 1
		for _, v in arg1_7.fields do
			if v.kind == "exprkey" then
				compile_expression_upvw(v.key)
				compile_expression_upvw(v.value)
				instructions_upvr[var2_upvw] = {
					kind = "set_table";
				}
				var2_upvw += 1
			elseif v.kind == "namekey" then
				instructions_upvr[var2_upvw] = {
					kind = "push_string";
					s = v.name.text;
				}
				var2_upvw += 1
				compile_expression_upvw(v.value)
				instructions_upvr[var2_upvw] = {
					kind = "set_table";
				}
				var2_upvw += 1
			elseif v.kind == "nokey" then
				instructions_upvr[var2_upvw] = {
					kind = "push_number";
					n = 1;
				}
				var2_upvw += 1
				compile_expression_upvw(v.value)
				instructions_upvr[var2_upvw] = {
					kind = "set_table";
				}
				var2_upvw += 1
			end
		end
	end
	function compile_command_upvw(arg1_8, arg2_2) -- Line 159, Named "compile_command"
		--[[ Upvalues[4]:
			[1]: compile_var_upvw (read and write)
			[2]: compile_expression_upvw (read and write)
			[3]: instructions_upvr (readonly)
			[4]: var2_upvw (read and write)
		]]
		compile_var_upvw(arg1_8.prefix)
		for _, v_2 in arg1_8.arguments do
			compile_expression_upvw(v_2)
		end
		instructions_upvr[var2_upvw] = {
			kind = "call";
			arguments = #arg1_8.arguments;
			results = arg2_2 or math.huge;
		}
		var2_upvw += 1
	end
	local var37_upvw = compile_command_upvw
	function compile_lambda_upvw(arg1_9) -- Line 172, Named "compile_lambda"
		--[[ Upvalues[4]:
			[1]: arg2 (readonly)
			[2]: compile_upvr (copied, readonly)
			[3]: instructions_upvr (readonly)
			[4]: var2_upvw (read and write)
		]]
		local tbl_3 = {
			locals = {};
			upvalues = {};
			instructions = {};
		}
		tbl_3.up = arg2
		for i_3, v_3 in arg1_9.arguments do
			table.insert(tbl_3.locals, v_3.text)
			table.insert(tbl_3.instructions, {
				kind = "set_local";
				index = i_3;
			})
		end
		compile_upvr(arg1_9.block, tbl_3)
		instructions_upvr[var2_upvw] = {
			kind = "push_function";
			body = tbl_3.instructions;
			arguments = #arg1_9.arguments;
		}
		var2_upvw += 1
	end
	function compile_var_upvw(arg1_10) -- Line 193, Named "compile_var"
		--[[ Upvalues[5]:
			[1]: instructions_upvr (readonly)
			[2]: var2_upvw (read and write)
			[3]: GET_VALUE_upvr (readonly)
			[4]: var37_upvw (read and write)
			[5]: compile_expression_upvw (read and write)
		]]
		local prefix = arg1_10.prefix
		if prefix.kind == "global" then
			instructions_upvr[var2_upvw] = {
				kind = "push_cmd";
				name = prefix.token.text;
			}
			var2_upvw += 1
		elseif prefix.kind == "name" then
			GET_VALUE_upvr(prefix.name.text)
		elseif prefix.kind == "paren" then
			if prefix.expr.kind == "command" then
				var37_upvw(prefix.expr)
			else
				compile_expression_upvw(prefix.expr)
			end
		end
		for _, v_4 in arg1_10.suffixes do
			if v_4.kind == "exprindex" then
				if v_4.expr.kind == "command" then
					var37_upvw(v_4.expr, 1)
				else
					compile_expression_upvw(v_4.expr)
				end
				instructions_upvr[var2_upvw] = {
					kind = "index";
				}
				var2_upvw += 1
			elseif v_4.kind == "nameindex" then
				instructions_upvr[var2_upvw] = {
					kind = "push_string";
					s = v_4.name.text;
				}
				var2_upvw += 1
				instructions_upvr[var2_upvw] = {
					kind = "index";
				}
				var2_upvw += 1
			end
		end
	end
	local function compile_assignment_upvw(arg1_11) -- Line 223, Named "compile_assignment"
		--[[ Upvalues[4]:
			[1]: var37_upvw (read and write)
			[2]: compile_expression_upvw (read and write)
			[3]: instructions_upvr (readonly)
			[4]: var2_upvw (read and write)
		]]
		local right = arg1_11.right
		if right.kind == "command" then
			var37_upvw(right)
		else
			compile_expression_upvw(right)
		end
		instructions_upvr[var2_upvw] = {
			kind = "set_global";
			name = arg1_11.left.text;
		}
		var2_upvw += 1
	end
	local function compile_last_upvw(arg1_12) -- Line 235, Named "compile_last"
		--[[ Upvalues[5]:
			[1]: var37_upvw (read and write)
			[2]: compile_expression_upvw (read and write)
			[3]: instructions_upvr (readonly)
			[4]: var2_upvw (read and write)
			[5]: var3_upvw (read and write)
		]]
		if arg1_12.kind == "return" then
			for _, v_5 in arg1_12.values do
				if v_5.kind == "command" then
					var37_upvw(v_5)
				else
					compile_expression_upvw(v_5)
				end
			end
			instructions_upvr[var2_upvw] = {
				kind = "return";
			}
			var2_upvw += 1
		else
			if arg1_12.kind == "break" then
				assert(var3_upvw, "cannot use continue outside a loop")
				instructions_upvr[var2_upvw] = {
					kind = "goto-pending";
					type = "break";
				}
				var2_upvw += 1
				return
			end
			if arg1_12.kind == "continue" then
				assert(var3_upvw, "cannot use continue outside a loop")
				instructions_upvr[var2_upvw] = {
					kind = "goto";
					to = var3_upvw;
				}
				var2_upvw += 1
				return
			end
			error(`unimplemented {arg1_12.kind}`)
		end
	end
	local function compile_if_upvw(arg1_13) -- Line 258, Named "compile_if"
		--[[ Upvalues[5]:
			[1]: var2_upvw (read and write)
			[2]: var37_upvw (read and write)
			[3]: compile_expression_upvw (read and write)
			[4]: instructions_upvr (readonly)
			[5]: compile_block_upvw (read and write)
		]]
		for _, v_6 in arg1_13.ifs do
			if v_6.condition.kind == "command" then
				var37_upvw(v_6.condition, 1)
			else
				compile_expression_upvw(v_6.condition)
			end
			instructions_upvr[var2_upvw] = {
				kind = "goto-pending";
				type = "next-if";
			}
			var2_upvw += 1
			compile_block_upvw(v_6.block)
			instructions_upvr[var2_upvw] = {
				kind = "goto-pending";
				type = "if-end";
			}
			var2_upvw += 1
			for i_7 = var2_upvw - 1, var2_upvw, -1 do
				local var68 = instructions_upvr[i_7]
				if var68.kind == "goto-pending" and var68.type == "next-if" then
					instructions_upvr[i_7] = {
						kind = "jump_if";
						to = var2_upvw;
					}
				end
			end
		end
		if arg1_13.fallback then
			compile_block_upvw(arg1_13.fallback)
		end
		for i_8 = var2_upvw - 1, var2_upvw, -1 do
			local var70 = instructions_upvr[i_8]
			if var70.kind == "goto-pending" and var70.type == "if-end" then
				instructions_upvr[i_8] = {
					kind = "goto";
					to = var2_upvw;
				}
			end
		end
	end
	local function compile_for_upvw(arg1_14) -- Line 301, Named "compile_for"
		--[[ Upvalues[8]:
			[1]: var3_upvw (read and write)
			[2]: var37_upvw (read and write)
			[3]: compile_expression_upvw (read and write)
			[4]: instructions_upvr (readonly)
			[5]: var2_upvw (read and write)
			[6]: SET_VALUE_upvr (readonly)
			[7]: GET_VALUE_upvr (readonly)
			[8]: compile_block_upvw (read and write)
		]]
		if arg1_14.expression.kind == "command" then
			var37_upvw(arg1_14.expression, 1)
		else
			compile_expression_upvw(arg1_14.expression)
		end
		instructions_upvr[var2_upvw] = {
			kind = "turn-into-iterator";
		}
		var2_upvw += 1
		SET_VALUE_upvr("--iterator")
		local var75 = var2_upvw
		var3_upvw = var75
		GET_VALUE_upvr("--iterator")
		instructions_upvr[var2_upvw] = {
			kind = "call";
			arguments = 0;
			results = math.max(1, #arg1_14.call.arguments);
		}
		var2_upvw += 1
		local tbl = {
			kind = "jump_if_not_nil";
			index = 1;
			to = 0;
		}
		instructions_upvr[var2_upvw] = tbl
		var2_upvw += 1
		for i_9 = #arg1_14.call.arguments, 1, -1 do
			SET_VALUE_upvr(arg1_14.call.arguments[i_9].text)
		end
		instructions_upvr[var2_upvw] = {
			kind = "reset";
		}
		var2_upvw += 1
		compile_block_upvw(arg1_14.call.block)
		instructions_upvr[var2_upvw] = {
			kind = "goto";
			to = var75;
		}
		var2_upvw += 1
		tbl.to = var2_upvw
		for i_10 = var2_upvw - 1, var2_upvw, -1 do
			local var80 = instructions_upvr[i_10]
			if var80.kind == "goto-pending" and var80.type == "break" then
				instructions_upvr[i_10] = {
					kind = "goto";
					to = var2_upvw;
				}
			end
		end
		var3_upvw = var3_upvw
	end
	local function compile_while_upvw(arg1_15) -- Line 349, Named "compile_while"
		--[[ Upvalues[6]:
			[1]: var2_upvw (read and write)
			[2]: var3_upvw (read and write)
			[3]: var37_upvw (read and write)
			[4]: compile_expression_upvw (read and write)
			[5]: instructions_upvr (readonly)
			[6]: compile_block_upvw (read and write)
		]]
		local var83 = var2_upvw
		var3_upvw = var83
		if arg1_15.expression.kind == "command" then
			var37_upvw(arg1_15.expression, 0)
		else
			compile_expression_upvw(arg1_15.expression)
		end
		local tbl_4 = {
			kind = "jump_if";
			index = 1;
			to = 0;
		}
		instructions_upvr[var2_upvw] = tbl_4
		var2_upvw += 1
		compile_block_upvw(arg1_15.block)
		instructions_upvr[var2_upvw] = {
			kind = "goto";
			to = var83;
		}
		var2_upvw += 1
		tbl_4.to = var2_upvw
		for i_11 = var2_upvw - 1, var2_upvw, -1 do
			local var86 = instructions_upvr[i_11]
			if var86.kind == "goto-pending" and var86.type == "break" then
				instructions_upvr[i_11] = {
					kind = "goto";
					to = var2_upvw;
				}
			end
		end
		var3_upvw = var3_upvw
	end
	function compile_block_upvw(arg1_16) -- Line 383, Named "compile_block"
		--[[ Upvalues[7]:
			[1]: compile_assignment_upvw (read and write)
			[2]: arg2 (readonly)
			[3]: var37_upvw (read and write)
			[4]: compile_for_upvw (read and write)
			[5]: compile_if_upvw (read and write)
			[6]: compile_while_upvw (read and write)
			[7]: compile_last_upvw (read and write)
		]]
		for _, v_7 in arg1_16.body do
			if v_7.kind == "assign" then
				compile_assignment_upvw(v_7, arg2)
			elseif v_7.kind == "command" then
				var37_upvw(v_7, 0)
			elseif v_7.kind == "for" then
				compile_for_upvw(v_7)
			elseif v_7.kind == "if" then
				compile_if_upvw(v_7)
			elseif v_7.kind == "while" then
				compile_while_upvw(v_7)
			else
				error(`not implemented {v_7.kind}`)
			end
		end
		if arg1_16.last_statement then
			compile_last_upvw(arg1_16.last_statement)
		end
	end
	compile_block_upvw(arg1)
	return arg2.instructions
end
return compile_upvr