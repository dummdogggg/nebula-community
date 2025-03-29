--[[
    Script: ReplicatedStorage.Packages.Freeze.List.skip.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:43:59
-- Luau version 6, Types version 3
-- Time taken: 0.000639 seconds

local skip_upvr = require(script.Parent.skip)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: skip_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("skip 1", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: skip_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(skip_upvr(tbl_upvr, 1)).toEqual({'b', 'c'})
	end)
	it("skip 2", function() -- Line 10
		--[[ Upvalues[2]:
			[1]: skip_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(skip_upvr(tbl_upvr, 2)).toEqual({'c'})
	end)
end