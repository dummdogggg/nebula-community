--[[
    Script: ReplicatedStorage.Packages.Freeze.List.take.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:04
-- Luau version 6, Types version 3
-- Time taken: 0.000702 seconds

local take_upvr = require(script.Parent.take)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: take_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("exactly 1", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: take_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(take_upvr(tbl_upvr, 1)).toEqual({'a'})
	end)
	it("more than 1", function() -- Line 10
		--[[ Upvalues[2]:
			[1]: take_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(take_upvr(tbl_upvr, 2)).toEqual({'a', 'b'})
	end)
end