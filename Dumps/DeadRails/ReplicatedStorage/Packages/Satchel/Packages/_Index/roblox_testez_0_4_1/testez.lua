--[[
    Script: ReplicatedStorage.Packages.Satchel.Packages._Index.roblox_testez@0.4.1.testez
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:33
-- Luau version 6, Types version 3
-- Time taken: 0.001190 seconds

local TestBootstrap_upvr = require(script.TestBootstrap)
local TestPlanner_upvr = require(script.TestPlanner)
local TestRunner_upvr = require(script.TestRunner)
return {
	run = function(arg1, arg2) -- Line 13, Named "run"
		--[[ Upvalues[3]:
			[1]: TestBootstrap_upvr (readonly)
			[2]: TestPlanner_upvr (readonly)
			[3]: TestRunner_upvr (readonly)
		]]
		arg2(TestRunner_upvr.runPlan(TestPlanner_upvr.createPlan(TestBootstrap_upvr:getModules(arg1))))
	end;
	Expectation = require(script.Expectation);
	TestBootstrap = TestBootstrap_upvr;
	TestEnum = require(script.TestEnum);
	TestPlan = require(script.TestPlan);
	TestPlanner = TestPlanner_upvr;
	TestResults = require(script.TestResults);
	TestRunner = TestRunner_upvr;
	TestSession = require(script.TestSession);
	Reporters = {
		TextReporter = require(script.Reporters.TextReporter);
		TextReporterQuiet = require(script.Reporters.TextReporterQuiet);
		TeamCityReporter = require(script.Reporters.TeamCityReporter);
	};
}