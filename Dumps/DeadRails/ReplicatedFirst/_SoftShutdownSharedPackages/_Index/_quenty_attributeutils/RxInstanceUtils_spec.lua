--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.RxInstanceUtils.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:25
-- Luau version 6, Types version 3
-- Time taken: 0.000737 seconds

local var2_upvr = require(game:GetService("ServerScriptService"):FindFirstChild("LoaderUtils", true).Parent).load(script)("RxInstanceUtils")
return function() -- Line 9
	--[[ Upvalues[1]:
		[1]: var2_upvr (readonly)
	]]
	describe("RxInstanceUtils.observeChildrenBrio", function() -- Line 10
		--[[ Upvalues[1]:
			[1]: var2_upvr (copied, readonly)
		]]
		local any_observeChildrenBrio_result1_upvr = var2_upvr.observeChildrenBrio(Instance.new("Part"))
		local var6_upvw
		it("should not emit anything", function() -- Line 15
			--[[ Upvalues[2]:
				[1]: any_observeChildrenBrio_result1_upvr (readonly)
				[2]: var6_upvw (read and write)
			]]
			any_observeChildrenBrio_result1_upvr:Subscribe(function(arg1) -- Line 16
				--[[ Upvalues[1]:
					[1]: var6_upvw (copied, read and write)
				]]
				var6_upvw = arg1
			end)
			expect(var6_upvw).to.equal(nil)
		end)
	end)
end