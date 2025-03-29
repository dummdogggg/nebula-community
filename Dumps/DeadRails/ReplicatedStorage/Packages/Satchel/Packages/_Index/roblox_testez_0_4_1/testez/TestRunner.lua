--[[
    Script: ReplicatedStorage.Packages.Satchel.Packages._Index.roblox_testez@0.4.1.testez.TestRunner
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:57
-- Luau version 6, Types version 3
-- Time taken: 0.004743 seconds

local TestEnum_upvr = require(script.Parent.TestEnum)
local module_upvr = {
	environment = {};
}
local function wrapExpectContextWithPublicApi_upvr(arg1) -- Line 19, Named "wrapExpectContextWithPublicApi"
	return setmetatable({
		extend = function(...) -- Line 21, Named "extend"
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:extend(...)
		end;
	}, {
		__call = function(arg1_2, ...) -- Line 25, Named "__call"
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			return arg1:startExpectationChain(...)
		end;
	})
end
local TestSession_upvr = require(script.Parent.TestSession)
local LifecycleHooks_upvr = require(script.Parent.LifecycleHooks)
function module_upvr.runPlan(arg1) -- Line 35
	--[[ Upvalues[4]:
		[1]: TestSession_upvr (readonly)
		[2]: LifecycleHooks_upvr (readonly)
		[3]: TestEnum_upvr (readonly)
		[4]: module_upvr (readonly)
	]]
	local any_new_result1 = TestSession_upvr.new(arg1)
	local var10
	if 0 >= #arg1:findNodes(function(arg1_3) -- Line 39
		--[[ Upvalues[1]:
			[1]: TestEnum_upvr (copied, readonly)
		]]
		local var9
		if arg1_3.modifier ~= TestEnum_upvr.NodeModifier.Focus then
			var9 = false
		else
			var9 = true
		end
		return var9
	end) then
		var10 = false
	else
		var10 = true
	end
	any_new_result1.hasFocusNodes = var10
	var10 = module_upvr.runPlanNode
	var10(any_new_result1, arg1, LifecycleHooks_upvr.new())
	var10 = any_new_result1:finalize()
	return var10
end
function module_upvr.runPlanNode(arg1, arg2, arg3) -- Line 54
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: wrapExpectContextWithPublicApi_upvr (readonly)
		[3]: TestEnum_upvr (readonly)
	]]
	local function runCallback_upvr(arg1_4, arg2_2) -- Line 55, Named "runCallback"
		--[[ Upvalues[3]:
			[1]: module_upvr (copied, readonly)
			[2]: wrapExpectContextWithPublicApi_upvr (copied, readonly)
			[3]: arg1 (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		_G.__TESTEZ_RUNNING_TEST__ = true
		local var31_upvw = arg2_2 or ""
		local getfenv_result1 = getfenv(arg1_4)
		local var36_upvw
		for i, v in pairs(module_upvr.environment) do
			getfenv_result1[i] = v
		end
		local var38_upvw
		function getfenv_result1.fail(arg1_5) -- Line 71
			--[[ Upvalues[3]:
				[1]: var36_upvw (read and write)
				[2]: var38_upvw (read and write)
				[3]: var31_upvw (read and write)
			]]
			if arg1_5 == nil then
			end
			var36_upvw = false
			var38_upvw = var31_upvw..debug.traceback(tostring("fail() was called."), 2)
		end
		getfenv_result1.expect = wrapExpectContextWithPublicApi_upvr(arg1:getExpectationContext())
		local any_getContext_result1_upvr = arg1:getContext()
		local xpcall_result1, xpcall_result2 = xpcall(function() -- Line 85
			--[[ Upvalues[2]:
				[1]: arg1_4 (readonly)
				[2]: any_getContext_result1_upvr (readonly)
			]]
			arg1_4(any_getContext_result1_upvr)
		end, function(arg1_6) -- Line 88
			--[[ Upvalues[1]:
				[1]: var31_upvw (read and write)
			]]
			return var31_upvw..debug.traceback(tostring(arg1_6), 2)
		end)
		if not xpcall_result1 then
			var36_upvw = false
			var38_upvw = xpcall_result2
		end
		_G.__TESTEZ_RUNNING_TEST__ = nil
		return var36_upvw, var38_upvw
	end
	arg3:pushHooksFrom(arg2)
	local var63
	for _, v_4 in ipairs(arg3:getBeforeAllHooks()) do
		local runCallback_upvr_result1_2, runCallback_result2 = runCallback_upvr(v_4, "beforeAll hook: ")
		if not runCallback_upvr_result1_2 then
			arg1:addDummyError("beforeAll", runCallback_result2)
		end
	end
	if not nil then
		for _, v_5 in ipairs(arg2.children) do
			if v_5.type == TestEnum_upvr.NodeType.It then
				arg1:pushNode(v_5)
				if arg1:shouldSkip() then
					arg1:setSkipped()
				else
					local runNode_result1, runNode_result2 = (function(arg1_7) -- Line 105, Named "runNode"
						--[[ Upvalues[2]:
							[1]: arg3 (readonly)
							[2]: runCallback_upvr (readonly)
						]]
						for _, v_2 in ipairs(arg3:getBeforeEachHooks()) do
							local runCallback_upvr_result1_3, runCallback_upvr_result2 = runCallback_upvr(v_2, "beforeEach hook: ")
							if not runCallback_upvr_result1_3 then
								return false, runCallback_upvr_result2
							end
						end
						local runCallback_result1_2, runCallback_upvr_result2_2 = runCallback_upvr(arg1_7.callback)
						for _, v_3 in ipairs(arg3:getAfterEachHooks()) do
							local runCallback_result1, runCallback_result2_2 = runCallback_upvr(v_3, "afterEach hook: ")
							if not runCallback_result1 then
								if not runCallback_result1_2 then
									return false, runCallback_upvr_result2_2.."\nWhile cleaning up the failed test another error was found:\n"..runCallback_result2_2
								end
								return false, runCallback_result2_2
							end
						end
						if not runCallback_result1_2 then
							return false, runCallback_upvr_result2_2
						end
						return true, nil
					end)(v_5)
					if runNode_result1 then
						arg1:setSuccess()
					else
						arg1:setError(runNode_result2)
					end
				end
				arg1:popNode()
			elseif v_5.type == TestEnum_upvr.NodeType.Describe then
				arg1:pushNode(v_5)
				module_upvr.runPlanNode(arg1, v_5, arg3)
				if v_5.loadError then
					arg1:setError("Error during planning: "..v_5.loadError)
				else
					arg1:setStatusFromChildren()
				end
				arg1:popNode()
			end
		end
	end
	for _, v_6 in ipairs(arg3:getAfterAllHooks()) do
		local runCallback_upvr_result1, runCallback_upvr_result2_3 = runCallback_upvr(v_6, "afterAll hook: ")
		if not runCallback_upvr_result1 then
			arg1:addDummyError("afterAll", runCallback_upvr_result2_3)
		end
	end
	arg3:popHooks()
end
return module_upvr