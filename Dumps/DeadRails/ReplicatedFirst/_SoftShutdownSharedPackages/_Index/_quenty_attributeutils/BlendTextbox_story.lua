--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.BlendTextbox.story
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:27
-- Luau version 6, Types version 3
-- Time taken: 0.001611 seconds

local any_load_result1 = require(game:GetService("ServerScriptService"):FindFirstChild("LoaderUtils", true).Parent).load(script)
local var1_result1_upvr_2 = any_load_result1("Maid")
local var1_result1_upvr = any_load_result1("Blend")
return function(arg1) -- Line 10
	--[[ Upvalues[2]:
		[1]: var1_result1_upvr_2 (readonly)
		[2]: var1_result1_upvr (readonly)
	]]
	local any_new_result1_upvr = var1_result1_upvr_2.new()
	local any_State_result1 = var1_result1_upvr.State("hi")
	local tbl = {
		Size = UDim2.new(1, 0, 1, 0);
		BackgroundTransparency = 1;
	}
	tbl.Parent = arg1
	tbl[var1_result1_upvr.Children] = {var1_result1_upvr.New("TextBox")({
		Size = UDim2.new(0, 200, 0, 50);
		Text = any_State_result1;
		[var1_result1_upvr.OnChange("Text")] = any_State_result1;
		[var1_result1_upvr.OnEvent("Focused")] = function() -- Line 25
			print("Focused")
		end;
		[function(arg1_2) -- Line 29
			return arg1_2.Focused
		end] = function() -- Line 29
			print("Focused (via func)")
		end;
		[function(arg1_3) -- Line 34
			return arg1_3:GetPropertyChangedSignal("Text")
		end] = function() -- Line 34
			print("Property changed from :GetPropertyChangedSignal()")
		end;
	}), var1_result1_upvr.New("TextBox")({
		Size = UDim2.new(0, 200, 0, 50);
		[var1_result1_upvr.OnChange("Text")] = any_State_result1;
		Text = any_State_result1;
	}), var1_result1_upvr.New("UIListLayout")({
		Padding = UDim.new(0, 10);
	})}
	any_new_result1_upvr:GiveTask(var1_result1_upvr.New("Frame")(tbl):Subscribe())
	return function() -- Line 51
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr (readonly)
		]]
		any_new_result1_upvr:DoCleaning()
	end
end