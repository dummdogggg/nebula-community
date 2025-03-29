--[[
    Script: ReplicatedStorage.Client.Handlers.MouseLockHandler
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:31
-- Luau version 6, Types version 3
-- Time taken: 0.002162 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Satchel_upvr = require(ReplicatedStorage.Packages.Satchel)
local MouseController_upvr = require(ReplicatedStorage.Client.Controllers.MouseController)
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local module_upvr = {}
local LocalPlayerObjectsContainer_upvr = require(ReplicatedStorage.Client.LocalPlayerObjectsContainer)
function module_upvr.start() -- Line 20
	--[[ Upvalues[3]:
		[1]: LocalPlayerObjectsContainer_upvr (readonly)
		[2]: module_upvr (readonly)
		[3]: LocalPlayer_upvr (readonly)
	]]
	local any_getCharacterLoadedWrapper_result1 = LocalPlayerObjectsContainer_upvr.getCharacterLoadedWrapper()
	if any_getCharacterLoadedWrapper_result1:isLoaded() then
		module_upvr._onCharacterLoaded(LocalPlayer_upvr.Character)
	end
	any_getCharacterLoadedWrapper_result1.loaded:Connect(function(arg1) -- Line 27
		--[[ Upvalues[1]:
			[1]: module_upvr (copied, readonly)
		]]
		module_upvr._onCharacterLoaded(arg1)
	end)
	module_upvr._listenForWindowFocused()
	module_upvr._listenForLockToggle()
	module_upvr._listenForBackpackToggle()
end
local UserInputService_upvr = game:GetService("UserInputService")
function module_upvr._listenForWindowFocused() -- Line 36
	--[[ Upvalues[3]:
		[1]: UserInputService_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
		[3]: MouseController_upvr (readonly)
	]]
	UserInputService_upvr.WindowFocused:Connect(function() -- Line 37
		--[[ Upvalues[2]:
			[1]: LocalPlayer_upvr (copied, readonly)
			[2]: MouseController_upvr (copied, readonly)
		]]
		if LocalPlayer_upvr.CameraMode == Enum.CameraMode.LockFirstPerson then
			MouseController_upvr.setMouseBehavior(Enum.MouseBehavior.LockCenter)
		end
	end)
end
local ContextActionService_upvr = game:GetService("ContextActionService")
function module_upvr._listenForLockToggle() -- Line 44
	--[[ Upvalues[2]:
		[1]: ContextActionService_upvr (readonly)
		[2]: MouseController_upvr (readonly)
	]]
	ContextActionService_upvr:BindAction("ToggleMouseLock", function(arg1, arg2) -- Line 45
		--[[ Upvalues[1]:
			[1]: MouseController_upvr (copied, readonly)
		]]
		if arg2 ~= Enum.UserInputState.Begin then
			return Enum.ContextActionResult.Pass
		end
		MouseController_upvr.toggleMouseBehavior()
		return Enum.ContextActionResult.Sink
	end, false, Enum.KeyCode.RightControl)
end
function module_upvr._listenForBackpackToggle() -- Line 56
	--[[ Upvalues[2]:
		[1]: Satchel_upvr (readonly)
		[2]: MouseController_upvr (readonly)
	]]
	Satchel_upvr:GetStateChangedEvent().Event:Connect(function(arg1) -- Line 57
		--[[ Upvalues[2]:
			[1]: Satchel_upvr (copied, readonly)
			[2]: MouseController_upvr (copied, readonly)
		]]
		if not Satchel_upvr:GetBackpackEnabled() then
		else
			if arg1 then
				MouseController_upvr.setMouseBehavior(Enum.MouseBehavior.Default, true)
				MouseController_upvr.setMouseBehaviorLocked(false)
				return
			end
			MouseController_upvr.setMouseBehavior(Enum.MouseBehavior.LockCenter, true)
			MouseController_upvr.setMouseBehaviorLocked(true)
		end
	end)
end
local Tag_upvr = require(ReplicatedStorage.Shared.SharedConstants.Tag)
function module_upvr._onCharacterLoaded(arg1) -- Line 74
	--[[ Upvalues[5]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: MouseController_upvr (readonly)
		[3]: Satchel_upvr (readonly)
		[4]: Tag_upvr (readonly)
		[5]: module_upvr (readonly)
	]]
	LocalPlayer_upvr.CameraMode = Enum.CameraMode.LockFirstPerson
	MouseController_upvr.setMouseBehavior(Enum.MouseBehavior.LockCenter, true)
	Satchel_upvr:SetBackpackEnabled(true)
	local class_Humanoid = arg1:FindFirstChildOfClass("Humanoid")
	if class_Humanoid then
		class_Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function() -- Line 83
			--[[ Upvalues[3]:
				[1]: arg1 (readonly)
				[2]: Tag_upvr (copied, readonly)
				[3]: module_upvr (copied, readonly)
			]]
			if arg1:HasTag(Tag_upvr.Dead) then
			else
				module_upvr._onCharacterMoved()
			end
		end)
	end
end
function module_upvr._onCharacterMoved() -- Line 93
	--[[ Upvalues[2]:
		[1]: MouseController_upvr (readonly)
		[2]: Satchel_upvr (readonly)
	]]
	local var17
	if MouseController_upvr.getCurrentMouseBehavior() == Enum.MouseBehavior.LockCenter then
		var17 = false
	else
		var17 = true
	end
	if not Satchel_upvr:IsOpened() and var17 then
		MouseController_upvr.setMouseBehavior(Enum.MouseBehavior.LockCenter)
	end
end
return module_upvr