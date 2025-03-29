--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.get.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:43
-- Luau version 6, Types version 3
-- Time taken: 0.000766 seconds

local get_upvr = require(script.Parent.get)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: get_upvr (readonly)
	]]
	local tbl_upvr = {
		a = 1;
		b = 2;
		c = 3;
	}
	it("should find existing index", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: get_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(get_upvr(tbl_upvr, 'a')).toEqual(1)
	end)
	it("should return nil for non-existing index", function() -- Line 11
		--[[ Upvalues[2]:
			[1]: get_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(get_upvr(tbl_upvr, 'd')).toEqual(nil)
	end)
	it("should return default for non-existing index", function() -- Line 15
		--[[ Upvalues[2]:
			[1]: get_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(get_upvr(tbl_upvr, 'd', 4)).toEqual(4)
	end)
end