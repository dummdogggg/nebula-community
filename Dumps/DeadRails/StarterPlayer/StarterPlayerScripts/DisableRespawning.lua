--[[
    Script: StarterPlayer.StarterPlayerScripts.DisableRespawning
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:33:42
-- Luau version 6, Types version 3
-- Time taken: 0.000706 seconds

local StarterGui_upvr = game:GetService("StarterGui")
function coreCall(arg1, ...) -- Line 6
	--[[ Upvalues[1]:
		[1]: StarterGui_upvr (readonly)
	]]
	local var4
	for _ = 1, 8 do
		var4 = {pcall(StarterGui_upvr[arg1], StarterGui_upvr, ...)}
		if var4[1] then break end
		task.wait()
	end
	return unpack(var4)
end
coreCall("SetCore", "ResetButtonCallback", false)