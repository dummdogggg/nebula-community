--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.CameraToggleStateController
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:51
-- Luau version 6, Types version 3
-- Time taken: 0.002033 seconds

local module_upvr_2 = require(script.Parent:WaitForChild("CameraUI"))
module_upvr_2.setCameraModeToastEnabled(false)
local module_upvr = require(script.Parent:WaitForChild("CameraInput"))
local var4_upvw = false
local var5_upvw = false
local tick_result1_upvw = tick()
local var7_upvw = false
local var8_upvw = false
local module_upvr_3 = require(script.Parent:WaitForChild("CameraUtils"))
return function(arg1) -- Line 20
	--[[ Upvalues[8]:
		[1]: module_upvr (readonly)
		[2]: var4_upvw (read and write)
		[3]: var5_upvw (read and write)
		[4]: tick_result1_upvw (read and write)
		[5]: module_upvr_2 (readonly)
		[6]: var7_upvw (read and write)
		[7]: var8_upvw (read and write)
		[8]: module_upvr_3 (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local any_getTogglePan_result1 = module_upvr.getTogglePan()
	if arg1 and any_getTogglePan_result1 ~= var4_upvw then
		var5_upvw = true
	end
	if var4_upvw ~= any_getTogglePan_result1 or 3 < tick() - tick_result1_upvw then
		local var11 = any_getTogglePan_result1
		if var11 then
			if tick() - tick_result1_upvw >= 3 then
			else
			end
		end
		module_upvr_2.setCameraModeToastOpen(true)
		if any_getTogglePan_result1 then
			var5_upvw = false
		end
		tick_result1_upvw = tick()
		var4_upvw = any_getTogglePan_result1
	end
	if arg1 ~= var7_upvw then
		if arg1 then
			var8_upvw = module_upvr.getTogglePan()
			module_upvr.setTogglePan(true)
		elseif not var5_upvw then
			module_upvr.setTogglePan(var8_upvw)
		end
	end
	if arg1 then
		if module_upvr.getTogglePan() then
			module_upvr_3.setMouseIconOverride("rbxasset://textures/Cursors/CrossMouseIcon.png")
			module_upvr_3.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter)
			module_upvr_3.setRotationTypeOverride(Enum.RotationType.CameraRelative)
		else
			module_upvr_3.restoreMouseIcon()
			module_upvr_3.restoreMouseBehavior()
			module_upvr_3.setRotationTypeOverride(Enum.RotationType.CameraRelative)
		end
	elseif module_upvr.getTogglePan() then
		module_upvr_3.setMouseIconOverride("rbxasset://textures/Cursors/CrossMouseIcon.png")
		module_upvr_3.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter)
		module_upvr_3.setRotationTypeOverride(Enum.RotationType.MovementRelative)
	elseif module_upvr.getHoldPan() then
		module_upvr_3.restoreMouseIcon()
		module_upvr_3.setMouseBehaviorOverride(Enum.MouseBehavior.LockCurrentPosition)
		module_upvr_3.setRotationTypeOverride(Enum.RotationType.MovementRelative)
	else
		module_upvr_3.restoreMouseIcon()
		module_upvr_3.restoreMouseBehavior()
		module_upvr_3.restoreRotationType()
	end
	var7_upvw = arg1
end