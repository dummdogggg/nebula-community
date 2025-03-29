--[[
    Script: Workspace.TeslaLab.Generator.GeneratorEffects
    Type: Script
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:43:52
-- Luau version 6, Types version 3
-- Time taken: 0.001141 seconds

local var1_upvw = 1
local RunService_upvr = game:GetService("RunService")
local function moveWheel_upvr() -- Line 10, Named "moveWheel"
	--[[ Upvalues[2]:
		[1]: RunService_upvr (readonly)
		[2]: var1_upvw (read and write)
	]]
	RunService_upvr.Heartbeat:Connect(function() -- Line 11
		--[[ Upvalues[1]:
			[1]: var1_upvw (copied, read and write)
		]]
		script.Parent.Wheel:PivotTo(script.Parent.Wheel:GetPivot() * CFrame.Angles(math.rad(var1_upvw), 0, 0))
	end)
end
local var5_upvw = false
local TweenService_upvr = game:GetService("TweenService")
local TweenInfo_new_result1_upvr = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
script.Parent.BasePart.PowerPrompt.Triggered:Connect(function() -- Line 16
	--[[ Upvalues[5]:
		[1]: var5_upvw (read and write)
		[2]: TweenService_upvr (readonly)
		[3]: TweenInfo_new_result1_upvr (readonly)
		[4]: moveWheel_upvr (readonly)
		[5]: var1_upvw (read and write)
	]]
	if var5_upvw then
	else
		var5_upvw = true
		TweenService_upvr:Create(script.Parent.PowerSwitch.Pivot, TweenInfo_new_result1_upvr, {
			CFrame = script.Parent.PowerSwitch.Pivot.CFrame * CFrame.Angles(2.0943951023931953, 0, 0);
		}):Play()
		task.spawn(moveWheel_upvr)
		script.Parent.Parent.Dohiggy.Ball.Electricity.Enabled = true
		for i = 100, 500 do
			var1_upvw = i / 100
			task.wait(0.3)
			script.Parent.Parent.Dohiggy.Ball.Electricity.Size = NumberSequence.new(i / 100)
			script.Parent.PowerIndicator.Spedometer.SurfaceGui.ImageLabel.Gauge.Rotation = 120 + (i - 100) / 1.3333333333333333
		end
	end
end)