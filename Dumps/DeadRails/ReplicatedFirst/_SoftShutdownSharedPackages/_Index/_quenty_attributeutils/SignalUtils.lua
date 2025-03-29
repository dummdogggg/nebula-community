--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.SignalUtils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:08
-- Luau version 6, Types version 3
-- Time taken: 0.000865 seconds

return {
	onNext = function(arg1, arg2) -- Line 14, Named "onNext"
		local var2
		if typeof(arg1) ~= "RBXScriptSignal" then
			var2 = false
		else
			var2 = true
		end
		assert(var2, "Bad event")
		if type(arg2) ~= "function" then
			var2 = false
		else
			var2 = true
		end
		assert(var2, "Bad _function")
		local var4_upvw
		var2 = arg1:Connect(function(...) -- Line 19
			--[[ Upvalues[2]:
				[1]: var4_upvw (read and write)
				[2]: arg2 (readonly)
			]]
			if var4_upvw.Connected then
			else
				var4_upvw:Disconnect()
				arg2(...)
			end
		end)
		var4_upvw = var2
		return var4_upvw
	end;
}