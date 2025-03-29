--[[
    Script: ReplicatedStorage.Packages.ActionService.InputCategorizer
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:20
-- Luau version 6, Types version 3
-- Time taken: 0.001785 seconds

local UserInputService_upvr = game:GetService("UserInputService")
local module_upvr = {
	KeyboardAndMouse = "KeyboardAndMouse";
	Gamepad = "Gamepad";
	Touch = "Touch";
	Unknown = "Unknown";
}
local module_upvr_2 = {
	InputCategory = module_upvr;
	lastInputCategoryChanged = require(script.Signal).new();
	_lastInputCategory = module_upvr.Unknown;
	_initialized = false;
}
function module_upvr_2.getLastInputCategory() -- Line 24
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	return module_upvr_2._lastInputCategory
end
function module_upvr_2._setLastInputCategory(arg1) -- Line 29
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	if module_upvr_2._lastInputCategory ~= arg1 then
		module_upvr_2._lastInputCategory = arg1
		module_upvr_2.lastInputCategoryChanged:Fire(arg1)
	end
end
function module_upvr_2._getCategoryOfInputType(arg1) -- Line 37
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if string.find(arg1.Name, "Gamepad") then
		return module_upvr.Gamepad
	end
	if arg1 == Enum.UserInputType.Keyboard or string.find(arg1.Name, "Mouse") then
		return module_upvr.KeyboardAndMouse
	end
	if arg1 == Enum.UserInputType.Touch then
		return module_upvr.Touch
	end
	return module_upvr.Unknown
end
function module_upvr_2._onInputTypeChanged(arg1) -- Line 49
	--[[ Upvalues[2]:
		[1]: module_upvr_2 (readonly)
		[2]: module_upvr (readonly)
	]]
	local any__getCategoryOfInputType_result1_2 = module_upvr_2._getCategoryOfInputType(arg1)
	if any__getCategoryOfInputType_result1_2 ~= module_upvr.Unknown then
		module_upvr_2._setLastInputCategory(any__getCategoryOfInputType_result1_2)
	end
end
function module_upvr_2._getDefaultInputCategory() -- Line 57
	--[[ Upvalues[3]:
		[1]: UserInputService_upvr (readonly)
		[2]: module_upvr_2 (readonly)
		[3]: module_upvr (readonly)
	]]
	local any__getCategoryOfInputType_result1 = module_upvr_2._getCategoryOfInputType(UserInputService_upvr:GetLastInputType())
	if any__getCategoryOfInputType_result1 ~= module_upvr.Unknown then
		return any__getCategoryOfInputType_result1
	end
	if UserInputService_upvr.KeyboardEnabled and UserInputService_upvr.MouseEnabled then
		return module_upvr.KeyboardAndMouse
	end
	if UserInputService_upvr.TouchEnabled then
		return module_upvr.Touch
	end
	if UserInputService_upvr.GamepadEnabled then
		return module_upvr.Gamepad
	end
	warn("No input devices detected!")
	return module_upvr.Unknown
end
function module_upvr_2._initialize() -- Line 77
	--[[ Upvalues[2]:
		[1]: module_upvr_2 (readonly)
		[2]: UserInputService_upvr (readonly)
	]]
	assert(not module_upvr_2._initialized, "InputCategorizer already initialized!")
	UserInputService_upvr.LastInputTypeChanged:Connect(module_upvr_2._onInputTypeChanged)
	module_upvr_2._setLastInputCategory(module_upvr_2._getDefaultInputCategory())
	module_upvr_2._initialized = true
end
module_upvr_2._initialize()
return module_upvr_2