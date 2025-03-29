--[[
    Script: ReplicatedStorage.Packages.Freeze.List.set.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:27
-- Luau version 6, Types version 3
-- Time taken: 0.000832 seconds

local set_upvr = require(script.Parent.set)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: set_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("should replace existing index", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: set_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(set_upvr(tbl_upvr, 1, 'A')).toEqual({'A', 'b', 'c'})
	end)
	it("should add new index", function() -- Line 10
		--[[ Upvalues[2]:
			[1]: set_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(set_upvr(tbl_upvr, 4, 'D')).toEqual({'a', 'b', 'c', 'D'})
	end)
	it("should add new index out of bounds", function() -- Line 14
		--[[ Upvalues[2]:
			[1]: set_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(set_upvr(tbl_upvr, 6, 'D')).toEqual({'a', 'b', 'c', nil, nil, 'D'})
	end)
end