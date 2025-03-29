--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_vm.0.2.0.conch_vm.src.lib
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:56
-- Luau version 6, Types version 3
-- Time taken: 0.002400 seconds

local function _(arg1) -- Line 8, Named "error_handler"
	error(arg1)
end
local function LOG_upvr(...) -- Line 10, Named "LOG"
end
return function() -- Line 15, Named "create_vm"
	--[[ Upvalues[1]:
		[1]: LOG_upvr (readonly)
	]]
	local os_clock_result1_upvw = os.clock()
	local tbl_upvw_2 = {}
	local tbl_upvw_3 = {}
	local tbl_upvw = {}
	local table_create_result1_upvw = table.create(255)
	local var6_upvw = 1
	local var7_upvw = 0
	local var8_upvw = 0
	local function _(arg1) -- Line 25, Named "PUSH"
		--[[ Upvalues[2]:
			[1]: table_create_result1_upvw (read and write)
			[2]: var8_upvw (read and write)
		]]
		table_create_result1_upvw[var8_upvw + 1] = arg1
		var8_upvw += 1
	end
	local function _() -- Line 31, Named "POP"
		--[[ Upvalues[2]:
			[1]: var8_upvw (read and write)
			[2]: table_create_result1_upvw (read and write)
		]]
		var8_upvw -= 1
		return table_create_result1_upvw[var8_upvw + 1]
	end
	local function POPN_upvr(arg1) -- Line 37, Named "POPN"
		--[[ Upvalues[2]:
			[1]: var8_upvw (read and write)
			[2]: table_create_result1_upvw (read and write)
		]]
		var8_upvw -= arg1
		return unpack(table_create_result1_upvw, var8_upvw - arg1 + 1, var8_upvw)
	end
	local function _(arg1) -- Line 45, Named "GET"
		--[[ Upvalues[2]:
			[1]: var8_upvw (read and write)
			[2]: table_create_result1_upvw (read and write)
		]]
		local var9
		if var9 < 0 then
			var9 = var8_upvw + var9 + 1
		end
		if var8_upvw < var9 then
			return nil
		end
		return table_create_result1_upvw[var9]
	end
	local function call_success_upvr(arg1, arg2, arg3, ...) -- Line 51, Named "call_success"
		--[[ Upvalues[2]:
			[1]: table_create_result1_upvw (read and write)
			[2]: var8_upvw (read and write)
		]]
		if not arg3 then
			error(`{table.concat({...}, ' ')}`, 0)
		end
		for i = 1, math.min(arg1, select('#', ...)) do
			table_create_result1_upvw[var8_upvw + 1] = select(i, ...)
			var8_upvw += 1
		end
	end
	local function process_upvr(arg1) -- Line 64, Named "process"
		--[[ Upvalues[12]:
			[1]: os_clock_result1_upvw (read and write)
			[2]: POPN_upvr (readonly)
			[3]: var8_upvw (read and write)
			[4]: table_create_result1_upvw (read and write)
			[5]: call_success_upvr (readonly)
			[6]: var6_upvw (read and write)
			[7]: tbl_upvw (read and write)
			[8]: tbl_upvw_2 (read and write)
			[9]: tbl_upvw_3 (read and write)
			[10]: var7_upvw (read and write)
			[11]: process_upvr (readonly)
			[12]: LOG_upvr (copied, readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [7] 6. Error Block 2 start (CF ANALYSIS FAILED)
		error("reached execution time limit", 0)
		-- KONSTANTERROR: [7] 6. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [12] 10. Error Block 3 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [12] 10. Error Block 3 end (CF ANALYSIS FAILED)
	end
	os_clock_result1_upvw = os.clock()
	return {
		commands = tbl_upvw;
		globals = tbl_upvw_3;
		locals = tbl_upvw_2;
		run = function(arg1) -- Line 205, Named "run"
			--[[ Upvalues[6]:
				[1]: os_clock_result1_upvw (read and write)
				[2]: var6_upvw (read and write)
				[3]: var7_upvw (read and write)
				[4]: process_upvr (readonly)
				[5]: var8_upvw (read and write)
				[6]: table_create_result1_upvw (read and write)
			]]
			os_clock_result1_upvw = os.clock()
			var6_upvw = 1
			var7_upvw = #arg1
			while var6_upvw <= var7_upvw do
				process_upvr(arg1[var6_upvw])
				var6_upvw += 1
			end
			var8_upvw = 0
			return var8_upvw, unpack(table_create_result1_upvw, 1, var8_upvw)
		end;
	}
end