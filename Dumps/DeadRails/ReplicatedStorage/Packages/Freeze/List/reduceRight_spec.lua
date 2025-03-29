--[[
    Script: ReplicatedStorage.Packages.Freeze.List.reduceRight.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:19
-- Luau version 6, Types version 3
-- Time taken: 0.000759 seconds

local reduceRight_upvr = require(script.Parent.reduceRight)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: reduceRight_upvr (readonly)
	]]
	local tbl_upvr = {10, 20, 30}
	it("reduceRight", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: reduceRight_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(reduceRight_upvr(tbl_upvr, function(arg1, arg2) -- Line 7
			return arg1 + arg2
		end, 0)).toEqual(60)
	end)
	it("order right to left", function() -- Line 14
		--[[ Upvalues[2]:
			[1]: reduceRight_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(reduceRight_upvr(tbl_upvr, function(arg1, arg2) -- Line 15
			return arg1..tostring(arg2)
		end, "")).toEqual("302010")
	end)
end