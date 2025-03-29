--[[
    Script: ReplicatedStorage.Shared.Utils.TagUtil
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:45
-- Luau version 6, Types version 3
-- Time taken: 0.000570 seconds

return {
	findFirstAncestorOfClassWithTag = function(arg1, arg2, arg3, arg4) -- Line 3, Named "findFirstAncestorOfClassWithTag"
		local instance = arg1:FindFirstAncestorOfClass(arg2)
		while instance and 0 < (arg4 or 10) do
			if instance:HasTag(arg3) then
				return instance
			end
		end
		return nil
	end;
}