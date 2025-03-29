--[[
    Script: ReplicatedStorage.Packages.Freeze.List.findIndex.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:15
-- Luau version 6, Types version 3
-- Time taken: 0.000979 seconds

local findIndex_upvr = require(script.Parent.findIndex)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: findIndex_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'B', 'c'}
	it("findIndex match", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: findIndex_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(findIndex_upvr(tbl_upvr, function(arg1) -- Line 7
			local var6
			if string.upper(arg1) ~= arg1 then
				var6 = false
			else
				var6 = true
			end
			return var6
		end)).toEqual(2)
	end)
	it("findIndex no match", function() -- Line 14
		--[[ Upvalues[2]:
			[1]: findIndex_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(findIndex_upvr(tbl_upvr, function(arg1) -- Line 15
			if arg1 ~= 'd' then
			else
			end
			return true
		end)).toEqual(nil)
	end)
end