--[[
    Script: ReplicatedStorage.Packages.Satchel.Packages._Index.roblox_testez@0.4.1.testez.Reporters.TextReporter
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:02
-- Luau version 6, Types version 3
-- Time taken: 0.002416 seconds

local TestEnum_upvr = require(script.Parent.Parent.TestEnum)
local tbl_upvr = {
	[TestEnum_upvr.TestStatus.Success] = '+';
	[TestEnum_upvr.TestStatus.Failure] = '-';
	[TestEnum_upvr.TestStatus.Skipped] = '~';
}
local module_2 = {}
local function compareNodes_upvr(arg1, arg2) -- Line 20, Named "compareNodes"
	local var4
	if arg1.planNode.phrase:lower() >= arg2.planNode.phrase:lower() then
		var4 = false
	else
		var4 = true
	end
	return var4
end
local any_rep_result1_upvr = ' ':rep(3)
local function reportNode_upvr(arg1, arg2, arg3) -- Line 24, Named "reportNode"
	--[[ Upvalues[5]:
		[1]: TestEnum_upvr (readonly)
		[2]: tbl_upvr (readonly)
		[3]: any_rep_result1_upvr (readonly)
		[4]: compareNodes_upvr (readonly)
		[5]: reportNode_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var14 = arg2
	if not var14 then
		var14 = {}
	end
	local var15 = var14
	local var16 = arg3 or 0
	if arg1.status == TestEnum_upvr.TestStatus.Skipped then
		return var15
	end
	local var17
	if arg1.status then
		var17 = "%s[%s] %s":format(any_rep_result1_upvr:rep(var16), tbl_upvr[arg1.status] or '?', arg1.planNode.phrase)
	else
		var17 = "%s%s":format(any_rep_result1_upvr:rep(var16), arg1.planNode.phrase)
	end
	table.insert(var15, var17)
	table.sort(arg1.children, compareNodes_upvr)
	for _, v in ipairs(arg1.children) do
		reportNode_upvr(v, var15, var16 + 1)
		local var21
	end
	return var21
end
local function reportRoot_upvr(arg1) -- Line 59, Named "reportRoot"
	--[[ Upvalues[2]:
		[1]: compareNodes_upvr (readonly)
		[2]: reportNode_upvr (readonly)
	]]
	local module = {}
	table.sort(arg1.children, compareNodes_upvr)
	for _, v_2 in ipairs(arg1.children) do
		reportNode_upvr(v_2, module, 0)
	end
	return module
end
local function report(arg1) -- Line 70
	--[[ Upvalues[1]:
		[1]: reportRoot_upvr (readonly)
	]]
	return table.concat(reportRoot_upvr(arg1), '\n')
end
local TestService_upvr = game:GetService("TestService")
function module_2.report(arg1) -- Line 76
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
return module_2