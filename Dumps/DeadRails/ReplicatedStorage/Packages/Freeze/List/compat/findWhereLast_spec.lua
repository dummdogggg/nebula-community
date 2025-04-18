--[[
    Script: ReplicatedStorage.Packages.Freeze.List.compat.findWhereLast.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:55
-- Luau version 6, Types version 3
-- Time taken: 0.001080 seconds

local findWhereLast_upvr = require(script.Parent.findWhereLast)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: findWhereLast_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'B', 'c'}
	it("find match", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: findWhereLast_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(findWhereLast_upvr(tbl_upvr, function(arg1) -- Line 7
			return true
		end)).toEqual('c')
	end)
	it("find no match", function() -- Line 14
		--[[ Upvalues[2]:
			[1]: findWhereLast_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(findWhereLast_upvr(tbl_upvr, function(arg1) -- Line 15
			if arg1 ~= 'd' then
			else
			end
			return true
		end)).toEqual(nil)
	end)
	it("find no match, default value", function() -- Line 22
		--[[ Upvalues[2]:
			[1]: findWhereLast_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(findWhereLast_upvr(tbl_upvr, function(arg1) -- Line 23
			if arg1 ~= 'd' then
			else
			end
			return true
		end)).toEqual(nil)
	end)
end