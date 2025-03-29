--[[
    Script: ReplicatedStorage.Packages.Freeze.List.some.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:11
-- Luau version 6, Types version 3
-- Time taken: 0.000960 seconds

local some_upvr = require(script.Parent.some)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: some_upvr (readonly)
	]]
	local tbl_upvr = {1, 2, 3}
	it("match all", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: some_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(some_upvr(tbl_upvr, function(arg1) -- Line 7
			return true
		end)).toEqual(true)
	end)
	it("no match", function() -- Line 12
		--[[ Upvalues[2]:
			[1]: some_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(some_upvr(tbl_upvr, function(arg1) -- Line 13
			return false
		end)).toEqual(false)
	end)
	it("one match", function() -- Line 18
		--[[ Upvalues[2]:
			[1]: some_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(some_upvr(tbl_upvr, function(arg1) -- Line 19
			if arg1 ~= 2 then
			else
			end
			return true
		end)).toEqual(true)
	end)
end