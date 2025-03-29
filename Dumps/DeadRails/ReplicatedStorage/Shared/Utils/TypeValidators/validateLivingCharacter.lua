--[[
    Script: ReplicatedStorage.Shared.Utils.TypeValidators.validateLivingCharacter
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:14
-- Luau version 6, Types version 3
-- Time taken: 0.000708 seconds

local ._validateInstance_upvr = require("./validateInstance")
return function(arg1) -- Line 10, Named "validateLivingCharacter"
	--[[ Upvalues[1]:
		[1]: ._validateInstance_upvr (readonly)
	]]
	if not arg1 then
		return false
	end
	if not arg1:IsDescendantOf(workspace) then
		return false
	end
	if not ._validateInstance_upvr(arg1, "Model") then
		return false
	end
	if not arg1.PrimaryPart then
		return false
	end
	local Humanoid = arg1:FindFirstChild("Humanoid")
	if not Humanoid or not Humanoid:IsA("Humanoid") or Humanoid.Health <= 0 then
		return false
	end
	return true
end