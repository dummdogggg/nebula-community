--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.findKey.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:56
-- Luau version 6, Types version 3
-- Time taken: 0.001185 seconds

local findKey_upvr = require(script.Parent.findKey)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: findKey_upvr (readonly)
	]]
	local tbl_upvr = {
		a = 1;
		b = 2;
		c = 3;
	}
	it("findKey match", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: findKey_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(findKey_upvr(tbl_upvr, function(arg1) -- Line 7
			local var6
			if arg1 % 2 ~= 0 then
				var6 = false
			else
				var6 = true
			end
			return var6
		end)).toEqual('b')
	end)
	it("findKey no match", function() -- Line 14
		--[[ Upvalues[2]:
			[1]: findKey_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(findKey_upvr(tbl_upvr, function(arg1) -- Line 15
			if arg1 ~= 4 then
			else
			end
			return true
		end)).toEqual(nil)
	end)
	it("findKey no match, default", function() -- Line 22
		--[[ Upvalues[2]:
			[1]: findKey_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(findKey_upvr(tbl_upvr, function(arg1) -- Line 23
			if arg1 ~= 4 then
			else
			end
			return true
		end, 'd')).toEqual('d')
	end)
end