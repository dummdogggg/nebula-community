--[[
    Script: ReplicatedStorage.Packages.Freeze.List.insert.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:16
-- Luau version 6, Types version 3
-- Time taken: 0.001208 seconds

local insert_upvr = require(script.Parent.insert)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: insert_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("should insert 1 value", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: insert_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(insert_upvr(tbl_upvr, 2, 'd')).toEqual({'a', 'd', 'b', 'c'})
	end)
	it("should insert multiple values", function() -- Line 10
		--[[ Upvalues[1]:
			[1]: insert_upvr (copied, readonly)
		]]
		expect(insert_upvr({'a', 'b', 'c'}, 2, 'X', 'Y', 'Z')).toEqual({'a', 'X', 'Y', 'Z', 'b', 'c'})
	end)
	it("should insert and clamp 1 value out of bounds positive", function() -- Line 15
		--[[ Upvalues[2]:
			[1]: insert_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(insert_upvr(tbl_upvr, 100, 'd')).toEqual({'a', 'b', 'c', 'd'})
	end)
	it("should insert and clamp 1 value out of bounds negative", function() -- Line 20
		--[[ Upvalues[2]:
			[1]: insert_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(insert_upvr(tbl_upvr, -100, 'd')).toEqual({'d', 'a', 'b', 'c'})
	end)
end