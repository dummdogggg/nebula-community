--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CommonUtils.CameraWrapper.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:13
-- Luau version 6, Types version 3
-- Time taken: 0.000959 seconds

local CorePackages = game:GetService("CorePackages")
local JestGlobals = require(CorePackages.Packages.Dev.JestGlobals)
local it_upvr = JestGlobals.it
local CameraWrapper_upvr = require(script.Parent.CameraWrapper)
local expect_upvr = JestGlobals.expect
local waitForEvents_upvr = require(CorePackages.Workspace.Packages.TestUtils).DeferredLuaHelpers.waitForEvents
JestGlobals.describe("CameraWrapper", function() -- Line 12
	--[[ Upvalues[4]:
		[1]: it_upvr (readonly)
		[2]: CameraWrapper_upvr (readonly)
		[3]: expect_upvr (readonly)
		[4]: waitForEvents_upvr (readonly)
	]]
	it_upvr("should instantiate", function() -- Line 13
		--[[ Upvalues[2]:
			[1]: CameraWrapper_upvr (copied, readonly)
			[2]: expect_upvr (copied, readonly)
		]]
		expect_upvr(CameraWrapper_upvr.new()).never.toBeNil()
	end)
	it_upvr("should return updated camera", function() -- Line 19
		--[[ Upvalues[3]:
			[1]: CameraWrapper_upvr (copied, readonly)
			[2]: expect_upvr (copied, readonly)
			[3]: waitForEvents_upvr (copied, readonly)
		]]
		local any_new_result1 = CameraWrapper_upvr.new()
		any_new_result1:Enable()
		local Camera = Instance.new("Camera")
		Camera.Parent = game.Workspace
		expect_upvr(any_new_result1:getCamera()).toBe(game.Workspace.CurrentCamera)
		expect_upvr(any_new_result1:getCamera()).never.toBe(Camera)
		game.Workspace.CurrentCamera = Camera
		waitForEvents_upvr()
		expect_upvr(any_new_result1:getCamera()).toBe(game.Workspace.CurrentCamera)
		expect_upvr(any_new_result1:getCamera()).toBe(Camera)
	end)
end)