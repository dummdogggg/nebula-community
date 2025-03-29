--[[
    Script: ReplicatedStorage.Shared.Utils.TypeValidators.validateShootArguments
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:15
-- Luau version 6, Types version 3
-- Time taken: 0.000764 seconds

local .__TypeValidators_validateInstance_upvr = require("../TypeValidators/validateInstance")
local function hitValidator_upvr(arg1) -- Line 7, Named "hitValidator"
	--[[ Upvalues[1]:
		[1]: .__TypeValidators_validateInstance_upvr (readonly)
	]]
	return .__TypeValidators_validateInstance_upvr(arg1, "Humanoid")
end
local .__TypeValidators_validateNumber_upvr = require("../TypeValidators/validateNumber")
local .__TypeValidators_validateGun_upvr = require("../TypeValidators/validateGun")
local .__TypeValidators_validateCFrame_upvr = require("../TypeValidators/validateCFrame")
local .__TypeValidators_validateSimpleTable_upvr = require("../TypeValidators/validateSimpleTable")
return function(arg1, arg2, arg3, arg4) -- Line 11, Named "validateShootArguments"
	--[[ Upvalues[5]:
		[1]: .__TypeValidators_validateNumber_upvr (readonly)
		[2]: .__TypeValidators_validateGun_upvr (readonly)
		[3]: .__TypeValidators_validateCFrame_upvr (readonly)
		[4]: .__TypeValidators_validateSimpleTable_upvr (readonly)
		[5]: hitValidator_upvr (readonly)
	]]
	if not .__TypeValidators_validateNumber_upvr(arg1) then
		return false
	end
	if not .__TypeValidators_validateGun_upvr(arg2) then
		return false
	end
	if not .__TypeValidators_validateCFrame_upvr(arg3) then
		return false
	end
	if not .__TypeValidators_validateSimpleTable_upvr(arg4, "string", hitValidator_upvr) then
		return false
	end
	return true
end