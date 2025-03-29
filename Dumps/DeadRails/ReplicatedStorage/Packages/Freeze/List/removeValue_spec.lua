--[[
    Script: ReplicatedStorage.Packages.Freeze.List.removeValue.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:30
-- Luau version 6, Types version 3
-- Time taken: 0.001317 seconds

local removeValue_upvr = require(script.Parent.removeValue)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: removeValue_upvr (readonly)
	]]
	local tbl_upvr_2 = {10, 20, 30}
	local tbl_upvr = {10, 20, 30, 10, 20, 30}
	it("removeValue", function() -- Line 7
		--[[ Upvalues[2]:
			[1]: removeValue_upvr (copied, readonly)
			[2]: tbl_upvr_2 (readonly)
		]]
		expect(removeValue_upvr(tbl_upvr_2, 20)).toEqual({10, 30})
	end)
	it("removeValue not found, keeps identity", function() -- Line 12
		--[[ Upvalues[2]:
			[1]: removeValue_upvr (copied, readonly)
			[2]: tbl_upvr_2 (readonly)
		]]
		expect(removeValue_upvr(tbl_upvr_2, 100)).toBe(tbl_upvr_2)
	end)
	it("removeValue for all repeated values", function() -- Line 17
		--[[ Upvalues[2]:
			[1]: removeValue_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(removeValue_upvr(tbl_upvr, 20)).toEqual({10, 30, 10, 30})
	end)
	it("removeValue multiple values", function() -- Line 22
		--[[ Upvalues[2]:
			[1]: removeValue_upvr (copied, readonly)
			[2]: tbl_upvr_2 (readonly)
		]]
		expect(removeValue_upvr(tbl_upvr_2, 20, 30)).toEqual({10})
	end)
	it("removeValue multiple values, even if some arent there", function() -- Line 27
		--[[ Upvalues[2]:
			[1]: removeValue_upvr (copied, readonly)
			[2]: tbl_upvr_2 (readonly)
		]]
		expect(removeValue_upvr(tbl_upvr_2, 20, 30, 40)).toEqual({10})
	end)
	it("removeValue multiple values, multiple times", function() -- Line 32
		--[[ Upvalues[2]:
			[1]: removeValue_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(removeValue_upvr(tbl_upvr, 20, 30)).toEqual({10, 10})
	end)
end