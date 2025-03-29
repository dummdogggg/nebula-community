--[[
    Script: ReplicatedStorage.Packages.Freeze.List.unshift.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:24
-- Luau version 6, Types version 3
-- Time taken: 0.000736 seconds

local unshift_upvr = require(script.Parent.unshift)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: unshift_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("should unshift 1 value", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: unshift_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(unshift_upvr(tbl_upvr, 'x')).toEqual({'x', 'a', 'b', 'c'})
	end)
	it("should unshift 3 values", function() -- Line 10
		--[[ Upvalues[2]:
			[1]: unshift_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(unshift_upvr(tbl_upvr, 'x', 'y', 'z')).toEqual({'x', 'y', 'z', 'a', 'b', 'c'})
	end)
end