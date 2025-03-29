--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.RxBrioUtils.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:36
-- Luau version 6, Types version 3
-- Time taken: 0.003160 seconds

local any_load_result1 = require(game:GetService("ServerScriptService"):FindFirstChild("LoaderUtils", true).Parent).load(script)
local var1_result1_upvr_3 = any_load_result1("RxBrioUtils")
local var1_result1_upvr = any_load_result1("Brio")
local var1_result1_upvr_2 = any_load_result1("Observable")
return function() -- Line 11
	--[[ Upvalues[3]:
		[1]: var1_result1_upvr_3 (readonly)
		[2]: var1_result1_upvr (readonly)
		[3]: var1_result1_upvr_2 (readonly)
	]]
	describe("RxBrioUtils.combineLatest({})", function() -- Line 12
		--[[ Upvalues[2]:
			[1]: var1_result1_upvr_3 (copied, readonly)
			[2]: var1_result1_upvr (copied, readonly)
		]]
		it("should execute immediately", function() -- Line 13
			--[[ Upvalues[2]:
				[1]: var1_result1_upvr_3 (copied, readonly)
				[2]: var1_result1_upvr (copied, readonly)
			]]
			local var8_upvw
			expect(var8_upvw).to.be.ok()
			expect(var1_result1_upvr.isBrio(var8_upvw)).to.equal(true)
			expect(var8_upvw:IsDead()).to.equal(true)
			var1_result1_upvr_3.combineLatest({}):Subscribe(function(arg1) -- Line 16
				--[[ Upvalues[1]:
					[1]: var8_upvw (read and write)
				]]
				var8_upvw = arg1
			end):Destroy()
		end)
	end)
	describe("RxBrioUtils.combineLatest({ value = Observable(Brio(5)) })", function() -- Line 27
		--[[ Upvalues[3]:
			[1]: var1_result1_upvr_3 (copied, readonly)
			[2]: var1_result1_upvr_2 (copied, readonly)
			[3]: var1_result1_upvr (copied, readonly)
		]]
		it("should execute immediately", function() -- Line 28
			--[[ Upvalues[3]:
				[1]: var1_result1_upvr_3 (copied, readonly)
				[2]: var1_result1_upvr_2 (copied, readonly)
				[3]: var1_result1_upvr (copied, readonly)
			]]
			local var14_upvw
			expect(var14_upvw).to.be.ok()
			expect(var1_result1_upvr.isBrio(var14_upvw)).to.equal(true)
			expect(not var14_upvw:IsDead()).to.equal(true)
			expect(var14_upvw:GetValue()).to.be.a("table")
			expect(var14_upvw:GetValue().value).to.equal(5)
			var1_result1_upvr_3.combineLatest({
				value = var1_result1_upvr_2.new(function(arg1) -- Line 30
					--[[ Upvalues[1]:
						[1]: var1_result1_upvr (copied, readonly)
					]]
					arg1:Fire(var1_result1_upvr.new(5))
				end);
				otherValue = 25;
			}):Subscribe(function(arg1) -- Line 37
				--[[ Upvalues[1]:
					[1]: var14_upvw (read and write)
				]]
				var14_upvw = arg1
			end):Destroy()
		end)
	end)
	describe("RxBrioUtils.flatCombineLatest", function() -- Line 50
		--[[ Upvalues[3]:
			[1]: var1_result1_upvr (copied, readonly)
			[2]: var1_result1_upvr_3 (copied, readonly)
			[3]: var1_result1_upvr_2 (copied, readonly)
		]]
		local var21_upvw
		local any_new_result1_upvr = var1_result1_upvr.new(5)
		local var22_upvw
		local var23_upvw = 0
		local any_flatCombineLatest_result1_upvr = var1_result1_upvr_3.flatCombineLatest({
			value = var1_result1_upvr_2.new(function(arg1) -- Line 54
				--[[ Upvalues[2]:
					[1]: any_new_result1_upvr (readonly)
					[2]: var21_upvw (read and write)
				]]
				arg1:Fire(any_new_result1_upvr)
				function var21_upvw(...) -- Line 56
					--[[ Upvalues[1]:
						[1]: arg1 (readonly)
					]]
					arg1:Fire(...)
				end
			end);
			otherValue = 25;
		})
		it("should execute immediately", function() -- Line 66
			--[[ Upvalues[4]:
				[1]: any_flatCombineLatest_result1_upvr (readonly)
				[2]: var22_upvw (read and write)
				[3]: var23_upvw (read and write)
				[4]: var1_result1_upvr (copied, readonly)
			]]
			expect(var23_upvw).to.equal(1)
			expect(var22_upvw).to.be.a("table")
			expect(var1_result1_upvr.isBrio(var22_upvw)).to.equal(false)
			expect(var22_upvw.value).to.equal(5)
			expect(var22_upvw.otherValue).to.equal(25)
			any_flatCombineLatest_result1_upvr:Subscribe(function(arg1) -- Line 67
				--[[ Upvalues[2]:
					[1]: var22_upvw (copied, read and write)
					[2]: var23_upvw (copied, read and write)
				]]
				var22_upvw = arg1
				var23_upvw += 1
			end):Destroy()
		end)
		it("should reset when the brio is killed", function() -- Line 80
			--[[ Upvalues[4]:
				[1]: var23_upvw (read and write)
				[2]: any_new_result1_upvr (readonly)
				[3]: var22_upvw (read and write)
				[4]: var1_result1_upvr (copied, readonly)
			]]
			expect(var23_upvw).to.equal(1)
			any_new_result1_upvr:Kill()
			expect(var23_upvw).to.equal(2)
			expect(var22_upvw).to.be.a("table")
			expect(var1_result1_upvr.isBrio(var22_upvw)).to.equal(false)
			expect(var22_upvw.value).to.equal(nil)
			expect(var22_upvw.otherValue).to.equal(25)
		end)
		it("should allow a new value", function() -- Line 92
			--[[ Upvalues[4]:
				[1]: var23_upvw (read and write)
				[2]: var21_upvw (read and write)
				[3]: var1_result1_upvr (copied, readonly)
				[4]: var22_upvw (read and write)
			]]
			expect(var23_upvw).to.equal(2)
			var21_upvw(var1_result1_upvr.new(70))
			expect(var23_upvw).to.equal(3)
			expect(var22_upvw).to.be.a("table")
			expect(var1_result1_upvr.isBrio(var22_upvw)).to.equal(false)
			expect(var22_upvw.value).to.equal(70)
			expect(var22_upvw.otherValue).to.equal(25)
		end)
		it("should only fire once if we replace the value", function() -- Line 104
			--[[ Upvalues[4]:
				[1]: var23_upvw (read and write)
				[2]: var21_upvw (read and write)
				[3]: var1_result1_upvr (copied, readonly)
				[4]: var22_upvw (read and write)
			]]
			expect(var23_upvw).to.equal(3)
			var21_upvw(var1_result1_upvr.new(75))
			expect(var23_upvw).to.equal(4)
			expect(var22_upvw).to.be.a("table")
			expect(var1_result1_upvr.isBrio(var22_upvw)).to.equal(false)
			expect(var22_upvw.value).to.equal(75)
			expect(var22_upvw.otherValue).to.equal(25)
		end)
	end)
end