--[[
    Script: ReplicatedStorage.Packages.Freeze.List.merge.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:06
-- Luau version 6, Types version 3
-- Time taken: 0.000838 seconds

local merge_upvr = require(script.Parent.merge)
local None_upvr = require(script.Parent.Parent.None)
return function() -- Line 5
	--[[ Upvalues[2]:
		[1]: merge_upvr (readonly)
		[2]: None_upvr (readonly)
	]]
	it("merge 2", function() -- Line 6
		--[[ Upvalues[1]:
			[1]: merge_upvr (copied, readonly)
		]]
		expect(merge_upvr({'a', nil, 'c'}, {nil, 'b', 'C'})).toEqual({'a', 'b', 'C'})
	end)
	it("merge 3, with none", function() -- Line 14
		--[[ Upvalues[2]:
			[1]: merge_upvr (copied, readonly)
			[2]: None_upvr (copied, readonly)
		]]
		expect(merge_upvr({'a', 'b', 'c'}, {'x'}, {nil, 'y', None_upvr})).toEqual({'x', 'y'})
	end)
end