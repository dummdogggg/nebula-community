--[[
    Script: ReplicatedStorage.Client.Handlers.CursorHandler
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:25
-- Luau version 6, Types version 3
-- Time taken: 0.000946 seconds

local UserInputService_upvr = game:GetService("UserInputService")
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local var4_upvw
local module_upvr = {}
local StarterPlayer_upvr = game:GetService("StarterPlayer")
local RunService_upvr = game:GetService("RunService")
function module_upvr.startAsync() -- Line 24
	--[[ Upvalues[6]:
		[1]: var4_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
		[3]: UserInputService_upvr (readonly)
		[4]: StarterPlayer_upvr (readonly)
		[5]: RunService_upvr (readonly)
		[6]: module_upvr (readonly)
	]]
	var4_upvw = LocalPlayer_upvr.PlayerGui:WaitForChild("Crosshair", math.huge):WaitForChild("Crosshair", math.huge)
	UserInputService_upvr.MouseIconEnabled = false
	StarterPlayer_upvr.EnableMouseLockOption = false
	RunService_upvr.RenderStepped:Connect(module_upvr._onRenderStepped)
end
local InputCategorizer_upvr = require(game:GetService("ReplicatedStorage").Client.Controllers.ActionController.InputCategorizer)
function module_upvr._onRenderStepped() -- Line 33
	--[[ Upvalues[3]:
		[1]: InputCategorizer_upvr (readonly)
		[2]: var4_upvw (read and write)
		[3]: UserInputService_upvr (readonly)
	]]
	if InputCategorizer_upvr.getLastInputCategory() == InputCategorizer_upvr.InputCategory.Touch then
		var4_upvw.Position = UDim2.fromScale(0.5, 0.5)
	else
		local any_GetMouseLocation_result1 = UserInputService_upvr:GetMouseLocation()
		var4_upvw.Position = UDim2.fromOffset(any_GetMouseLocation_result1.X, any_GetMouseLocation_result1.Y)
	end
end
return module_upvr