--[[
    Script: ReplicatedStorage.ViewModelControl.Utility.bindToInstanceDestroyed.DestructionHandler
    Type: Script
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:33
-- Luau version 6, Types version 3
-- Time taken: 0.000718 seconds

script.Bind.Event:Connect(function(arg1, arg2) -- Line 6
	local var3_upvw
	local var4_upvw
	var4_upvw = arg1.AncestryChanged:Connect(function() -- Line 12
		--[[ Upvalues[4]:
			[1]: arg1 (readonly)
			[2]: var3_upvw (read and write)
			[3]: var4_upvw (read and write)
			[4]: arg2 (readonly)
		]]
		if not arg1:IsDescendantOf(game) then
			var3_upvw:Disconnect()
			var4_upvw:Disconnect()
			arg2()
			script:Destroy()
		end
	end)
	var3_upvw = arg1.Destroying:Once(function() -- Line 21
		--[[ Upvalues[2]:
			[1]: var4_upvw (read and write)
			[2]: arg2 (readonly)
		]]
		var4_upvw:Disconnect()
		arg2()
		script:Destroy()
	end)
end)