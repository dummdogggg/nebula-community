--[[
    Script: ReplicatedStorage.Packages.Freeze.List.remove.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:05
-- Luau version 6, Types version 3
-- Time taken: 0.001446 seconds

local module_upvr = require(script.Parent:FindFirstChild("remove"))
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local tbl_upvr = {10, 20, 30}
	it("remove", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: module_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(module_upvr(tbl_upvr, 2)).toEqual({10, 30})
	end)
	it("remove from end", function() -- Line 11
		--[[ Upvalues[2]:
			[1]: module_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(module_upvr(tbl_upvr, -1)).toEqual({10, 20})
	end)
	it("remove from end 2", function() -- Line 16
		--[[ Upvalues[2]:
			[1]: module_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(module_upvr(tbl_upvr, -3)).toEqual({20, 30})
	end)
	it("remove out of bounds, same id", function() -- Line 21
		--[[ Upvalues[2]:
			[1]: module_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(module_upvr(tbl_upvr, 4)).toBe(tbl_upvr)
	end)
	it("remove multiple indicies", function() -- Line 26
		--[[ Upvalues[2]:
			[1]: module_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(module_upvr(tbl_upvr, 1, 2)).toEqual({30})
	end)
	it("remove multiple negative indicies, preserves order", function() -- Line 31
		--[[ Upvalues[1]:
			[1]: module_upvr (copied, readonly)
		]]
		expect(module_upvr({1, 2, 3, 4, 5, 6, 7, 8}, 8, -1)).toEqual({1, 2, 3, 4, 5, 6, 7})
	end)
	it("remove multiple indicies, same id if no match", function() -- Line 37
		--[[ Upvalues[1]:
			[1]: module_upvr (copied, readonly)
		]]
		local tbl = {1, 2, 3, 4, 5, 6, 7, 8}
		expect(module_upvr(tbl, 100, 200, -100)).toBe(tbl)
	end)
end