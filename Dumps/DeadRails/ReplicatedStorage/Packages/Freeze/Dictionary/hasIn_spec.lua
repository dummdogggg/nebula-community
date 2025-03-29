--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.hasIn.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:02
-- Luau version 6, Types version 3
-- Time taken: 0.000731 seconds

local hasIn_upvr = require(script.Parent.hasIn)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: hasIn_upvr (readonly)
	]]
	local tbl_upvr = {
		a = {
			b = 'c';
		};
	}
	it("should find existing index", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: hasIn_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(hasIn_upvr(tbl_upvr, {'a', 'b'})).toEqual(true)
	end)
	it("should return false for non-existing index", function() -- Line 11
		--[[ Upvalues[2]:
			[1]: hasIn_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(hasIn_upvr(tbl_upvr, {'d'})).toEqual(false)
	end)
end