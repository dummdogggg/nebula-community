--[[
    Script: ReplicatedFirst._SoftShutdownClientPackages._Index.@quenty/attributeutils.ContentProviderUtils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:33:57
-- Luau version 6, Types version 3
-- Time taken: 0.000911 seconds

local module = {}
local var2_upvr = require(script.Parent.loader).load(script)("Promise")
local ContentProvider_upvr = game:GetService("ContentProvider")
function module.promisePreload(arg1) -- Line 23
	--[[ Upvalues[2]:
		[1]: var2_upvr (readonly)
		[2]: ContentProvider_upvr (readonly)
	]]
	local var5
	if type(arg1) ~= "table" then
		var5 = false
	else
		var5 = true
	end
	assert(var5, "Bad contentIdList")
	var5 = var2_upvr
	function var5(arg1_2, arg2) -- Line 26
		--[[ Upvalues[2]:
			[1]: ContentProvider_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		local pcall_result1, pcall_result2 = pcall(function() -- Line 27
			--[[ Upvalues[2]:
				[1]: ContentProvider_upvr (copied, readonly)
				[2]: arg1 (copied, readonly)
			]]
			ContentProvider_upvr:PreloadAsync(arg1)
		end)
		if not pcall_result1 then
			return arg2(pcall_result2)
		end
		arg1_2()
	end
	return var5.spawn(var5)
end
return module