--[[
    Script: ReplicatedStorage.Shared.Utils.getRayDirections
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:50
-- Luau version 6, Types version 3
-- Time taken: 0.000638 seconds

return function(arg1, arg2, arg3, arg4) -- Line 1, Named "getRayDirections"
	local random_state = Random.new(arg4 * 100000)
	local module = {}
	for _ = 1, arg2 do
		table.insert(module, (arg1 * CFrame.Angles(0, 0, random_state:NextNumber() * math.pi * 2) * CFrame.Angles(random_state:NextNumber() * arg3, 0, 0)).LookVector)
	end
	return module
end