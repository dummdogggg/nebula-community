--[[
    Script: ReplicatedStorage.Client.Components.LocalDeath
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:49
-- Luau version 6, Types version 3
-- Time taken: 0.000910 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local module_2_upvr = {}
module_2_upvr.__index = module_2_upvr
function module_2_upvr.new(arg1) -- Line 21
	--[[ Upvalues[2]:
		[1]: module_2_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
	]]
	local module = {}
	setmetatable(module, module_2_upvr)
	if arg1 == LocalPlayer_upvr.Character then
		module:_onLocalCharacterDied(arg1)
	end
	return module
end
local Satchel_upvr = require(ReplicatedStorage.Packages.Satchel)
local MouseController_upvr = require(ReplicatedStorage.Client.Controllers.MouseController)
function module_2_upvr._onLocalCharacterDied(arg1, arg2) -- Line 33
	--[[ Upvalues[3]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: Satchel_upvr (readonly)
		[3]: MouseController_upvr (readonly)
	]]
	LocalPlayer_upvr.CameraMode = Enum.CameraMode.Classic
	LocalPlayer_upvr.CameraMinZoomDistance = 12
	LocalPlayer_upvr.CameraMaxZoomDistance = 12
	local class_Humanoid = arg2:FindFirstChildOfClass("Humanoid")
	if class_Humanoid then
		class_Humanoid:UnequipTools()
	end
	Satchel_upvr:SetBackpackEnabled(false)
	MouseController_upvr.setMouseBehavior(Enum.MouseBehavior.Default, true)
end
function module_2_upvr.destroy(arg1) -- Line 48
end
return module_2_upvr