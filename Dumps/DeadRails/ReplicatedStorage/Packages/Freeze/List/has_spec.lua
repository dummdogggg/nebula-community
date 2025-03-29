--[[
    Script: ReplicatedStorage.Packages.Freeze.List.has.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:38
-- Luau version 6, Types version 3
-- Time taken: 0.000692 seconds

local has_upvr = require(script.Parent.has)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: has_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("exists", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: has_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(has_upvr(tbl_upvr, 1)).toEqual(true)
	end)
	it("doesnt exist", function() -- Line 10
		--[[ Upvalues[2]:
			[1]: has_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(has_upvr(tbl_upvr, 4)).toEqual(false)
	end)
end