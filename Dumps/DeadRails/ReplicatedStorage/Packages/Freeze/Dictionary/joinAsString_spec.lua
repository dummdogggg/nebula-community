--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.joinAsString.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:18
-- Luau version 6, Types version 3
-- Time taken: 0.000655 seconds

local joinAsString_upvr = require(script.Parent.joinAsString)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: joinAsString_upvr (readonly)
	]]
	local tbl_upvr = {
		a = 1;
	}
	it("joinAsString", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: joinAsString_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(joinAsString_upvr(tbl_upvr)).toEqual("a=1")
	end)
	it("empty", function() -- Line 10
		--[[ Upvalues[1]:
			[1]: joinAsString_upvr (copied, readonly)
		]]
		expect(joinAsString_upvr({})).toEqual("")
	end)
end