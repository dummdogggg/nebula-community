--[[
    Script: ReplicatedStorage.Packages.Freeze.List.get.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:06
-- Luau version 6, Types version 3
-- Time taken: 0.000965 seconds

local get_upvr = require(script.Parent.get)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: get_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("should find existing index", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: get_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(get_upvr(tbl_upvr, 1)).toEqual('a')
	end)
	it("should return nil for non-existing index", function() -- Line 10
		--[[ Upvalues[2]:
			[1]: get_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(get_upvr(tbl_upvr, 4)).toEqual(nil)
	end)
	it("should return default for non-existing index", function() -- Line 14
		--[[ Upvalues[2]:
			[1]: get_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(get_upvr(tbl_upvr, 4, 'd')).toEqual('d')
	end)
	it("should handle negative index", function() -- Line 18
		--[[ Upvalues[2]:
			[1]: get_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(get_upvr(tbl_upvr, -1)).toEqual('c')
	end)
	it("should handle negative index out of bounds", function() -- Line 22
		--[[ Upvalues[2]:
			[1]: get_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(get_upvr(tbl_upvr, -100)).toEqual(nil)
	end)
end