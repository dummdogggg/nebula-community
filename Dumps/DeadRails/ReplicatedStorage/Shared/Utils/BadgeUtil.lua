--[[
    Script: ReplicatedStorage.Shared.Utils.BadgeUtil
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:46
-- Luau version 6, Types version 3
-- Time taken: 0.001811 seconds

local BadgeService_upvr = game:GetService("BadgeService")
local retryAsync_upvr = require(game:GetService("ReplicatedStorage").Shared.Utils.retryAsync)
return {
	safeGetBadgeInfoAsync = function(arg1) -- Line 11, Named "safeGetBadgeInfoAsync"
		--[[ Upvalues[2]:
			[1]: retryAsync_upvr (readonly)
			[2]: BadgeService_upvr (readonly)
		]]
		return retryAsync_upvr(function() -- Line 12
			--[[ Upvalues[2]:
				[1]: BadgeService_upvr (copied, readonly)
				[2]: arg1 (readonly)
			]]
			return BadgeService_upvr:GetBadgeInfoAsync(arg1)
		end, 3, 3, 2)
	end;
	safeUserHasBadgeAsync = function(arg1, arg2) -- Line 17, Named "safeUserHasBadgeAsync"
		--[[ Upvalues[2]:
			[1]: retryAsync_upvr (readonly)
			[2]: BadgeService_upvr (readonly)
		]]
		return retryAsync_upvr(function() -- Line 18
			--[[ Upvalues[3]:
				[1]: BadgeService_upvr (copied, readonly)
				[2]: arg1 (readonly)
				[3]: arg2 (readonly)
			]]
			return BadgeService_upvr:UserHasBadgeAsync(arg1, arg2)
		end, 3, 3, 2)
	end;
	safeAwardBadgeAsync = function(arg1, arg2) -- Line 23, Named "safeAwardBadgeAsync"
		--[[ Upvalues[2]:
			[1]: retryAsync_upvr (readonly)
			[2]: BadgeService_upvr (readonly)
		]]
		local retryAsync_upvr_result1_2, retryAsync_upvr_result2 = retryAsync_upvr(function() -- Line 12
			--[[ Upvalues[2]:
				[1]: BadgeService_upvr (copied, readonly)
				[2]: arg2 (readonly)
			]]
			return BadgeService_upvr:GetBadgeInfoAsync(arg2)
		end, 3, 3, 2)
		local var8 = retryAsync_upvr_result2
		if not retryAsync_upvr_result1_2 then
			return false, "Failed to retrieve badge information"
		end
		if var8 and var8.IsEnabled ~= true then
			return false, "Badge is not awardable"
		end
		local retryAsync_upvr_result1, var2_result2 = retryAsync_upvr(function() -- Line 18
			--[[ Upvalues[3]:
				[1]: BadgeService_upvr (copied, readonly)
				[2]: arg1 (readonly)
				[3]: arg2 (readonly)
			]]
			return BadgeService_upvr:UserHasBadgeAsync(arg1, arg2)
		end, 3, 3, 2)
		if not retryAsync_upvr_result1 then
			return false, "Failed to check user's badge status"
		end
		if var2_result2 then
			return false, "User already owns this badge"
		end
		return retryAsync_upvr(function() -- Line 45
			--[[ Upvalues[3]:
				[1]: BadgeService_upvr (copied, readonly)
				[2]: arg1 (readonly)
				[3]: arg2 (readonly)
			]]
			return BadgeService_upvr:AwardBadge(arg1, arg2)
		end, 3, 3, 2)
	end;
}