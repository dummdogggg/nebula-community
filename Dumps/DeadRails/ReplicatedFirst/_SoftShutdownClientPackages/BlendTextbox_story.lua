--[[
    Script: ReplicatedFirst._SoftShutdownClientPackages.BlendTextbox.story
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:13
-- Luau version 6, Types version 3
-- Time taken: 0.000406 seconds

return require((function(arg1) -- Line 8, Named "waitForValue"
	local Value = arg1.Value
	if Value then
		return Value
	end
	return arg1.Changed:Wait()
end)(script:WaitForChild("BounceTarget")))