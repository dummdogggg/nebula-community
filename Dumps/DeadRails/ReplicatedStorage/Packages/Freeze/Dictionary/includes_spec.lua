--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.includes.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:53
-- Luau version 6, Types version 3
-- Time taken: 0.000635 seconds

local includes_upvr = require(script.Parent.includes)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: includes_upvr (readonly)
	]]
	local tbl_upvr = {
		a = 1;
		b = 2;
		c = 3;
	}
	it("exists", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: includes_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(includes_upvr(tbl_upvr, 2)).toEqual(true)
	end)
	it("doesnt exist", function() -- Line 10
		--[[ Upvalues[2]:
			[1]: includes_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(includes_upvr(tbl_upvr, 4)).toEqual(false)
	end)
end