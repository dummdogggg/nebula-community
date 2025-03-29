--[[
    Script: ReplicatedStorage.Client.Effects.playSoundAtPosition
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:12
-- Luau version 6, Types version 3
-- Time taken: 0.000624 seconds

return function(arg1, arg2) -- Line 3, Named "playSoundAtPosition"
	local Attachment_upvr = Instance.new("Attachment")
	Attachment_upvr.WorldPosition = arg2
	Attachment_upvr.Parent = workspace.Terrain
	local clone = arg1:Clone()
	clone.Parent = Attachment_upvr
	clone:Play()
	clone.Ended:Once(function() -- Line 12
		--[[ Upvalues[1]:
			[1]: Attachment_upvr (readonly)
		]]
		Attachment_upvr:Destroy()
	end)
end