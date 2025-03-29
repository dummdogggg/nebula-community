--[[
    Script: ReplicatedStorage.Packages.Freeze.List.every.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:01
-- Luau version 6, Types version 3
-- Time taken: 0.001221 seconds

local every_upvr = require(script.Parent.every)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: every_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("match", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: every_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(every_upvr(tbl_upvr, function(arg1) -- Line 7
			local var6
			if type(arg1) ~= "string" then
				var6 = false
			else
				var6 = true
			end
			return var6
		end)).toEqual(true)
	end)
	it("no match", function() -- Line 12
		--[[ Upvalues[2]:
			[1]: every_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(every_upvr(tbl_upvr, function(arg1) -- Line 13
			if arg1 ~= 'b' then
			else
			end
			return true
		end)).toEqual(false)
	end)
	it("none match", function() -- Line 18
		--[[ Upvalues[2]:
			[1]: every_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(every_upvr(tbl_upvr, function(arg1) -- Line 19
			local var11
			if arg1 ~= string.upper(arg1) then
				var11 = false
			else
				var11 = true
			end
			return var11
		end)).toEqual(false)
	end)
end