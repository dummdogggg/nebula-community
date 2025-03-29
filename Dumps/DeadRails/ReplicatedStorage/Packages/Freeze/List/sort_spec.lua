--[[
    Script: ReplicatedStorage.Packages.Freeze.List.sort.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:13
-- Luau version 6, Types version 3
-- Time taken: 0.000963 seconds

local sort_upvr = require(script.Parent.sort)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: sort_upvr (readonly)
	]]
	local tbl_upvr = {4, 2, 3, 1}
	it("no arguments", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: sort_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(sort_upvr(tbl_upvr)).toEqual({1, 2, 3, 4})
	end)
	it("custom predicate", function() -- Line 11
		--[[ Upvalues[2]:
			[1]: sort_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(sort_upvr(tbl_upvr, function(arg1, arg2) -- Line 12
			if arg2 >= arg1 then
			else
			end
			return true
		end)).toEqual({4, 3, 2, 1})
	end)
end