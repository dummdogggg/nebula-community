--[[
    Script: ReplicatedStorage.Packages.Satchel.Packages._Index.roblox_testez@0.4.1.testez.Reporters.TextReporterQuiet
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:03
-- Luau version 6, Types version 3
-- Time taken: 0.002005 seconds

local TestEnum_upvr = require(script.Parent.Parent.TestEnum)
local tbl_upvr = {
	[TestEnum_upvr.TestStatus.Success] = '+';
	[TestEnum_upvr.TestStatus.Failure] = '-';
	[TestEnum_upvr.TestStatus.Skipped] = '~';
}
local module = {}
local any_rep_result1_upvr = ' ':rep(3)
local function reportNode_upvr(arg1, arg2, arg3) -- Line 22, Named "reportNode"
	--[[ Upvalues[4]:
		[1]: TestEnum_upvr (readonly)
		[2]: tbl_upvr (readonly)
		[3]: any_rep_result1_upvr (readonly)
		[4]: reportNode_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var13 = arg2
	if not var13 then
		var13 = {}
	end
	local var14 = var13
	local var15 = arg3 or 0
	if arg1.status == TestEnum_upvr.TestStatus.Skipped then
		return var14
	end
	local var16
	if arg1.status ~= TestEnum_upvr.TestStatus.Success then
		var16 = "%s[%s] %s":format(any_rep_result1_upvr:rep(var15), tbl_upvr[arg1.status] or '?', arg1.planNode.phrase)
	end
	table.insert(var14, var16)
	for _, v in ipairs(arg1.children) do
		reportNode_upvr(v, var14, var15 + 1)
		local var20
	end
	return var20
end
local function reportRoot_upvr(arg1) -- Line 51, Named "reportRoot"
	--[[ Upvalues[1]:
		[1]: reportNode_upvr (readonly)
	]]
	local module_2 = {}
	for _, v_2 in ipairs(arg1.children) do
		reportNode_upvr(v_2, module_2, 0)
	end
	return module_2
end
local function report(arg1) -- Line 61
	--[[ Upvalues[1]:
		[1]: reportRoot_upvr (readonly)
	]]
	return table.concat(reportRoot_upvr(arg1), '\n')
end
local TestService_upvr = game:GetService("TestService")
function module.report(arg1) -- Line 67
	--[[ Upvalues[2]:
		[1]: reportRoot_upvr (readonly)
		[2]: TestService_upvr (readonly)
	]]
	print(table.concat({"Test results:", table.concat(reportRoot_upvr(arg1), '\n'), "%d passed, %d failed, %d skipped":format(arg1.successCount, arg1.failureCount, arg1.skippedCount)}, '\n'))
	if 0 < arg1.failureCount then
		print("%d test nodes reported failures.":format(arg1.failureCount))
	end
	if 0 < #arg1.errors then
		print("Errors reported by tests:")
		print("")
		for _, v_3 in ipairs(arg1.errors) do
			TestService_upvr:Error(v_3)
			print("")
		end
	end
end
return module