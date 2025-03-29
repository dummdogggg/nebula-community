--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.PlayerThumbnailUtils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:35
-- Luau version 6, Types version 3
-- Time taken: 0.002630 seconds

local Players_upvr = game:GetService("Players")
local var2_upvr = require(script.Parent.loader).load(script)("Promise")
return {
	promiseUserThumbnail = function(arg1, arg2, arg3) -- Line 31, Named "promiseUserThumbnail"
		--[[ Upvalues[2]:
			[1]: var2_upvr (readonly)
			[2]: Players_upvr (readonly)
		]]
		local var4
		if type(arg1) ~= "number" then
			var4 = false
		else
			var4 = true
		end
		assert(var4, "Bad userId")
		local var5_upvw = arg2
		if not var5_upvw then
			var5_upvw = Enum.ThumbnailType.HeadShot
		end
		var5_upvw = arg3
		local var6_upvw = var5_upvw
		if not var6_upvw then
			var6_upvw = Enum.ThumbnailSize.Size100x100
		end
		var4 = var2_upvr.spawn
		local var8_upvw
		var4 = var4(function(arg1_2, arg2_2) -- Line 37
			--[[ Upvalues[5]:
				[1]: Players_upvr (copied, readonly)
				[2]: arg1 (readonly)
				[3]: var5_upvw (read and write)
				[4]: var6_upvw (read and write)
				[5]: var8_upvw (read and write)
			]]
			repeat
				local var9_upvw
				local var10_upvw
				local pcall_result1_2, pcall_result2_2 = pcall(function() -- Line 42
					--[[ Upvalues[6]:
						[1]: var9_upvw (read and write)
						[2]: var10_upvw (read and write)
						[3]: Players_upvr (copied, readonly)
						[4]: arg1 (copied, readonly)
						[5]: var5_upvw (copied, read and write)
						[6]: var6_upvw (copied, read and write)
					]]
					local any_GetUserThumbnailAsync_result1, any_GetUserThumbnailAsync_result2 = Players_upvr:GetUserThumbnailAsync(arg1, var5_upvw, var6_upvw)
					var9_upvw = any_GetUserThumbnailAsync_result1
					var10_upvw = any_GetUserThumbnailAsync_result2
				end)
				if not pcall_result1_2 then
					return arg2_2(pcall_result2_2)
				end
				if var10_upvw then
					return arg1_2(var9_upvw)
				end
				task.wait(0.05)
			until 5 <= 0 + 1 and not var8_upvw:IsPending()
			arg2_2()
		end)
		var8_upvw = var4
		return var8_upvw
	end;
	promiseUserName = function(arg1) -- Line 68, Named "promiseUserName"
		--[[ Upvalues[2]:
			[1]: var2_upvr (readonly)
			[2]: Players_upvr (readonly)
		]]
		local var16
		if type(arg1) ~= "number" then
			var16 = false
		else
			var16 = true
		end
		assert(var16, "Bad userId")
		var16 = var2_upvr.spawn
		local var18_upvw
		var16 = var16(function(arg1_3, arg2) -- Line 72
			--[[ Upvalues[3]:
				[1]: Players_upvr (copied, readonly)
				[2]: arg1 (readonly)
				[3]: var18_upvw (read and write)
			]]
			repeat
				local var19_upvw
				local pcall_result1, pcall_result2 = pcall(function() -- Line 77
					--[[ Upvalues[3]:
						[1]: var19_upvw (read and write)
						[2]: Players_upvr (copied, readonly)
						[3]: arg1 (copied, readonly)
					]]
					var19_upvw = Players_upvr:GetNameFromUserIdAsync(arg1)
				end)
				if not pcall_result1 then
					return arg2(pcall_result2)
				end
				if type(var19_upvw) == "string" then
					return arg1_3(var19_upvw)
				end
				task.wait(0.05)
			until 5 <= 0 + 1 and not var18_upvw:IsPending()
			arg2()
		end)
		var18_upvw = var16
		return var18_upvw
	end;
}