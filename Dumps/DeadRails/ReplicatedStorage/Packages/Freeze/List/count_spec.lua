--[[
    Script: ReplicatedStorage.Packages.Freeze.List.count.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:48
-- Luau version 6, Types version 3
-- Time taken: 0.000792 seconds

local count_upvr = require(script.Parent.count)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: count_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("count", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: count_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(count_upvr(tbl_upvr)).toEqual(3)
	end)
	it("predicate", function() -- Line 10
		--[[ Upvalues[2]:
			[1]: count_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(count_upvr(tbl_upvr, function(arg1) -- Line 11
			if arg1 ~= 'b' then
			else
			end
			return true
		end)).toEqual(1)
	end)
end