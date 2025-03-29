--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CommonUtils.FlagUtil
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:03
-- Luau version 6, Types version 3
-- Time taken: 0.000409 seconds

return {
	getUserFlag = function(arg1) -- Line 11, Named "getUserFlag"
		local pcall_result1, pcall_result2 = pcall(function() -- Line 12
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			return UserSettings():IsUserFeatureEnabled(arg1)
		end)
		return pcall_result1 and pcall_result2
	end;
}