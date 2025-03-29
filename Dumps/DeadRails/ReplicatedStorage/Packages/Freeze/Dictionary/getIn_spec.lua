--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.getIn.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:33:55
-- Luau version 6, Types version 3
-- Time taken: 0.001012 seconds

local getIn_upvr = require(script.Parent.getIn)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: getIn_upvr (readonly)
	]]
	local tbl_upvr = {
		a = {
			b = 'c';
		};
	}
	it("should find existing index", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: getIn_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(getIn_upvr(tbl_upvr, {'a', 'b'})).toEqual('c')
	end)
	it("should return nil for non-existing index", function() -- Line 11
		--[[ Upvalues[2]:
			[1]: getIn_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(getIn_upvr(tbl_upvr, {'a', 'b', 'c'})).toEqual(nil)
	end)
	it("should return nil for non-existing index 2", function() -- Line 16
		--[[ Upvalues[2]:
			[1]: getIn_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(getIn_upvr(tbl_upvr, {'x', 'y', 'z'})).toEqual(nil)
	end)
	it("should return default for non-existing index", function() -- Line 21
		--[[ Upvalues[2]:
			[1]: getIn_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(getIn_upvr(tbl_upvr, {'d'}, "default")).toEqual("default")
	end)
end