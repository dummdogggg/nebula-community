--[[
    Script: ReplicatedStorage.Packages.Freeze.List.update.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:32
-- Luau version 6, Types version 3
-- Time taken: 0.001318 seconds

local update_upvr = require(script.Parent.update)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: update_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("should replace existing index", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: update_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(update_upvr(tbl_upvr, 1, function(arg1) -- Line 7
			assert(arg1, "exists")
			return string.rep(arg1, 5)
		end)).toEqual({"aaaaa", 'b', 'c'})
	end)
	it("should pass nil to updater for nil index", function() -- Line 15
		--[[ Upvalues[2]:
			[1]: update_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		local var8_upvw = false
		expect(var8_upvw).toEqual(true)
		expect(nil).toEqual(nil)
		expect(update_upvr(tbl_upvr, 4, function(arg1) -- Line 17
			--[[ Upvalues[1]:
				[1]: var8_upvw (read and write)
			]]
			var8_upvw = true
			return 'd'
		end)).toEqual({'a', 'b', 'c', 'd'})
	end)
	it("should pass notSetValue to updater for nil index", function() -- Line 27
		--[[ Upvalues[2]:
			[1]: update_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(update_upvr(tbl_upvr, 4, function(arg1) -- Line 28
			assert(arg1, "exists")
			return string.rep(arg1, 5)
		end, 'd')).toEqual({'a', 'b', 'c', "ddddd"})
	end)
end