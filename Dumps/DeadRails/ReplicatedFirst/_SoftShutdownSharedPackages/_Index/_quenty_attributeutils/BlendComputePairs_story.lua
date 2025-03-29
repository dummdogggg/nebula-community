--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.BlendComputePairs.story
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:19
-- Luau version 6, Types version 3
-- Time taken: 0.001575 seconds

local any_load_result1 = require(game:GetService("ServerScriptService"):FindFirstChild("LoaderUtils", true).Parent).load(script)
local var1_result1_upvr_2 = any_load_result1("Maid")
local var1_result1_upvr = any_load_result1("Blend")
return function(arg1) -- Line 10
	--[[ Upvalues[2]:
		[1]: var1_result1_upvr_2 (readonly)
		[2]: var1_result1_upvr (readonly)
	]]
	local any_new_result1_upvr = var1_result1_upvr_2.new()
	local any_State_result1_upvr = var1_result1_upvr.State({'a', 'b', 'c'})
	any_new_result1_upvr:GiveTask(any_State_result1_upvr)
	local tbl = {}
	tbl.Parent = arg1
	tbl[var1_result1_upvr.Children] = {var1_result1_upvr.New("TextButton")({
		Text = "Add";
		AutoButtonColor = true;
		Size = UDim2.new(0, 100, 0, 20);
		[var1_result1_upvr.OnEvent("Activated")] = function() -- Line 24
			--[[ Upvalues[1]:
				[1]: any_State_result1_upvr (readonly)
			]]
			local tbl_2 = {}
			for _, v in pairs(any_State_result1_upvr.Value) do
				table.insert(tbl_2, v)
			end
			table.insert(tbl_2, string.char(#tbl_2 + 97))
			any_State_result1_upvr.Value = tbl_2
		end;
	}), var1_result1_upvr.ComputedPairs(any_State_result1_upvr, function(arg1_2, arg2) -- Line 33
		--[[ Upvalues[1]:
			[1]: var1_result1_upvr (copied, readonly)
		]]
		print("Compute", arg2)
		return var1_result1_upvr.New("TextLabel")({
			Text = tostring(arg2);
			Size = UDim2.new(0, 20, 0, 20);
		})
	end), var1_result1_upvr.New("UIListLayout")({
		Padding = UDim.new(0, 5);
	})}
	any_new_result1_upvr:GiveTask(var1_result1_upvr.New("TextLabel")(tbl):Subscribe())
	return function() -- Line 47
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr (readonly)
		]]
		any_new_result1_upvr:DoCleaning()
	end
end