--[[
    Script: ReplicatedStorage.Packages.Satchel.Packages._Index.roblox_testez@0.4.1.testez.Reporters.TeamCityReporter
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:55
-- Luau version 6, Types version 3
-- Time taken: 0.003253 seconds

local module = {}
local function _(arg1) -- Line 7, Named "teamCityEscape"
	return string.gsub(string.gsub(string.gsub(arg1, "([]|'[])", "|%1"), '\r', "|r"), '\n', "|n")
end
local function teamCityEnterSuite_upvr(arg1) -- Line 14, Named "teamCityEnterSuite"
	return string.format("##teamcity[testSuiteStarted name='%s']", string.gsub(string.gsub(string.gsub(arg1, "([]|'[])", "|%1"), '\r', "|r"), '\n', "|n"))
end
local function teamCityLeaveSuite_upvr(arg1) -- Line 18, Named "teamCityLeaveSuite"
	return string.format("##teamcity[testSuiteFinished name='%s']", string.gsub(string.gsub(string.gsub(arg1, "([]|'[])", "|%1"), '\r', "|r"), '\n', "|n"))
end
local function teamCityEnterCase_upvr(arg1) -- Line 22, Named "teamCityEnterCase"
	return string.format("##teamcity[testStarted name='%s']", string.gsub(string.gsub(string.gsub(arg1, "([]|'[])", "|%1"), '\r', "|r"), '\n', "|n"))
end
local function teamCityLeaveCase_upvr(arg1) -- Line 26, Named "teamCityLeaveCase"
	return string.format("##teamcity[testFinished name='%s']", string.gsub(string.gsub(string.gsub(arg1, "([]|'[])", "|%1"), '\r', "|r"), '\n', "|n"))
end
local function teamCityFailCase_upvr(arg1, arg2) -- Line 30, Named "teamCityFailCase"
	return string.format("##teamcity[testFailed name='%s' message='%s']", string.gsub(string.gsub(string.gsub(arg1, "([]|'[])", "|%1"), '\r', "|r"), '\n', "|n"), string.gsub(string.gsub(string.gsub(arg2, "([]|'[])", "|%1"), '\r', "|r"), '\n', "|n"))
end
local TestEnum_upvr = require(script.Parent.Parent.TestEnum)
local function reportNode_upvr(arg1, arg2, arg3) -- Line 35, Named "reportNode"
	--[[ Upvalues[7]:
		[1]: TestEnum_upvr (readonly)
		[2]: teamCityEnterSuite_upvr (readonly)
		[3]: reportNode_upvr (readonly)
		[4]: teamCityLeaveSuite_upvr (readonly)
		[5]: teamCityEnterCase_upvr (readonly)
		[6]: teamCityFailCase_upvr (readonly)
		[7]: teamCityLeaveCase_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var11 = arg2
	if not var11 then
		var11 = {}
	end
	local var12 = var11
	if arg1.status == TestEnum_upvr.TestStatus.Skipped then
		return var12
	end
	if arg1.planNode.type == TestEnum_upvr.NodeType.Describe then
		table.insert(var12, teamCityEnterSuite_upvr(arg1.planNode.phrase))
		for _, v in ipairs(arg1.children) do
			reportNode_upvr(v, var12, (arg3 or 0) + 1)
			local var16
		end
		table.insert(var16, teamCityLeaveSuite_upvr(arg1.planNode.phrase))
	else
		table.insert(var16, teamCityEnterCase_upvr(arg1.planNode.phrase))
		if arg1.status == TestEnum_upvr.TestStatus.Failure then
			table.insert(var16, teamCityFailCase_upvr(arg1.planNode.phrase, table.concat(arg1.errors, '\n')))
		end
		table.insert(var16, teamCityLeaveCase_upvr(arg1.planNode.phrase))
	end
end
local function reportRoot_upvr(arg1) -- Line 56, Named "reportRoot"
	--[[ Upvalues[1]:
		[1]: reportNode_upvr (readonly)
	]]
	local module_2 = {}
	for _, v_2 in ipairs(arg1.children) do
		reportNode_upvr(v_2, module_2, 0)
	end
	return module_2
end
local function report(arg1) -- Line 66
	--[[ Upvalues[1]:
		[1]: reportRoot_upvr (readonly)
	]]
	return table.concat(reportRoot_upvr(arg1), '\n')
end
local TestService_upvr = game:GetService("TestService")
function module.report(arg1) -- Line 72
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