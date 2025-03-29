--[[
    Script: ReplicatedStorage.Packages.Freeze.List.flatten.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:18
-- Luau version 6, Types version 3
-- Time taken: 0.001471 seconds

local flatten_upvr = require(script.Parent.flatten)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: flatten_upvr (readonly)
	]]
	it("flatten, no depth, no change", function() -- Line 5
		--[[ Upvalues[1]:
			[1]: flatten_upvr (copied, readonly)
		]]
		expect(flatten_upvr({'a', 'B', 'c'})).toEqual({'a', 'B', 'c'})
	end)
	it("flatten, depth of 1", function() -- Line 11
		--[[ Upvalues[1]:
			[1]: flatten_upvr (copied, readonly)
		]]
		expect(flatten_upvr({"foo", {"bar", "baz"}, {"bar", "baz"}, "quz"})).toEqual({"foo", "bar", "baz", "bar", "baz", "quz"})
	end)
	local tbl_upvr = {"foo", {"bar", "baz", {"bar", "baz"}}, "quz"}
	it("flatten, depth of 2", function() -- Line 41
		--[[ Upvalues[2]:
			[1]: flatten_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(flatten_upvr(tbl_upvr)).toEqual({"foo", "bar", "baz", "bar", "baz", "quz"})
	end)
	it("flatten, depth of 2, limit 1", function() -- Line 46
		--[[ Upvalues[2]:
			[1]: flatten_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(flatten_upvr(tbl_upvr, 1)).toEqual({"foo", "bar", "baz", {"bar", "baz"}, "quz"})
	end)
end